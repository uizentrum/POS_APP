import 'package:travelapp/models/activity_model.dart';

class Destination {
  late String img;
  late String name;
  late String city;
  late List<Activity> activities;
  late String details;
  static late List<Destination> destination;

  Destination({
    required this.img,
    required this.name,
    required this.city,
    required this.activities,
    required this.details,
  });
}

List<Activity> activities = [
  Activity(
      imgUrl: "assets/destinations/stupa.jpg",
      name: "World Peace Stupa",
      type: "Sightseeing Tour",
      rating: 5,
      price: "Rs 100/",
      priceType: "per hour",
      startTime: ['9:00 am', '11:00am']),
  Activity(
      imgUrl: "assets/destinations/phewalake.jpg",
      name: "Sarangkot",
      type: "Sightseeing Tour",
      rating: 5,
      price: "Rs 150/",
      priceType: "per hour",
      startTime: ['12:00 am', '2:00am']),
  Activity(
      imgUrl: "assets/destinations/sarangkot.jpg",
      name: "Phewa Lake",
      type: "Sightseeing Tour",
      rating: 5,
      price: "Rs 200/",
      priceType: "per hour",
      startTime: ['3:00 am', '5:00am']),
];

List<Destination> destinations = [
  Destination(
      img: "assets/destinations/pokhara.jpg",
      name: "Kaski",
      city: "Pokhara",
      activities: activities,
      details: "Enjoy best trip with Himalayas,Lakes and many more"),
  Destination(
      img: "assets/destinations/bhaktapur.jpg",
      name: "Bhaktapur",
      city: "Bhaktapur",
      activities: activities,
      details: "Enjoy best trip with Himalayas,Lakes and many more"),
  Destination(
      img: "assets/destinations/butwal.jpg",
      name: "Butwal",
      city: "Butwal",
      activities: activities,
      details: "Enjoy best trip with Himalayas,Lakes and many more"),
  Destination(
      img: "assets/destinations/lamjung.jpg",
      name: "Lamjung",
      city: "Lamjung",
      activities: activities,
      details: "Enjoy best trip with Himalayas,Lakes and many more"),
  Destination(
      img: "assets/destinations/bandipur.jpg",
      name: "Bandipur",
      city: "Bandipur",
      activities: activities,
      details: "Enjoy best trip with Himalayas,Lakes and many more"),
  Destination(
      img: "assets/destinations/illam.jpg",
      name: "Ilam",
      city: "Ilam",
      activities: activities,
      details: "Enjoy best trip with Himalayas,Lakes and many more"),
];
