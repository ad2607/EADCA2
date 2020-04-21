// Imports the Flutter Driver API.
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Movie App', () {
    FlutterDriver driver;

    // Connect to the Flutter driver before running any tests.
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    // Close the connection to the driver after the tests have completed.
    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });


    test('add rating to movie', () async {
      final moviePosterListItemFinder = find.byValueKey('moviePosterListItem');
      await driver.waitFor(moviePosterListItemFinder);
      await driver.tap(moviePosterListItemFinder);
      final addRatingButtonFinder = find.byValueKey('addRatingButton');
      await driver.waitFor(addRatingButtonFinder);
      await driver.tap(addRatingButtonFinder);
      final addRatingConfirmButtonFinder = find.byValueKey('addRatingConfirmButton');
      await driver.waitFor(addRatingConfirmButtonFinder);
      await driver.tap(addRatingConfirmButtonFinder);
    });
  });
}
