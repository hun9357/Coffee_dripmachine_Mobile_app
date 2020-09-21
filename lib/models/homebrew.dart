class Homebrew {
  int cups;
  String device;
  int result;
  String coffeeType;
  Homebrew(this.cups, this.device) {
    result = 0;
    if (this.device == 'French Press') {
      coffeeType = "course ground";
    } else {
      coffeeType = "medium ground";
    }
  }

  int get waterGram {
    return gramsWaterResult();
  }

  int gramsWaterResult() {
    double regSize = 236.56;
    double temp = regSize * cups;
    result = temp.round();
    return result;
  }

  int get coffeeGrams {
    return gramsCoffeeResult();
  }

  int gramsCoffeeResult() {
    if (device == "French Press") {
      result = (gramsWaterResult() / 14).truncate();
      return result;
    } else {
      result = (gramsWaterResult() / 17).truncate();
      return result;
    }
  }
}
