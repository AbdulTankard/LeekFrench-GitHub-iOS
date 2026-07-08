# Leek French for iPhone

This folder is an iOS wrapper for Leek French, an intermediate French grammar practice app. It uses a small native Swift app with `WKWebView` to load the bundled HTML practice app.

## What you need

- A Mac with Xcode installed
- Your iPhone connected to the Mac
- An Apple ID added in Xcode

## How to sideload

1. Open `FrenchGrammar.xcodeproj` in Xcode.
2. Select the `FrenchGrammar` project, then the `FrenchGrammar` target.
3. In **Signing & Capabilities**, choose your Apple developer team.
4. Change the Bundle Identifier if Xcode asks you to, for example:
   `com.yourname.LeekFrench`
5. Select your iPhone as the run destination.
6. Press **Run**.

If you use a free Apple ID, the app may need to be reinstalled periodically. A paid Apple Developer account gives you longer-lived signing.

## Build an unsigned IPA with GitHub

This project includes a GitHub Actions workflow at `.github/workflows/build-unsigned-ipa.yml`.

1. Create a new GitHub repository.
2. Upload the contents of this `FrenchGrammarIOS` folder as the root of that repository.
3. Go to the repository's **Actions** tab.
4. Choose **Build Unsigned IPA**.
5. Click **Run workflow**.
6. When the build finishes, open the workflow run and download the artifact named `LeekFrench-unsigned-ipa`.

The downloaded artifact contains `LeekFrench-unsigned.ipa`.

This IPA is not signed. Some sideloading tools can sign it for you during install, but iOS will not install a completely unsigned app directly.

## App cover and icon

The app page is wired to use this bundled cover image:

`FrenchGrammar/www/assets/leek-french-cover.png`

To use your Leek French cover in the iPhone build, create the `FrenchGrammar/www/assets` folder if it is missing and copy your PNG there with that exact filename.

For the Home Screen icon, add icon PNGs to:

`FrenchGrammar/Assets.xcassets/AppIcon.appiconset`

The required filenames are listed in that folder's `Contents.json`.

## App files

- `FrenchGrammar/www/index.html` is the Leek French practice app.
- `FrenchGrammar/ViewController.swift` loads the local app in a native iOS web view.
- `FrenchGrammar.xcodeproj` is the Xcode project.
