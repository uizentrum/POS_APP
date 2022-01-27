import 'package:cloud_firestore/cloud_firestore.dart';

class VendorApi {
  static String selectVendorCoverImage =
      "https://image.freepik.com/free-photo/laundry-basket-with-dirty-clothes-with-washing-drying-machines-background_130111-213.jpg";

  static getVendor() {}

  static List getDummyServices() {
    var services = [
      {
        'image':
            'https://image.freepik.com/free-photo/mother-with-daughter-doing-laundry-self-serviece-laundrette_1303-19547.jpg',
        'title': 'Washing',
        'description': 'Traditional men’s haircut. Using clippers and scissors',
        'price': '\$8',
      },
      {
        'image':
            'https://image.freepik.com/free-photo/clothes-dry-cleaning-service-worker-returning-shirts-customer_151013-6165.jpg',
        'title': 'Washing + Ironing',
        'description':
            'A service for longer and more styled beards – sculpt the beard, neckline foiled, finished with hot towel and cheekbones razored',
        'price': '\$5',
      },
      {
        'image':
            'https://image.freepik.com/free-photo/unrecognizable-man-ironing-shirts-laundry-home_1098-17141.jpg',
        'title': 'Dress Washing Service',
        'description':
            'Traditional men’s haircut and A service for longer and more styled beards',
        'price': '\$12'
      },
    ];
    return services;
  }

  static List getDummyGalleries() {
    var galleries = [
      {
        'image':
            'https://image.freepik.com/free-photo/male-worker-cleaning-carpet-automatic-washing-machine-equipment-dryer-laundry-room_130111-4351.jpg',
      },
      {
        'image':
            'https://image.freepik.com/free-photo/hangers-with-clean-shirts-laundry-closeup_392895-7877.jpg',
      },
      {
        'image':
            'https://image.freepik.com/free-photo/woman-putting-laundry-into-washing-machine-closeup_392895-7085.jpg',
      },
      {
        'image':
            'https://image.freepik.com/free-photo/woman-standing-alone-with-dirty-clothes-self-serviced-laundry-with-dryer-machines-female-casual-wear-stands-holding-basin-with-clothes_183219-6131.jpg',
      },
      {
        'image':
            'https://img.freepik.com/free-photo/woman-ironing-clothes-with-steam-iron_33807-1299.jpg?size=338&ext=jpg',
      },
      {
        'image':
            'https://image.freepik.com/free-photo/dirty-carpet-soaking-special-chemical-solution-carpet-cleaning-service_130111-4315.jpg',
      },
    ];

    return galleries;
  }

  static List getDummyReviews() {
    var reviews = [
      {
        "photo_url":
            "https://images.unsplash.com/photo-1619203406102-a706bfdc599a?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxMnx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"
                "",
        "name": "Ryan Rotwaiss",
        "date": "A month ago",
        "comment": "Man!! great services!"
      },
      {
        "photo_url":
            "https://images.unsplash.com/photo-1619223136449-9a1e502eed25?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw2Nnx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
        "name": "Jack Lieber",
        "date": "2 months ago",
        "comment": "Great services! I highly recommend!!"
      },
      {
        "photo_url":
            "https://images.unsplash.com/photo-1523215108660-3fdf7932d7a5?ixid=MnwxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHwyNXx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
        "name": "G. Jewell",
        "date": "2 months ago",
        "comment": "No comment, 5 Star!"
      },
      {
        "photo_url":
            "https://images.unsplash.com/photo-1485217988980-11786ced9454?ixid=MnwxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHwxMXx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
        "name": "Flore Titania",
        "date": "2 months ago",
        "comment": "Luvvv it❤"
      },
      {
        "photo_url":
            "https://images.unsplash.com/photo-1619200065231-c410a5aacbd1?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxM3x8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
        "name": "Hannah Davis",
        "date": "3 months ago",
        "comment":
            "Their attention to every little detail just never fails to amaze me."
      },
    ];

    return reviews;
  }

  static Future<DocumentReference> generateSingleDummy(String ownerId) async {
    DocumentReference docRef;
    List services = [];
    List galleries = [];
    List reviews = [];

    docRef = await FirebaseFirestore.instance.collection("vendor").add({
      "vendor_name": "Aimera Laundry",
      "address": "Dallas, 4426  Ersel Street, Texas",
      "photo_url":
          "https://image.freepik.com/free-photo/woman-cleaning-carpet-living-room-using-vacuum-cleaner-home-cleaning-service-concept_130111-3853.jpg",
      "latitude": 44.08476666029554,
      "longitude": 70.22286432261072,
      "phone": "+62821884488864",
      "website": "http://codekaze.com/",
      "services": getDummyServices(),
      "galleries": getDummyGalleries(),
      "reviews": getDummyReviews(),
      "rate": 4.0,
      "owner_id": ownerId,
      "about_us":
          "Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero's De Finibus Bonorum et Malorum for use in a type specimen book.",
    });

    services = getDummyServices();
    galleries = getDummyGalleries();
    reviews = getDummyReviews();

    services.forEach((item) {
      docRef.collection("services").add(item);
    });

    galleries.forEach((item) {
      docRef.collection("galleries").add(item);
    });

    reviews.forEach((item) {
      docRef.collection("reviews").add(item);
    });

    return docRef;
  }

