# CodeUI
This is a simple way to organize your UI from code only without using any Storyboards or XIBs for those who hates them as much as I

# DISCLAIMER
This is **WIP** lib. A lot of things can and probably will change. Any proposals are welcome.

## Requirements
At launch you need to pass AppDelegate window to CodeUI **before** call `window.rootViewController = ...`

## Usage
`UIView.cui` is an entry point to CodeUI engine.

## Device sizes support
### iPhones
1. `.iPhoneSmall` (iPhone 5, iPhone 5S, iPhone 5C, iPhone SE)
2. `.iPhoneOriginal` (iPhone 6, iPhone 6S, iPhone 7, iPhone 8)
3. `.iPhonePlus` (iPhone 6+, iPhone 6S+, iPhone 7+, iPhone 8+)
4. `.iPhoneX` (iPhone X)
5. `.iPhoneSideover` (iPad mini, iPad 9.7", iPad 10.5" sideover small)
6. `.iPhonePlusSideover` (iPad 12.9" sideover small)
7. `.iPhoneHalf` (iPad mini, iPad 9.7", iPad 10.5" half screen)

### iPads
1. `.iPadSmall` (iPad mini, iPad 9.7")
2. `.iPadMedium` (iPad 10.5")
3. `.iPadLarge` (iPad 12.9")
4. `.iPadSideover` (iPad mini, iPad 9.7" sideover large)
5. `.iPadSideover10_5` (iPad 10.5" sideover large)
6. `.iPadSideoverPro` (iPad 12.9" sideover large)
7. `.iPadHalf` (iPad 12.9" half screen)

### Orientations
1. `.portrait`
2. `.landscape`

### NOTE

For `.iPhoneSideover`, `.iPhonePlusSideover`, `.iPadHalf`, `.iPadSideover`, `.iPadSideover10_5`, `.iPadSideoverPro`, `.iPhoneHalf` orientation is always `.portrait`

## Example
You can find example in CodeUI/CoudeUI-Example directory. Though it is not very big right now, it can show you the basics.
