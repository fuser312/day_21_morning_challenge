import 'main.dart';
import 'package:test/test.dart';

void main() {

  test("Test Case 1",(){
    expect(trackRobot([20, 30, 10, 40]), [-10, 10]);
    expect(trackRobot([]), [0,0]);
  });

  test("Test Case 2",(){
    expect(vendingMachine(200, 7), {'product' : "Crackers", "change" : [50, 20, 10]});
    expect(vendingMachine(88, 4), throwsArgumentError);
    expect(vendingMachine(400, 10), throwsArgumentError);
    expect(vendingMachine(5, 150), throwsArgumentError);
  });




}
