import 'dart:io';

// Challenge 1
// Write test cases for the next challenges and make sure to include boundary conditions
// DO THIS FIRST

// Challenge 2
// Track the Robot
// This robot roams around a 2D grid. It starts at (0, 0) facing North.
// After each time it moves, the robot rotates 90 degrees clockwise.
// Given the amount the robot has moved each time, you have to calculate the robot's final position.
// Example
// trackRobot([20, 30, 10, 40]) ➞ [-10, 10]
List<int> trackRobot(List<int> movements) {
  String direction = "North";
  List <int> finalPosition = [0, 0];

  if (movements == []) {
    return [0, 0];
  }
  else if(movements != []){
    for (int i = 0; i < movements.length; i++) {
      if (direction == "North") {
        finalPosition[1] = finalPosition[1] + movements[i];
        direction = "East";
      }
      else if (direction == "East") {
        finalPosition[0] = finalPosition[0] + movements[i];
        direction = "South";
      }

      else if (direction == "South") {
        finalPosition[1] = finalPosition[1] - movements[i];
        direction = "West";
      }

      else if (direction == "West") {
        finalPosition[0] = finalPosition[0] - movements[i];
        direction = "North";
      }
  }
}
  return finalPosition;
}

// Challenge 3
// Vending Machine
// Your task is to create a function that simulates a vending machine.
// Given an amount of money (in cents ¢ to make it simpler) and a productNumber,
// the vending machine should output the correct product name and give back the
// correct amount of change.

// The coins used for the change are the following: [100, 50, 20, 10, 5]

// The return value is a map with 2 properties:
// product: the product name that the user selected.
// change: a list of coins returned (can be empty, must be sorted in descending order).

List<Map> products = [
  { 'number': 1, 'price': 100, 'name': 'Orange juice' },
  { 'number': 2, 'price': 200, 'name': 'Soda' },
  { 'number': 3, 'price': 150, 'name': 'Chocolate snack' },
  { 'number': 4, 'price': 250, 'name': 'Cookies' },
  { 'number': 5, 'price': 180, 'name': 'Gummy bears' },
  { 'number': 7, 'price': 120, 'name': 'Crackers' },
  { 'number': 8, 'price': 220, 'name': 'Potato chips' },
  { 'number': 9, 'price': 80,  'name': 'Small snack' },
];

Map <String, dynamic> vendingMachine(int productNumber, int amount){
  Map product = searchForProduct(productNumber);
  if(product == null){
    print("Invalid Product");
    return null;
  }

  int productValue = product["price"];
  String productName = product["name"];
  int changeValue = amount - productValue;
  if(changeValue < 0){
    print("Insufficient Money");
    return null;
  }


  List <int> coins = [100, 50, 20, 10, 5];
  List<int> returnChange = [];
  coins.forEach((coin) {
    int coinCount = changeValue ~/ coin;
    changeValue = changeValue % coin;
    returnChange.addAll((List.generate(coinCount,(index)=> coin )));

  });

  return {'product': productName,'change': returnChange};
}

Map searchForProduct(int productNumber){
  Map result;
  products.forEach((productMap){
    if(productMap.containsValue(productNumber)){
      result =productMap;
    }
  });
  return result;
}

main() {
  print(trackRobot([20, 30, 10, 40, ]));
  print(vendingMachine(4, 200));
  print(vendingMachine(1, 200));
}
