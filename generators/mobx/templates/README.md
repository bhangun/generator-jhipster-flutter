# Kutilang

A new Flutter project.

## Getting Started

### NOTES

In the first generated apps there would error dependancy  to this package.

`import 'package:flutter_gen/gen_l10n/app_localizations.dart';`

but don't worry, when you run the Flutter apps this package is generated and it should be solved.

### Clean and remove all generated files

```
flutter packages pub run build_runner clean
```

### Delete conflicting files

```
flutter packages pub run build_runner watch --delete-conflicting-outputs
```

### Continuous generation with the watch command

```
flutter packages pub run build_runner watch
```

### Mobile Test

#### Unit Test

```
flutter test test/<domain/service>_test.dart
```

#### Widget  Test

```
flutter test
```

#### Integration Testing with driver

```
flutter drive --target=test_driver/app.dart
```

### Web Test

To test for web, determine which browser you want to test against and download the corresponding web driver:

* Chrome: [Download ChromeDriver](https://chromedriver.chromium.org/downloads)
* Firefox: [Download GeckoDriver](https://github.com/mozilla/geckodriver/releases)
* Safari: Safari can only be tested on a Mac; the SafariDriver is already installed on Mac machines.
* Edge [Download EdgeDriver](https://developer.microsoft.com/en-us/microsoft-edge/tools/webdriver/)

Launch the WebDriver, for example:

*content_copy*

```
./chromedriver --port=4444
```

From the root of the project, run the following command:

*content_copy*

```
flutter drive --target=test_driver/app.dart --browser-name=[browser name] --release
```

To simulate different screen dimensions, you can use the `--browser-dimension` argument, for example:

*content_copy*

```
flutter drive --target=test_driver/app.dart --browser-name=chrome --browser-dimension 300,550 --release
```

Will run the tests in the `chrome` browser in a window with dimensions 300 by 550.

### Build APK for Android

```
flutter build apk --target-platform android-arm,android-arm64 --split-per-abi
```

### Build iOS application bundle (Mac OS X host only).

```
flutter build ios
```

### Fastlane Deployment

*[fastlane](https://https://docs.fastlane.tools)* is the easiest way to automate beta deployments and releases for your iOS and Android apps. 🚀 It handles all tedious tasks, like generating screenshots, dealing with code signing, and releasing your application.

##### Documentation

To show the documentation in your terminal, run

```
fastlane action validate_play_store_json_key
```

you can run the following command from your terminal

```
fastlane run validate_play_store_json_key
```

To pass parameters, make use of the `:` symbol, for example

```
fastlane run validate_play_store_json_key parameter1:"value1" parameter2:"value2"
```

### Configure *supply*

Edit your `fastlane/Appfile` and change the `json_key_file` line to have the path to your credentials file:

```
json_key_file "/path/to/your/downloaded/key.json"
```

### Fetch your app metadata

If your app has been created on the Google Play developer console, you're ready to start using *supply* to manage it! Run:

```
fastlane supply init
```

### Version History

#### 0.1.0

Big changes

* remove get_it plugin, just bootstrap class singleton
* remove shared_preferrenced plugin and change touse sembast for database
* remove http plugin and use dio plugin.

