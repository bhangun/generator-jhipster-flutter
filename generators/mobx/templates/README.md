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
For help getting started with Flutter, view our online
[documentation](https://flutter.io/).
