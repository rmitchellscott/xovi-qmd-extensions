#!/bin/sh
# Usage:
#   migrate-bookmarks-to-toc.sh [--merge] [--dry-run]
#
#   --merge    Merge bookmarks into existing toc.rm (default: skip if exists)
#   --dry-run  Show what would be done without writing anything

XOCHITL_DIR="/home/root/.local/share/remarkable/xochitl"
TOC_HEADER="reMarkable .lines file, version=6          "
MERGE=false
DRY_RUN=false

for arg in "$@"; do
    case "$arg" in
        --merge)  MERGE=true ;;
        --dry-run) DRY_RUN=true ;;
        *) echo "Unknown option: $arg"; exit 1 ;;
    esac
done

bookm_to_toc() {
    awk '{
        s = $0
        gsub(/^[[:space:]]*\{/, "", s)
        gsub(/\}[[:space:]]*$/, "", s)
        if (s == "") { print ""; next }

        out = ""
        n = split(s, chars, "")
        key = ""
        val = ""
        depth = 0
        in_str = 0
        escaped = 0
        state = "key"

        for (i = 1; i <= n; i++) {
            c = chars[i]

            if (escaped) { escaped = 0 }
            else if (c == "\\") { escaped = 1 }
            else if (c == "\"") { in_str = !in_str }

            if (in_str) {
                if (state == "key") key = key c
                else if (state == "val") val = val c
                continue
            }

            if (c == "{") {
                depth++
                if (depth == 1 && state == "val") { val = "{"; continue }
            }
            if (c == "}") {
                depth--
                if (depth == 0 && state == "val") {
                    val = val "}"
                    gsub(/^"/, "", key)
                    gsub(/"$/, "", key)

                    if (val !~ /"deleted"[[:space:]]*:[[:space:]]*true/) {
                        name = ""
                        tmp = val
                        if (sub(/.*"name"[[:space:]]*:[[:space:]]*"/, "", tmp)) {
                            sub(/".*/, "", tmp)
                            name = tmp
                        }
                        entry = "\"" key "\":{\"name\":\"" name "\",\"level\":0}"
                        if (out != "") out = out ","
                        out = out entry
                    }
                    key = ""
                    val = ""
                    state = "key"
                    continue
                }
            }

            if (depth == 0 && !in_str) {
                if (c == ":") {
                    if (state == "key") { state = "val"; continue }
                }
                if (c == ",") {
                    if (state == "key") { state = "key"; key = ""; continue }
                }
                if (state == "key") key = key c
            } else if (state == "val") {
                val = val c
            }
        }
        if (out != "") print "{" out "}"
        else print ""
    }'
}

merge_toc() {
    existing="$1"
    awk -v existing="$existing" '{
        new_json = $0
        ex = existing
        gsub(/^[[:space:]]*\{/, "", ex)
        gsub(/\}[[:space:]]*$/, "", ex)

        nw = new_json
        gsub(/^[[:space:]]*\{/, "", nw)
        gsub(/\}[[:space:]]*$/, "", nw)

        if (ex == "" && nw == "") { print ""; next }
        if (ex == "") { print new_json; next }
        if (nw == "") { print existing; next }

        s = ex
        delete keys
        n = split(s, chars, "")
        depth = 0; in_str = 0; escaped = 0; key = ""
        for (i = 1; i <= n; i++) {
            c = chars[i]
            if (escaped) { escaped = 0; continue }
            if (c == "\\") { escaped = 1; continue }
            if (c == "\"") { in_str = !in_str; continue }
            if (in_str) { key = key c; continue }
            if (c == "{") depth++
            if (c == "}") depth--
            if (depth == 0 && c == ":") {
                keys[key] = 1
                key = ""
            }
            if (depth == 0 && c == ",") key = ""
        }

        additions = ""
        s = nw
        n = split(s, chars, "")
        depth = 0; in_str = 0; escaped = 0
        key = ""; chunk = ""; state = "key"
        for (i = 1; i <= n; i++) {
            c = chars[i]
            chunk = chunk c

            if (escaped) { escaped = 0; continue }
            if (c == "\\") { escaped = 1; continue }
            if (c == "\"") { in_str = !in_str; continue }

            if (!in_str) {
                if (c == "{") depth++
                if (c == "}") {
                    depth--
                    if (depth == 0) {
                        gsub(/^"/, "", key)
                        gsub(/"$/, "", key)
                        if (!(key in keys)) {
                            if (additions != "") additions = additions ","
                            additions = additions chunk
                        }
                        key = ""; chunk = ""; state = "key"
                        continue
                    }
                }
                if (depth == 0) {
                    if (c == ":") { state = "val"; continue }
                    if (c == ",") { key = ""; chunk = ""; state = "key"; continue }
                    if (state == "key" && c != " ") key = key c
                }
            } else if (state == "key") {
                key = key c
            }
        }

        if (additions != "") {
            print "{" ex "," additions "}"
        } else {
            print existing
        }
    }'
}

migrated=0
skipped=0
merged=0
errors=0

for bookm_file in "$XOCHITL_DIR"/*.bookm; do
    [ -f "$bookm_file" ] || continue

    doc_id=$(basename "$bookm_file" .bookm)
    doc_dir="$XOCHITL_DIR/$doc_id"
    toc_file="$doc_dir/toc.rm"

    if [ ! -f "$XOCHITL_DIR/$doc_id.metadata" ]; then
        echo "SKIP $doc_id — no matching document"
        skipped=$((skipped + 1))
        continue
    fi

    [ -d "$doc_dir" ] || mkdir "$doc_dir"

    bookm_json=$(cat "$bookm_file" 2>/dev/null) || continue
    if [ -z "$bookm_json" ] || [ "$bookm_json" = "{}" ]; then
        skipped=$((skipped + 1))
        continue
    fi

    toc_entries=$(echo "$bookm_json" | bookm_to_toc)

    if [ -z "$toc_entries" ]; then
        skipped=$((skipped + 1))
        continue
    fi

    if [ -f "$toc_file" ]; then
        if [ "$MERGE" = false ]; then
            echo "SKIP $doc_id — toc.rm already exists (use --merge to combine)"
            skipped=$((skipped + 1))
            continue
        fi

        existing_json=$(dd if="$toc_file" bs=1 skip=44 2>/dev/null) || existing_json=""

        case "$existing_json" in
            \[cleared:*) existing_json="" ;;
        esac

        if [ -n "$existing_json" ]; then
            toc_entries=$(echo "$toc_entries" | merge_toc "$existing_json")
        fi

        if [ "$DRY_RUN" = true ]; then
            echo "MERGE $doc_id"
        else
            printf '%s%s' "$TOC_HEADER" "$toc_entries" > "$toc_file"
            echo "MERGE $doc_id"
        fi
        merged=$((merged + 1))
    else
        if [ "$DRY_RUN" = true ]; then
            echo "MIGRATE $doc_id"
        else
            printf '%s%s' "$TOC_HEADER" "$toc_entries" > "$toc_file"
            echo "MIGRATE $doc_id"
        fi
        migrated=$((migrated + 1))
    fi
done

echo ""
echo "Done: $migrated migrated, $merged merged, $skipped skipped, $errors errors"
