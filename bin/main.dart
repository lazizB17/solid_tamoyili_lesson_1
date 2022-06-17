import 'dart:io';
import 'dart:math';
import 'package:test/expect.dart';
import 'student.dart';
////////////////////////////////////////////////////////////////////////////////
// Task leetcode
/*
void main(){
  // leetcode 1-misol
  stdout.write("Matn kiriting: ");
  String str = stdin.readLineSync()!;
  print(isValidPolyndrom(str));
}

bool isValidPolyndrom(String str){
  String s = str.toLowerCase();
  List list = List.from(s.codeUnits);
  for (int i=0;i<list.length;i++) {
    if (list[i] == 32 || list[i] == 44 || list[i] == 46 || list[i] == 58){
      list.remove(list[i]);
    }
    if(list[i]==32){
      list.remove(list[i]);
    }

  }
  print(list);
  String result='';
  for(int item in list){
    result+=String.fromCharCode(item);
  }
  String result2=List.from(result.split('').reversed).join();
  return result==result2;
}
*/
/*
void main() {
  // leetcode 2-misol
  stdout.write("Matn kiriting: ");
  String str = stdin.readLineSync()!;
  List list = List.from(str.codeUnits);
  int counter = 0;
  for (int i = 0; i < list.length; i++) {
    if (list[i] == 32) {
      counter++;
    }
  }
  print(counter);
}
*/
/*
void main() {
  // leetcode 3-misol
  stdout.write("1-sonni kiriting: ");
  String num1 = stdin.readLineSync()!;
  stdout.write("2-sonni kiriting: ");
  String num2 = stdin.readLineSync()!;
  int remainder = 0;
  int remaider2 = 0;
  int result;
  for (int i = 0; i < num1.length; i++) {
    for (int j = 0; j < 10; j++) {
      if (j.toString() == num1[i]) {
        remainder *= 10;
        remainder += j;
      }
    }
  }

  for (int i = 0; i < num2.length; i++) {
    for (int j = 0; j < 10; j++) {
      if (j.toString() == num2[i]) {
        remaider2 *= 10;
        remaider2 += j;
      }
    }
  }
  result = remainder * remaider2;
  print(result);
}
*/
////////////////////////////////////////////////////////////////////////////////
/// Single Responsibility
// False
/*
class User {
  final String name;
  final int age;
  final bool isMember;
  final String email;

  User(this.name, this.age, this.isMember, this.email);

  bool canFollowMembers(){
    return this.isMember;
  }

  void UserSignIn() {
    verifyEmail();
  }

  void UserSignOut(){}

  bool verifyEmail() {
    return this.email.contains("@");
  }
}
*/

// True
/*
class User{
  final String name;
  final int age;
  final bool isMember;
  final String email;

  User(this.name, this.age, this.isMember, this.email);

  bool canFollowMember(){
    return this.isMember;
  }
}

mixin Validators {
  bool verifyEmail(String email) {
    return email.contains("@");
  }
}

class UserAuth with Validators {
  void UserSignIn(User user){
    verifyEmail(user.email);
  }

  void UserSignOut(User user) {}
}
*/
////////////////////////////////////////////////////////////////////////////////
/// Open-Close principe
// False
/*
void main(){
  Rectangle rec = Rectangle(10.0, 12.2);
  Area a = Area(rec);
  a.calculateArea();
}

class Area {
  final Rectangle shape;
  Area(this.shape);

  void calculateArea() {
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

// False
/*
void main(){
  Rectangle rect = Rectangle(12.0, 18.0);
  Area a = Area(rect);
  a.calculateArea();
  Square sq = Square(12.0);
  Area area = Area(sq);
  area.calculateArea();
}

class Area {
  final Object shape;

  Area(this.shape);

  void calculateArea(){
    if(shape is Rectangle) {
      Rectangle rect = shape as Rectangle;
      print(rect.calculateArea());
    } else if (shape is Square) {
      Square sq = shape as Square;
      print(sq.calculateArea());
    } else {}
  }
}

class Square {
  final double side;

  Square(this.side);

  double calculateArea() {
    print("I'm Square");
    return side * side;
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

// True
/*
void main() {
  Rectangle rect = Rectangle(12.0, 18.0);
  Area a = Area(rect);
  a.calculateArea();
  Square sq = Square(12.0);
  Area area = Area(sq);
  area.calculateArea();
}

class Area {
  final Shape shape;

  Area(this.shape);

  void calculateArea() {
    print(shape.calculateArea());
  }
}

abstract class Shape {
  double calculateArea();
}

class Rectangle implements Shape {
  final double width;
  final double height;

  Rectangle(this.width, this.height);

  @override
  double calculateArea() {
    print("I'm Rectangle");
    return width * height;
  }
}

class Square implements Shape {
  final double side;

  Square(this.side);

  @override
  double calculateArea() {
    print("I'm Square");
    return side * side;
  }
}

class Triangle implements Shape {
  final double base;
  final double height;

  Triangle(this.base, this.height);

  @override
  double calculateArea() {
    print("I'm Triangle");
   return  0.5 * base * height;
  }
}
*/
////////////////////////////////////////////////////////////////////////////////
/// Listkov Substitution principe
// False
/*
void main(){
  Rectangle rect = Rectangle(8, 5);
  print(rect.calculateArea());   // OP = 40
  Square sq = Square(5, 5);
  print(sq.calculateArea());   // OP = 25
  Rectangle square = Square(8, 5);
  print(square.calculateArea());   // OP = 64
}

class Rectangle {
  final int weight;
  final int height;

  Rectangle(this.weight, this.height);

  int calculateArea() {
    print("Rectangle: ");
    return weight * height;
  }
}

class Square extends Rectangle {
  final int width;
  final int height;

  Square(this.width, this.height) : super(width, height);

  @override
  int calculateArea() {
    print("Square: ");
    return width * width;
  }
}
*/