  static Future generateDummy() async {
    String ownerId = "no-owner-its-only-dummy";
    DocumentReference docRef;
    List services = [];
    List galleries = [];
    List reviews = [];

    //Delete Existsing if Exists
    var querySnapshot =
        await FirebaseFirestore.instance.collection("vendor").get();
    for (var i = 0; i < querySnapshot.docs.length; i++) {
      var uid = querySnapshot.docs[i].id;
      await FirebaseFirestore.instance.collection("vendor").doc(uid).delete();
    }

    docRef = await FirebaseFirestore.instance.collection("vendor").add({
      "vendor_name": "Tsuna Laundry",
      "address": "Dallas, 4426  Ersel Street, Texas",
      "photo_url":
          "https://image.freepik.com/free-photo/man-cleaning-carpet-living-room-using-vacuum-cleaner-home_130111-3883.jpg",
      "latitude": 44.08476666029554,
      "longitude": 70.22286432261072,
      "phone": "+62821884488864",
      "website": "http://codekaze.com/",
      "services": getDummyServices(),
      "galleries": getDummyGalleries(),
      "reviews": getDummyReviews(),
      "rate": 4.0,
      "owner_id": ownerId,
      "about_us":
          "Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero's De Finibus Bonorum et Malorum for use in a type specimen book.",
    });

    services = getDummyServices();
    galleries = getDummyGalleries();
    reviews = getDummyReviews();

    services.forEach((item) {
      docRef.collection("services").add(item);
    });

    galleries.forEach((item) {
      docRef.collection("galleries").add(item);
    });

    reviews.forEach((item) {
      docRef.collection("reviews").add(item);
    });

    docRef = await FirebaseFirestore.instance.collection("vendor").add({
      "vendor_name": "Grand Apartment Laundry",
      "address": "Dallas, 4416  Ersel Street, Texas",
      "photo_url":
          "https://image.freepik.com/free-photo/row-industrial-laundry-machines-laundromat-public-laundromat-with-laundry-basket-thailand_28914-1091.jpg",
      "latitude": 44.08476666029554,
      "longitude": 70.22286432261072,
      "phone": "+62821884488334",
      "website": "http://codekaze.com/",
      "services": getDummyServices(),
      "galeries": getDummyGalleries(),
      "reviews": getDummyReviews(),
      "rate": 4.0,
      "owner_id": ownerId,
      "about_us":
          "Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero's De Finibus Bonorum et Malorum for use in a type specimen book.",
    });

    services = getDummyServices();
    galleries = getDummyGalleries();
    reviews = getDummyReviews();

    services.forEach((item) {
      docRef.collection("services").add(item);
    });

    galleries.forEach((item) {
      docRef.collection("galleries").add(item);
    });

    reviews.forEach((item) {
      docRef.collection("reviews").add(item);
    });

    docRef = await FirebaseFirestore.instance.collection("vendor").add({
      "vendor_name": "Jane Laundry",
      "address": "Dallas, 3256  Ersel Street, Texas",
      "photo_url":
          "https://img.freepik.com/free-photo/repairman-repairs-washing-machine-front-woman-man-communicates-with-owner-washing-machine_353017-452.jpg?size=338&ext=jpg",
      "latitude": 44.08476666029554,
      "longitude": 70.22286432261072,
      "phone": "+63821884656564",
      "website": "http://codekaze.com/",
      "services": getDummyServices(),
      "galeries": getDummyGalleries(),
      "reviews": getDummyReviews(),
      "rate": 5.0,
      "owner_id": ownerId,
      "about_us":
          "Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero's De Finibus Bonorum et Malorum for use in a type specimen book.",
    });

    services = getDummyServices();
    galleries = getDummyGalleries();
    reviews = getDummyReviews();

    services.forEach((item) {
      docRef.collection("services").add(item);
    });

    galleries.forEach((item) {
      docRef.collection("galleries").add(item);
    });

    reviews.forEach((item) {
      docRef.collection("reviews").add(item);
    });

    docRef = await FirebaseFirestore.instance.collection("vendor").add({
      "vendor_name": "Xieboba Laundry",
      "address": "Dallas, 6626  Ersel Street, Texas",
      "photo_url":
          "https://image.freepik.com/free-photo/front-view-pile-laundry_23-2148387001.jpg",
      "latitude": 44.08476666029554,
      "longitude": 70.22286432261072,
      "phone": "+67821884100200",
      "website": "http://codekaze.com/",
      "services": getDummyServices(),
      "galeries": getDummyGalleries(),
      "reviews": getDummyReviews(),
      "rate": 2.0,
      "owner_id": ownerId,
      "about_us":
          "Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero's De Finibus Bonorum et Malorum for use in a type specimen book.",
    });

    services = getDummyServices();
    galleries = getDummyGalleries();
    reviews = getDummyReviews();

    services.forEach((item) {
      docRef.collection("services").add(item);
    });

    galleries.forEach((item) {
      docRef.collection("galleries").add(item);
    });

    reviews.forEach((item) {
      docRef.collection("reviews").add(item);
    });
  }
}
