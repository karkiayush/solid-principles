/*
O: open/close principle 

Open/Close principle states that the entities like: classes, modules, function, etc should be open for extension but close for modifications.

First, we might think, what the heck it is. 
So let's try to understand it:
=> Actually it means that you & your team member should be able to add new functionalities to a software system without changing the existing code.
*/
import 'dart:math';

class Shape {
  String type;
  Shape(this.type);
}

// Open for extension
// Close for modification
// It violates the rules of O/C principles since every time a new shape is introduced, it need modification of the AreaCalculator class.
class AreaCalculator {
  String returnCalculatedArea(Shape shape) {
    if (shape.type == 'circle') {
      return "Area of circle: ${3 * 3}";
    } else if (shape.type == 'rectangle') {
      return "Area of rectangel: ${2 * 3}";
    }
    return "out of option: 0";
  }
}

/* To ensure that "OCP" doesn't get violate, we need an interface 


=> Now this class CommonShape & method calculateArea is open for extension but closed for modification*/
abstract interface class CommonShape {
  double calculateArea();
  //? Note : abstract is used for create a class with void(abstract) or concreate method.
  //? interface is used for creating a class with abstract method & the class that implement the interface must override this method.
}

class OcpCircle implements CommonShape {
  double radius;
  OcpCircle(this.radius);

  @override
  double calculateArea() {
    return pi * pow(radius, 2);
  }
}

class OcpRectangle implements CommonShape {
  double length;
  double breadth;
  OcpRectangle(this.length, this.breadth);

  @override
  double calculateArea() {
    return length * breadth;
  }
}

void main(List<String> args) {
  AreaCalculator areaCalculator = new AreaCalculator();
  print(
    areaCalculator.returnCalculatedArea(
      new Shape("rectangle"),
    ),
  );

  print(
    areaCalculator.returnCalculatedArea(
      new Shape("Square"),
    ),
  );

  print(
    areaCalculator.returnCalculatedArea(
      new Shape("circle"),
    ),
  );

  print("*****************************");
  OcpCircle ocpC = new OcpCircle(3);
  double circleArea = ocpC.calculateArea();
  print("Area of circle: ${circleArea.toStringAsFixed(2)}");

  OcpRectangle ocpR = new OcpRectangle(2, 3);
  double rectangleArea = ocpR.calculateArea();
  print("Area of rectangle: $rectangleArea");
}
