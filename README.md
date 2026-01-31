# Xovi Extensions

This repo consists of multiple xovi (.qmd) extensions that are QoL improvements to the xochitl interface. 

Extensions have been tested only for the latest reMarkable OS version, though they may work on newer versions.

Beta releases are not tested nor supported.

## Installation

Installation via the [Vellum package manager](https://github.com/vellum-dev/vellum) is recommended. Dependencies are handled automatically.  

### Manual

All extensions require qt-resource-rebuilder, some will require other xovi extensions. See each extension for details. 

Instructions to install xovi can be found [here](https://github.com/asivery/rmpp-xovi-extensions). 

Download the extensions from the folder matching your reMarkable software version. 

Copy the `.qmd` files to `/home/root/xovi/exthome/qt-resource-rebuilder/` and restart xovi.

## Compatibility

<!-- compat:begin -->
| File | reMarkable 1 | reMarkable 2 | Paper Pro | Paper Pro Move |
| ---- | :----------: | :----------: | :-------: | :------------: |
| **betterToc.qmd** | ✅ | ✅ | ✅ | ✅ |
| **createPagesPaperProSize.qmd** | ✅ | ✅ | ✅ | ✅ |
| **createPagesRM2Size.qmd** | ✅ | ✅ | ✅ | ✅ |
| **disableSelectionAutoScroll.qmd** | ✅ | ✅ | ✅ | ✅ |
| **extendListTitleWidth.qmd** | ✅ | ✅ | ✅ | ✅ |
| **fixBatteryIndicator.qmd** | ✅ | ✅ | ✅ | ✅ |
| **fixLightIndicatorGap.qmd** | ❌ | ❌ | ✅ | ✅ |
| **fixPageNumberOnSlider.qmd** | ✅ | ✅ | ✅ | ✅ |
| **gestureContrastToggle.qmd** | ✅ | ✅ | ✅ | ✅ |
| **gestureResetView.qmd** | ✅ | ✅ | ✅ | ✅ |
| **gestureTapToPage.qmd** | ✅ | ✅ | ✅ | ✅ |
| **gestureToolbarHide.qmd** | ✅ | ✅ | ✅ | ✅ |
| **gestureToolbarShow.qmd** | ✅ | ✅ | ✅ | ✅ |
| **hideDevModeIcon.qmd** | ✅ | ✅ | ✅ | ✅ |
| **hideZoomIndicator.qmd** | ✅ | ✅ | ✅ | ✅ |
| **miniLightSleep.qmd** | ✅ | ✅ | ✅ | ✅ |
| **preventNotebookZoomOut.qmd** | ✅ | ✅ | ✅ | ✅ |
| **quickSettingsClockSerif.qmd** | ✅ | ✅ | ✅ | ✅ |
| **quickSettingsScreenshot.qmd** | ✅ | ✅ | ✅ | ✅ |
| **unlockMethodsContent.qmd** | ✅ | ✅ | ✅ | ✅ |
<!-- compat:end -->

## Extensions

### betterToc.qmd
Adds the ability to add, delete*, and edit* Table of Contents entries in notebooks, PDFs, and EPUBs.  
Supports cross-document linking.  
On-disk, ToC data is stored inside the UUID directory for the document in a toc.rm file.  
This syncs between devices via cloud sync.  
EPUB reflows can result in small amounts of drift due to limitations in progress calculation.

<table>
  <tr>
    <td><img src="assets/betterToc-pro.png" height="400"/></td>
    <td><img src="assets/betterToc-move.png" height="400"/></td>
    <td><img src="assets/betterToc-notebook.png" height="400"/></td>
    <td><img src="assets/betterToc-ebook.png" height="400"/></td>
  </tr>
</table>

*Editing and deleting are limited to user-created ToC entries only

### createPagesPaperProSize.qmd
Overrides new page creation to use Paper Pro dimensions. Designed to allow better interoperability between rM2/Move and Paper Pro.  
Designed for use alongside preventNotebookZoomOut.qmd on the Move.

### createPagesRM2Size.qmd
Overrides new page creation to use reMarkable 2 dimensions. Designed to allow better interoperability between Move and reMarkable 2.  
Designed for use alongside preventNotebookZoomOut.qmd on the Move.

### disableSelectionAutoScroll.qmd
Disables the auto scrolling when moving a selection added in 3.24.

### extendListTitleWidth.qmd
Removes extra right margin for titles in list view to fill more of the available space.

### fixBatteryIndicator.qmd
Fixes a bug in 3.24+ with the main navigator battery icon not updating in certain cases.

### fixLightIndicatorGap.qmd
Removes the gap reserved for the frontlight icon when the light is off on Paper Pro and Paper Pro Move.

### fixPageNumberOnSlider.qmd
3.23+  
Restores the z-index for the pageLabel element so it appears on top of the page slider like in previous versions.

### gestureContrastToggle.qmd
Four-finger tap to toggle the contrast filter between Off and Fullpage (PDF/EPUB only).

### gestureResetView.qmd
Three-finger swipe down to reset pan and zoom (returns to 100% zoom, top of page).

### gestureTapToPage.qmd
When the toolbar is hidden, tap the right edge (bottom 65% of screen) to scroll down / advance to the next page. Tap the left edge to scroll up / go to the previous page. Note: PDF links in these tap zones won't activate while in this mode.

### gestureToolbarHide.qmd
Single-finger swipe from the toolbar edge to hide the toolbar.

### gestureToolbarShow.qmd
Single-finger swipe from the toolbar edge to show the toolbar. For horizontal toolbars (top/bottom), the show gesture only works near the toolbar button to avoid conflicting with native gestures.

### hideDevModeIcon.qmd
Hides the developer mode icon next to the battery icon.

### hidePageLabelsInFullscreen.qmd

Hides the page numbers at the bottom of the screen when the toolbar is hidden. On the very last page the page numbers are still shown. To show the page numbers slide up from the bottom to show the page slider.

### hideZoomIndicator.qmd
Auto-hides zoom indicator after 4 seconds (like the scrollbars).

### miniLightSleep.qmd

Replaces the light sleep banner with text saying "Sleeping" at the top right of the screen.

### preventNotebookZoomOut.qmd
Forces all notebook pages to start at 1x zoom with optional horizontal offset. Only affects notebooks, only affects portrait orientation. Designed for the Paper Pro Move.

### quickSettingsClockSerif.qmd

Adds a clock to the quick settings menu in serif font.

### quickSettingsScreenshot.qmd
Adds a screenshot button to the quick settings menu. 
- normal press: closes the menu and takes a screenshot.
- long-press: closes the menu and takes a screenshot with a 5 second delay.

Screenshots will be placed in `/home/root/screenshots`.  
_See required repos for supported devices._

Requires:
- [rm-shot](https://github.com/rmitchellscott/rm-shot)
- [framebuffer-spy](https://github.com/asivery/rm-xovi-extensions)
- [xovi-message-broker](https://github.com/asivery/rm-xovi-extensions)

### unlockMethodsContent.qmd
Bypasses subscription check for using on-device Methods templates and documents.

## Deprecated Extensions

### fixQuickSettingsTempSeparator.qmd 
Removes the duplicate horizontal separator in quick settings when high temp warnings are present on Paper Pro family devices.  
Fixed in 3.24.

## License

- **Original works** are licensed under the MIT License (see [LICENSE](LICENSE)).
