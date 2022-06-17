import 'dart:io';

// Single
/*
class Student{
  final String name;

  Student(this.name);

  void learn() {
    print("Learns information about the student's field");
  }
}

class Parent{
  void traveling() {
    print("The student goes abroad for professional development");
  }
}

class Teacher{
  void teach() {
    print("The student will be a teacher in the future");
  }
}

class Employee{
  void working() {
    print("works in the student field and develops his work");
  }
}
*/
// Open closed
/*
class Area {
  final Rectangle shape;
  Area(this.shape);

  void calculatorArea() {
    print(shape.calculateArea());
  }
}

class Rectangle {
  final double width;
  final double height;

  Rectangle(this.width, this.height);

  double calculateArea() {
    print("I'm Rectangle");
    return width * height;
  }
}
*/
// Problem soling
/*
class Area {
  final Shape shape;

  Area(this.shape);

  void calculateArea(){
    print(shape.calculateArea());
  }
}

abstract class Shape{
  double calculateArea();
}

class Rectangle{
  final double width;
  final double heiht;

  Rectangle(this.width, this.heiht);

  @override
  double calculateArea() {
    return width * heiht;
  }
}

class Square implements Shape {
  final double side;

  Square(this.side);

  @override
  double calculateArea() {
    return side * side;
  }
}

class Triangle implements Shape {
  final double base;
  final double height;

  Triangle(this.base, this.height);

  @override
  double calculateArea() {
    return 0.5 * base * height;
  }
}
*/
////////////////////////////////////////////////////////////////////////////////






















