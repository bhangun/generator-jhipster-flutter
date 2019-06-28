import 'dart:async';
import 'dart:io' show Platform;
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_driver/flutter_driver.dart' as fd ;
import 'package:test/test.dart' as test;

void main() {

   // Sets the output directory for the test results to the
  // FLUTTER_DRIVER_RESULTS env setting, if available
  String resultsDirectory =
    Platform.environment['FLUTTER_DRIVER_RESULTS'] ?? '/tmp';
  print('Results directory is $resultsDirectory');

  test.group('Flutter Driver demo', () {
    fd.FlutterDriver driver;

    test.setUpAll(() async {
      driver = await fd.FlutterDriver.connect();
    });

    test.tearDownAll(() async {
      if (driver != null) {
        await driver.close();
      }
    });


  test.test('measure', () async {
      // Record the performance timeline of things that happen
      fd.Timeline timeline = await driver.traceAction(() async {
        // Find the increment button
        // fd.SerializableFinder incrementButton = fd.find.byValueKey('user_id');

        // Click the button 10 times
        for (int i = 0; i < 10; i++) {
          await driver.enterText('admin');

          // Emulate time for a user's finger between taps
          await new Future<Null>.delayed(new Duration(milliseconds: 200));
        }

      });
      // Summarise the captured data and write to files
        fd.TimelineSummary summary = new fd.TimelineSummary.summarize(timeline);
        summary.writeSummaryToFile('increment_perf',
            destinationDirectory: resultsDirectory, pretty: true);
        summary.writeTimelineToFile('increment_perf',
            destinationDirectory: resultsDirectory, pretty: true);
    });
  });
}

/*
test('measure', () async {
      // Record the performance timeline of things that happen
      fd.Timeline timeline = await driver.traceAction(() async {
        // Find the increment button
        fd.SerializableFinder incrementButton = fd.find.byValueKey(
            'increment_button');

        // Click the button 10 times
        for (int i = 0; i < 10; i++) {
          await driver.tap(incrementButton);

          // Emulate time for a user's finger between taps
          await new Future<Null>.delayed(new Duration(milliseconds: 200));
        }

      });
      // Summarise the captured data and write to files
        fd.TimelineSummary summary = new fd.TimelineSummary.summarize(timeline);
        summary.writeSummaryToFile('increment_perf',
            destinationDirectory: resultsDirectory, pretty: true);
        summary.writeTimelineToFile('increment_perf',
            destinationDirectory: resultsDirectory, pretty: true);
    });
*/