
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  FlutterDriver driver;

  setUpAll(() async {
    driver = await FlutterDriver.connect();
  });
  tearDownAll(() async {
    if (driver != null) {
      driver.close();
    }
  });
  group('Homebrew', () {
    //-------------------happy-path-----------------------------//
    test(
        'should be able to get results for 5 cups of coffee when using French Press',
        () async {
      //tap french press
      final frenchPrsTextFinder = find.byValueKey('French-press-text');
      final frecnPrsCheckBox = find.byValueKey('French-press');

      expect(await driver.getText(frenchPrsTextFinder), "French Press");

      await driver.tap(frecnPrsCheckBox);

      //tap continue
      final contBtn = find.byValueKey('continue-btn');
      await driver.tap(contBtn);

      //tap texfield
      final findInputTextField = find.byValueKey('input-textfield');

      await driver.tap(findInputTextField);

      //enter 5
      await driver.enterText('5');
      await driver.waitFor(find.text('5'));

      //tap done
      await driver.tap(contBtn);
      //expect to see "84g - course ground coffee"
      final coffeeTextFinder = find.byValueKey('coffee-text');
      expect(
          await driver.getText(coffeeTextFinder), '84g - course ground coffee');

      //expect to see "1183g - water"
      final waterTextFinder = find.byValueKey('water-text');
      expect(await driver.getText(waterTextFinder), '1183g - water');

      //tap done
      final doneBtn = find.byValueKey('done-btn');
      await driver.tap(doneBtn);

      //expect to see "What coffee maker are you using?" page
      final firstPageTextFinder = find.byValueKey('device-choose');
      expect(await driver.getText(firstPageTextFinder),
          'What coffee maker are you using?');
    });
    test(
        'should be able to get results for 5 cups of coffee when using Drip machine',
        () async {
      //tap french press
      final dripMachineTextFinder = find.byValueKey('Drip-machine-text');
      final dripMachineCheckBox = find.byValueKey('Drip-machine');

      expect(await driver.getText(dripMachineTextFinder), "Drip Machine");

      await driver.tap(dripMachineCheckBox);

      //tap continue
      final contBtn = find.byValueKey('continue-btn');
      await driver.tap(contBtn);

      //tap texfield
      final findInputTextField = find.byValueKey('input-textfield');

      await driver.tap(findInputTextField);

      //enter 5
      await driver.enterText('5');
      await driver.waitFor(find.text('5'));

      //tap done
      await driver.tap(contBtn);
      //expect to see "69g - course ground coffee"
      final coffeeTextFinder = find.byValueKey('coffee-text');
      expect(
          await driver.getText(coffeeTextFinder), '69g - medium ground coffee');

      //expect to see "1183g - water"
      final waterTextFinder = find.byValueKey('water-text');
      expect(await driver.getText(waterTextFinder), '1183g - water');

      //tap done
      final doneBtn = find.byValueKey('done-btn');
      await driver.tap(doneBtn);

      //expect to see "What coffee maker are you using?" page
      final firstPageTextFinder = find.byValueKey('device-choose');
      expect(await driver.getText(firstPageTextFinder),
          'What coffee maker are you using?');
    });

    //-----------------------------sad-path--------------------------//
    test(
        'When user not choose any coffee machine and press continue nothing should happen',
        () async {
      //without choosing any machine and press continue
      final contBtn = find.byValueKey('continue-btn');
      await driver.tap(contBtn);

      //expect to be on the same page nothing happens
      final textFinder1 = find.byValueKey('French-press-text');
      final textFinder2 = find.byValueKey('Drip-machine-text');

      expect(await driver.getText(textFinder1), 'French Press');
      expect(await driver.getText(textFinder2), 'Drip Machine');
    });
    test(
        'When user choose coffee maker and put 0 in textfield on cups page and press continue, nothing should happen',
        () async {
      //tap french press
      final frenchPrsTextFinder = find.byValueKey('French-press-text');
      final frecnPrsCheckBox = find.byValueKey('French-press');

      expect(await driver.getText(frenchPrsTextFinder), "French Press");

      await driver.tap(frecnPrsCheckBox);

      //tap continue
      final contBtn = find.byValueKey('continue-btn');
      await driver.tap(contBtn);

      //tap texfield
      final findInputTextField = find.byValueKey('input-textfield');

      await driver.tap(findInputTextField);

      //enter 5
      await driver.enterText('00');
      await driver.waitFor(find.text('00'));

      //press continue
      await driver.tap(contBtn);

      //Page will not navigate
      final cupsTexFinder = find.byValueKey('how-many-cups');
      expect(
          await driver.getText(cupsTexFinder), 'How many cups would you like?');
    });
  });
}
