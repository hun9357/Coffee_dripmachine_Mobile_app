
import 'package:test/test.dart';
import 'package:homebrew_sum2/models/homebrew.dart';

void main() {
  group("User chose French Press and entered 5 cups", () {
    test(
        'should give 1183 when user input 5 number of cups and coffee grams of 84',
        () {
      int cups = 5;
      String device = "French Press";
      final homeBrew = Homebrew(cups, device);
      expect(homeBrew.waterGram, 1183);
      expect(homeBrew.coffeeGrams, 84);
    });
  });
  group("User chose Drip Machine and entered 5 cups", () {
    test(
        'should give 1183 when user input 5 number of cups and coffee grams of 69',
        () {
      int cups = 5;
      String device = "Drip Machine";
      final homeBrew = Homebrew(cups, device);
      expect(homeBrew.waterGram, 1183);
      expect(homeBrew.coffeeGrams, 69);
    });
  });
}
