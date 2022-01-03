// [dart]Loops notes

main() {
  // for (int i = 2; i < 10; i += 2) {
  //   print(i);
  // }
  // bottlesOfBeer();
  // pieMaker();

  // Challenge
  List<int> ticket1 = [45, 2, 9, 18, 12, 33];
  List<int> ticket2 = [41, 17, 26, 32, 7, 35];
  checkNumbers(ticket1);
}

// Bottle of Beer Example
void bottlesOfBeer() {
  for (int i = 99; i >= 0; i--) {
    if (i > 0) {
      print("$i bottles of beer on the wall, $i bottles of beer.");
      print(
          "Take one down and pass it around, ${i - 1} bottles of beer on the wall");
    } else {
      print(
          "No more bottles of beer on the wall, no more bottles of beer. Go to the store and buy some more, 99 bottles of beer on the wall.");
    }
  }
}

// Fruit Pie Example
List<String> fruits = ['apple', 'pear', 'orange', 'grape', 'banana'];
void pieMaker() {
  for (String fruit in fruits) {
    print(fruit + 'pie');
  }
}

// Challenge
List<int> winningNumbers = [12, 6, 34, 22, 41, 9];
void checkNumbers(List<int> myNumbers) {
  int matches = 0;
  for (int myNum in myNumbers) {
    // print(myNum);
    for (int winningNum in winningNumbers) {
      // print('my number = $myNum');
      // print('winning number = $winningNum');
      if (winningNum == myNum) {
        // print('Got a Match!');
        matches++;
      }
    }
  }
  print("i got $matches matches!");
}
