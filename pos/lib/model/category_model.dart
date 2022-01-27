import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final String name;
  final String imageUrl;

  const Category({
    required this.name,
    required this.imageUrl,
  });

  @override
  List<Object?> get props => [
        name,
        imageUrl,
      ];

  static List<Category> categories = [
    Category(
      name: "MainCourse",
      imageUrl: "images/main.jpg",
    ),
    Category(
      name: "Apetizer",
      imageUrl: "images/apetizer.jpg",
    ),
    Category(
      name: "Drinks",
      imageUrl: "images/drink.jpg",
    ),
    Category(
      name: "Salad",
      imageUrl: "images/salad.jpg",
    ),
    Category(
      name: "Vorspeisen",
      imageUrl: "images/chicken.jpg",
    ),
    Category(
      name: "Hauptegricht",
      imageUrl: "images/download.jpg",
    ),
  ];
}
