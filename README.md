# Xovi Extensions

This repo consists of multiple xovi (.qmd) extensions that are QoL improvements to the xochitl interface. These require qt-resource-rebuilder.so to work.

Instructions to install xovi can be found [here](https://github.com/asivery/rmpp-xovi-extensions/blob/master/INSTALL.MD). 

Download the extensions from the folder matching your reMarkable software version. 

Copy the `.qmd` files to `/home/root/xovi/exthome/qt-resource-rebuilder/` and restart xovi.

Some of the QMD files in this repo are my own and some are modifications I've made to extensions created by others in the community. Modifications will link to the original author.

Extensions have been tested only for the latest reMarkable OS version, though they may work on newer versions.

Beta releases are not tested nor supported.

<!-- compat:begin -->
| File | reMarkable 1 | reMarkable 2 | Paper Pro | Paper Pro Move |
| ---- | ------------ | ------------ | --------- | -------------- |
| createPagesPaperProSize.qmd | ✅ | ✅ | ✅ | ✅ |
| createPagesRM2Size.qmd | ✅ | ✅ | ✅ | ✅ |
| disableSelectionAutoScroll.qmd | ✅ | ✅ | ✅ | ✅ |
| extendListTitleWidth.qmd | ✅ | ✅ | ✅ | ✅ |
| fixPageNumberOnSlider.qmd | ✅ | ✅ | ✅ | ✅ |
| gestures.qmd | ✅ | ✅ | ✅ | ✅ |
| hideDevModeIcon.qmd | ✅ | ✅ | ✅ | ✅ |
| hidePageLabelsInFullscreen.qmd | ✅ | ✅ | ✅ | ✅ |
| hideZoomIndicator.qmd | ✅ | ✅ | ✅ | ✅ |
| miniLightSleep.qmd | ✅ | ✅ | ✅ | ✅ |
| preventNotebookZoomOut.qmd | ✅ | ✅ | ✅ | ✅ |
| quickSettingsClock.qmd | ✅ | ✅ | ✅ | ✅ |
| quickSettingsScreenshot.qmd | ✅ | ✅ | ✅ | ✅ |
| unlockMethodsContent.qmd | ✅ | ✅ | ✅ | ✅ |
<!-- compat:end -->

## Original Extensions

### createPagesPaperProSize.qmd
Override new page creation to use Paper Pro dimensions. Designed to allow better interoperability between rM2/Move and Paper Pro.  
Designed for use alongside preventNotebookZoomOut.qmd on the Move.

### createPagesRM2Size.qmd
Override new page creation to use reMarkable 2 dimensions. Designed to allow better interoperability between Move and reMarkable 2.  
Designed for use alongside preventNotebookZoomOut.qmd on the Move.

### disableSelectionAutoScroll.qmd
Disable the auto scrolling when moving a selection added in 3.24.

### extendListTitleWidth.qmd
Remove extra right margin for titles in list view to fill more of the available space.

### fixPageNumberOnSlider.qmd
3.23 and 3.24 only.  
Restores the z-index for the pageLabel element so it appears on top of the page slider like in previous versions.

### hideDevModeIcon.qmd
Hide the developer mode icon next to the battery icon.

### hideZoomIndicator.qmd
Auto-hide zoom indicator after 4 seconds (like the scrollbars).

### preventNotebookZoomOut.qmd
Forces all notebook pages to start at 1x zoom with optional horizontal offset. Only affects notebooks, only affects portrait orientation. Designed for the Paper Pro Move.

### quickSettingsScreenshot.qmd
Adds a screenshot button to the quick settings menu. 
- normal press: closes the menu and take a screenshot.
- long-press: closes the menu and take a screenshot with a 5 second delay.

Screenshots will be placed in `/home/root/screenshots`.  
_See required repos for supported devices._

Requires:
- [rm-shot](https://github.com/rmitchellscott/rm-shot)
- [framebuffer-spy](https://github.com/asivery/rm-xovi-extensions)
- [xovi-message-broker](https://github.com/asivery/rm-xovi-extensions)

### unlockMethodsContent.qmd
Bypass subscription check for using on-device Methods templates and documents.

## Deprecated Extensions

### fixQuickSettingsTempSeparator.qmd 
Removes the duplicate horizontal separator in quick settings when high temp warnings are present on Paper Pro family devices.  
Fixed in 3.24.

## Modified Extensions

### gestures.qmd
**Original**: https://github.com/ingatellent/xovi-qmd-extensions

Add the following gestures and tap areas:
- Swipe down with three fingers to reset pan and zoom, i.e. to scroll to top of the page and zoom to 100%
- Swipe out and in from the toolbar to show/hide the toolbar - for horizontal toolbar, the swipe only works at the show toolbar button (in order not to interfere with native gestures)
- When the toolbar is hidden, tap on the bottom right to scroll down, and to change to the next page if you are already nearly at the bottom) (no scrollbar shown)
- When the toolbar is hidden, tap on the bottom left to scroll up, and to change to the previous page if you are already nearly at the top) (no scrollbar shown)

PDF links in the tap area cannot be used while the toolbar is closed, show the toolbar to restore link functionality.

**Modifications I've made**
 - Removed the 4-finger contrast filter gesture

### hidePageLabelsInFullscreen.qmd

**Original**: https://github.com/ingatellent/xovi-qmd-extensions

Hide the page numbers at the bottom of the screen when the toolbar is hidden. On the very last page the page numbers are still shown. To show the page numbers slide up from the bottom to show the page slider.

**Modifications I've made**
 - Fix for page number not appearing when the toolbar is open or in the page slider on 3.23

### miniLightSleep.qmd
**Original**: https://github.com/StarNumber12046/xovi-qmd-extensions

Replaces the light sleep banner with text saying "Sleeping" at the top right of the screen

**Modifications I've made**
- Changed text from "Zzz..." to "Sleeping"
- Added white background to the sleeping text

### quickSettingsClock.qmd
**Original**: https://github.com/StarNumber12046/xovi-qmd-extensions

A clock in the quick settings menu

**Modifications I've made**
- Use serif font

## License

- **Original works** are licensed under the MIT License (see [LICENSE](LICENSE)).
- **Derivative works** retain attribution to their original authors - see individual file headers for details.
