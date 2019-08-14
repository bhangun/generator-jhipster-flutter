# jh_flutter_sample

A new Flutter project.

## Getting Started



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

### Testing flutter with driver
```
flutter drive --target=test_driver/app.dart
```
### Build APK for Android
```
flutter build apk --target-platform android-arm,android-arm64 --split-per-abi
```

### Build iOS application bundle (Mac OS X host only).
```
flutter build ios
```

For help getting started with Flutter, view our online
[documentation](https://flutter.io/).
