import 'package:equatable/equatable.dart';
class Table extends Equatable {
  final String title;
  final int id;

  const Table({
    required this.title,
    required this.id,
  });

  @override
  List<Object?> get props => [
        title,
        id,
      ];

  static List<Table> categories = [
    Table(
      title: "MainCourse",
      id: 1,
    ),
    Table(
      title: "Apetizer",
      id:2,
    ),
    Table(
      title: "Drinks",
      id: 3,
    ),
    Table(
      title: "Salad",
      id: 4,
    ),
    Table(
      title: "Vorspeisen",
      id: 5,
    ),
    Table(
      title: "Hauptegricht Steaks",
      id:6,
    ),
    Table(
      title: "Acompanamientos Beilagen & Saucen",
      id: 7,
    ),
    Table(
      title: "Arriba- Spezialitäten",
      id:8,
    ),
    Table(
      title: "Faitajs",
      id: 9,
    ),
    Table(
      title: "Spezial Burger (125g.)",
      id: 10,
    ),
    Table(
      title: "Gigant Burger (227g.)",
      id:11,
    ),
    Table(
      title: "Pasta",
      id:12,
    ),
    Table(
      title: "Pescado-Fischgerichte",
      id: 13,
    ),
    Table(
      title: "Kinder-Menü",
      id:14,
    ),
    Table(
      title: "Für den kleinen Hunger",
      id: 15,
    ),
    Table(
      title: "Getränke-Hot Drinks",
      id: 16,
    ),
    Table(
      title: "Long Drinks",
      id: 17,
    ),
  ];
}
