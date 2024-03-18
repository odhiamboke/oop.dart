import 'dart:io';

abstract class Shape {
  double get area;
}

class Rectangle implements Shape {
  final double width;
  final double height;

  Rectangle(this.width, this.height);

  @override
  double get area => width * height;
}

class Square implements Shape {
  final double sideLength;

  Square(this.sideLength);

  @override
  double get area => sideLength * sideLength;
}

Future<void> readShapeFromFile(String filename) async {
  final file = File(filename);

  // Read the contents of the file
  final contents = await file.readAsString();

  // Split the contents into lines
  final lines = contents.split('\n');

  // Parse the first line as the width and height of a rectangle
  final width = double.parse(lines[0].split(' ')[0]);
  final height = double.parse(lines[0].split(' ')[1]);
  final rectangle = Rectangle(width, height);

  // Parse the second line as the side length of a square
  final sideLength = double.parse(lines[1]);
  final square = Square(sideLength);

  print('Rectangle with area ${rectangle.area} read from file');
  print('Square with area ${square.area} read from file');
}

void main() async {
  final rectangle = Rectangle(5.0, 10.0);
  final square = Square(4.0);

  print('Rectangle with area ${rectangle.area} created');
  print('Square with area ${square.area} created');

  await readShapeFromFile('shape.txt');
}