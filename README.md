# CodeUI
This is a simple way to organize your UI from code only without using any Storyboards or XIBs for those who hates them as much as I

# DISCLAIMER
This is **WIP** lib. A lot of things can change in time. Any proposals are welcome.

## Requirements
You need to use CUIViewController as your superclass for your UIVIewController subclasses

## Usage
In AppDelegate in `func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?)` you must set `CUI.shared.window = window` **before** `window.makeKeyAndVisible()` call.

After that every view will have a `cui` property to call where you will find tons of helper funcs to setup your UI for every type of device **including** iPad multitask dimensions

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
