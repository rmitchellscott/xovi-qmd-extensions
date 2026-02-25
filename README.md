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
| **settingsRmSyncRestart.qmd** | ✅ | ✅ | ✅ | ✅ |
| **stylusButtonEraser.qmd** | ✅ | ✅ | ✅ | ✅ |
| **stylusButtonUndoRedo.qmd** | ✅ | ✅ | ✅ | ✅ |
| **tocFromSelection.qmd** | ❌ | ❌ | ❌ | ❌ |
| **unlockMethodsContent.qmd** | ✅ | ✅ | ✅ | ✅ |
<!-- compat:end -->

## Extensions

### betterToc.qmd 
[![vellum](https://img.shields.io/badge/vellum-bettertoc-purple)](https://vellum.delivery/#/package/bettertoc/)

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

### createPagesPaperProSize
[![vellum](https://img.shields.io/badge/vellum-createpages--paperpro-purple)](https://vellum.delivery/#/package/createpages-paperpro/) 

Overrides new page creation to use Paper Pro dimensions. Designed to allow better interoperability between rM2/Move and Paper Pro.  
Designed for use alongside preventNotebookZoomOut.qmd on the Move.

### createPagesRM2Size
[![vellum](https://img.shields.io/badge/vellum-createpages--rm2-purple)](https://vellum.delivery/#/package/createpages-rm2/)

Overrides new page creation to use reMarkable 2 dimensions. Designed to allow better interoperability between Move and reMarkable 2.  
Designed for use alongside preventNotebookZoomOut.qmd on the Move.

### disableSelectionAutoScroll
[![vellum](https://img.shields.io/badge/vellum-disable--selection--autoscroll-purple)](https://vellum.delivery/#/package/disable-selection-autoscroll/)

Disables the auto scrolling when moving a selection added in 3.24.

### extendListTitleWidth
[![vellum](https://img.shields.io/badge/vellum-extend--list--title--width-purple)](https://vellum.delivery/#/package/extend-list-title-width/)

Removes extra right margin for titles in list view to fill more of the available space.

### fixBatteryIndicator
[![vellum](https://img.shields.io/badge/vellum-fix--battery--indicator-purple)](https://vellum.delivery/#/package/fix-battery-indicator/)

Fixes a bug in 3.24+ with the main navigator battery icon not updating in certain cases.

### fixLightIndicatorGap
[![vellum](https://img.shields.io/badge/vellum-fix--light--indicator--gap-purple)](https://vellum.delivery/#/package/fix-light-indicator-gap/)

Removes the gap reserved for the frontlight icon when the light is off on Paper Pro and Paper Pro Move.

### fixPageNumberOnSlider
[![vellum](https://img.shields.io/badge/vellum-fix--page--number--on--slider-purple)](https://vellum.delivery/#/package/fix-page-number-on-slider/)

3.23+  
Restores the z-index for the pageLabel element so it appears on top of the page slider like in previous versions.

### hideDevModeIcon
[![vellum](https://img.shields.io/badge/vellum-hide--dev--mode--icon-purple)](https://vellum.delivery/#/package/hide-dev-mode-icon/)

Hides the developer mode icon next to the battery icon.

### hideZoomIndicator
[![vellum](https://img.shields.io/badge/vellum-hide--zoom--indicator-purple)](https://vellum.delivery/#/package/hide-zoom-indicator/)

Auto-hides zoom indicator after 4 seconds (like the scrollbars).

### miniLightSleep
[![vellum](https://img.shields.io/badge/vellum-mini--light--sleep-purple)](https://vellum.delivery/#/package/mini-light-sleep/)

Replaces the light sleep banner with text saying "Sleeping" at the top right of the screen.

### preventNotebookZoomOut
[![vellum](https://img.shields.io/badge/vellum-prevent--notebook--zoom--out-purple)](https://vellum.delivery/#/package/prevent-notebook-zoomout/)

Forces all notebook pages to start at 1x zoom with optional horizontal offset. Only affects notebooks, only affects portrait orientation. Designed for the Paper Pro Move.

### quickSettingsClockSerif
[![vellum](https://img.shields.io/badge/vellum-quicksettings--clock--serif-purple)](https://vellum.delivery/#/package/quicksettings-clock-serif/)

Adds a clock to the quick settings menu in serif font.

### quickSettingsScreenshot
[![vellum](https://img.shields.io/badge/vellum-quicksettings--screenshot-purple)](https://vellum.delivery/#/package/quicksettings-screenshot/)

Adds a screenshot button to the quick settings menu. 
- normal press: closes the menu and takes a screenshot.
- long-press: closes the menu and takes a screenshot with a 5 second delay.

Screenshots will be placed in `/home/root/screenshots`.  
_See required repos for supported devices._

Requires:
- [rm-shot](https://github.com/rmitchellscott/rm-shot)
- [framebuffer-spy](https://github.com/asivery/rm-xovi-extensions)
- [xovi-message-broker](https://github.com/asivery/rm-xovi-extensions)

### settingsRmSyncRestart
[![vellum](https://img.shields.io/badge/vellum-settings--rmsync--restart-purple)](https://vellum.delivery/#/package/settings-rmsync-restart/)

Adds a button to the Settings > Cloud page to restart the sync service.  
Requires qt-command-executor.

### stylusButtonEraser
[![vellum](https://img.shields.io/badge/vellum-stylus--button--eraser-purple)](https://vellum.delivery/#/package/stylus-button-eraser/)

Erases when stylus side button is held on rM1 and rM2.  
Requires [rm-stylus](https://github.com/rmitchellscott/rm-stylus)

### unlockMethodsContent
[![vellum](https://img.shields.io/badge/vellum-unlock--methods--content-purple)](https://vellum.delivery/#/package/unlock-methods-content/)

Bypasses subscription check for using on-device Methods templates and documents.

## Deprecated Extensions

### fixQuickSettingsTempSeparator
Removes the duplicate horizontal separator in quick settings when high temp warnings are present on Paper Pro family devices.  
Fixed in 3.24.

## License

- **Original works** are licensed under the MIT License (see [LICENSE](LICENSE)).