// True
/*
void main(){
  Shape rect = Rectangle(8, 5);
  print(rect.calculateArea());  // OP = 40

  Shape square = Square(5);
  print(square.calculateArea());  // OP = 25

  Shape squr = Square(8);
  print(squr.calculateArea());   // OP = 64
}

abstract class Shape {
  int calculateArea();
}

class Rectangle implements Shape {
  final int width;
  final int height;

  Rectangle(this.width, this.height);

  @override
  int calculateArea() {
    print("Rectangle: ");
    return width * height;
  }
}

class Square implements Shape {
  final int side;

  Square(this.side);

  @override
  int calculateArea() {
    print("Square: ");
    return side * side;
  }
}
*/
////////////////////////////////////////////////////////////////////////////////
/// Interface Segregate principe
// False
/*
void main() {
  Shape cube = Cube(3);
  print(cube.calculateArea());
  print(cube.calculateSurfaceArea());
  print(cube.calculateVolume());

  Shape rectangle = Rectangle(5, 8);
  print(rectangle.calculateArea());
  print(rectangle.calculateSurfaceArea());
  print(rectangle.calculateVolume());
}

abstract class Shape {
  double calculateArea();
  double calculateSurfaceArea();
  double calculateVolume();
}

class Rectangle implements Shape {
  final double width;
  final double height;

  Rectangle(this.width, this.height);

  @override
  double calculateArea() {
    return width * height;
  }

  @override
  double calculateSurfaceArea() {
    throw Exception("I'm a 2 Dimensional object. No Surface Area");
  }

  @override
  double calculateVolume(){
    throw Exception("I'm a 2 Dimensional object. Has No Volue");
  }
}

class Cube implements Shape {
  final double side;

  Cube(this.side);

  @override
  double calculateArea() {
    throw Exception("I'm a 3 Dimensional object. I have Surface Area");
  }

  @override
  double calculateSurfaceArea() {
    return 6 * (side * side);
  }

  @override
  double calculateVolume() {
    return side * side * side;
  }
}
*/

// True
/*
void main(){
  ThreeDimensionalShape cube = Cube(3);
  print(cube.calculateSurfaceArea());
  print(cube.calculateVolume());

  TwoDimensionalShape rect = Rectangle(5, 8);
  print(rect.calculateArea());
}

abstract class ThreeDimensionalShape {
  double calculateSurfaceArea();
  double calculateVolume();
}

abstract class TwoDimensionalShape {
  double calculateArea();
}

class Rectangle implements TwoDimensionalShape {
  final double width;
  final double height;

  Rectangle(this.width, this.height);

  @override
  double calculateArea() {
    print("Rectangle Area: ");
    return width * height;
  }
}

class Cube implements ThreeDimensionalShape {
  final double side;

  Cube(this.side);

  @override
  double calculateSurfaceArea() {
    print("Cube Surface: ");
    return 6 * (side * side);
  }

  @override
  double calculateVolume() {
    print("Cube Volume: ");
    return side * side * side;
  }
}
*/
////////////////////////////////////////////////////////////////////////////////
/// Dependency Inversion principle
// False
/*
void main() {
  UserBloc userBloc = UserBloc();
  userBloc.getUserById();
  userBloc.getTopTenUserPosts();
}

class UserBloc {
  final NetworkCalls _networkCalls = NetworkCalls();

  void getUserById() {
    _networkCalls.getUserById(1);
  }

  void getTopTenUserPosts(){
    _networkCalls.getTopTenUserPosts();
  }
}

class NetworkCalls {
  Future getUserById(int id) async {
    print("NetworkCalls: $id");
  }

  Future getTopTenUserPosts() async {
    print("One to Ten");
  }
}
*/

// True
/*
void main() {
  // Here UserBloc initialize NetworkTask as NetworkCall
  // and pass as a param t UserBloc
  NetworkTask networkTask = NetworkCalls();
  UserBloc userBloc = UserBloc(networkTask);

  userBloc.getUserById();
  userBloc.getTopTenUserPosts();
}

class UserBloc {
  // Here UserBloc depends on abstraction rather
  // that concrete class for its implementation
  final NetworkTask networkTask;

  UserBloc(this.networkTask);

  void getUserById() {
    networkTask.getUserById(1);
  }

  void getTopTenUserPosts(){
    networkTask.getTopTenUserPosts();
  }
}

abstract class NetworkTask {
  Future getUserById(int id);
  Future getTopTenUserPosts();
}

class NetworkCalls implements NetworkTask {
  Future getUserById(int id) async {
    print("NetworkCalls: $id");
  }

  Future getTopTenUserPosts() async {
    print("One to Ten");
  }
}
*/
////////////////////////////////////////////////////////////////////////////////
/// Home Tasks

void main() {
  MobileProgramming mobProg = MobileProgramming();
  mobProg.mobProgram();

  Flutter flutter = Flutter("Flutter");
  flutter.mobProgram();
  flutter.backends();
}

class MobileProgramming {
  void mobProgram(){
    print("Mobile programmer created programs");
  }
}

class Flutter extends MobileProgramming with Backend{
  final String flutter;

  Flutter(this.flutter);

  @override
  void mobProgram() {
    print("$flutter created for ios and android programs");
  }
}

mixin Backend {
  void backends(){
    print("Backend programmers creates the bottoms");
  }
}



































