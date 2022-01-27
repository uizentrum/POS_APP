import 'package:pos_app/core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserApi {
  static initialize() async {
    await FirebaseFirestore.instance
        .collection("user")
        .doc(AppSession.userCredential.user.uid)
        .set({
      "profile": {
        "uid": AppSession.userCredential.user.uid,
        "email": AppSession.userCredential.user.email,
        "emailVerified": AppSession.userCredential.user.emailVerified,
        "photoURL": AppSession.userCredential.user.photoURL,
        "displayName": AppSession.userCredential.user.displayName,
      },
    });

    var snapshot = await userCollection.collection("products").get();
    if (snapshot.docs.isEmpty) {
      await generateDummyProducts();
    }
  }

  static generateDummyProducts() async {
    await userCollection.collection("categories").add({
      "category_name": "Appetizer",
    });

    await userCollection.collection("categories").add({
      "category_name": "Main Course",
    });

    await userCollection.collection("categories").add({
      "category_name": "Drink",
    });
    await userCollection.collection("categories").add({
      "category_name": "Noodles",
    });

    await userCollection.collection("categories").add({
      "category_name": "Dinner",
    });
    await userCollection.collection("products").add({
      "category_name": "Appetizer",
      "product_name": "Iceland Salad",
      "photo":
          "https://cdn.pixabay.com/photo/2016/09/15/19/24/salad-1672505_960_720.jpg",
      "price": 30,
    });

    await userCollection.collection("products").add({
      "category_name": "Appetizer",
      "product_name": "Quarantine Eggs",
      "photo":
          "https://cdn.pixabay.com/photo/2017/09/18/14/49/egg-sandwich-2761894_960_720.jpg",
      "price": 28,
    });

    await userCollection.collection("products").add({
      "category_name": "Appetizer",
      "product_name": "Pumpkin Festival",
      "photo":
          "https://cdn.pixabay.com/photo/2018/08/31/19/13/pumpkin-soup-3645375_960_720.jpg",
      "price": 22,
    });

    await userCollection.collection("products").add({
      "category_name": "Appetizer",
      "product_name": "Amigos Cocktail",
      "photo":
          "https://cdn.pixabay.com/photo/2019/06/13/11/28/cocktail-4271392_960_720.jpg",
      "price": 18,
    });

    await userCollection.collection("products").add({
      "category_name": "Appetizer",
      "product_name": "Purpla Marachos",
      "photo":
          "https://cdn.pixabay.com/photo/2018/05/04/22/53/macaroons-3375255_960_720.jpg",
      "price": 28,
    });

    await userCollection.collection("products").add({
      "category_name": "Appetizer",
      "product_name": "Moana Potatoes",
      "photo":
          "https://cdn.pixabay.com/photo/2015/05/20/15/57/appetizer-775713_960_720.jpg",
      "price": 33,
    });

    await userCollection.collection("products").add({
      "category_name": "Main Course",
      "product_name": "Goulash Beef",
      "photo":
          "https://cdn.pixabay.com/photo/2018/06/27/20/24/goulash-3502510_960_720.jpg",
      "price": 90,
    });

    await userCollection.collection("products").add({
      "category_name": "Main Course",
      "product_name": "Naff Fried ChickeN",
      "photo":
          "https://cdn.pixabay.com/photo/2015/10/22/18/58/chicken-1001767_960_720.jpg",
      "price": 60,
    });

    await userCollection.collection("products").add({
      "category_name": "Main Course",
      "product_name": "Avenger's Steak",
      "photo":
          "https://cdn.pixabay.com/photo/2018/08/29/19/03/steak-3640560_960_720.jpg",
      "price": 125,
    });

    await userCollection.collection("products").add({
      "category_name": "Main Course",
      "product_name": "Nabin Gurung",
      "photo":
          "https://cdn.pixabay.com/photo/2018/08/29/19/03/steak-3640560_960_720.jpg",
      "price": 1,
    });

    await userCollection.collection("products").add({
      "category_name": "Main Course",
      "product_name": "Thai Noddles",
      "photo":
          "https://cdn.pixabay.com/photo/2018/07/23/18/55/noodles-3557592_960_720.jpg",
      "price": 55,
    });

    await userCollection.collection("products").add({
      "category_name": "Main Course",
      "product_name": "Khan's Soup",
      "photo":
          "https://cdn.pixabay.com/photo/2019/03/02/08/47/goulash-4029441_960_720.jpg",
      "price": 55,
    });

    await userCollection.collection("products").add({
      "category_name": "Main Course",
      "product_name": "Mogoyo",
      "photo":
          "https://cdn.pixabay.com/photo/2016/11/12/21/18/noodles-1819797_960_720.jpg",
      "price": 250,
    });

    await userCollection.collection("products").add({
      "category_name": "Drink",
      "product_name": "Infused Lemon Water",
      "photo":
          "https://cdn.pixabay.com/photo/2016/07/21/11/17/drink-1532300_960_720.jpg",
      "price": 10,
    });

    await userCollection.collection("products").add({
      "category_name": "Drink",
      "product_name": "Megaman's Coffe",
      "photo":
          "https://cdn.pixabay.com/photo/2015/10/12/14/54/coffee-983955_960_720.jpg",
      "price": 12,
    });

    await userCollection.collection("products").add({
      "category_name": "Drink",
      "product_name": "Silent Tea",
      "photo":
          "https://cdn.pixabay.com/photo/2015/07/02/20/37/cup-829527_960_720.jpg",
      "price": 25,
    });

    await userCollection.collection("products").add({
      "category_name": "Drink",
      "product_name": "Fresh Milk",
      "photo":
          "https://cdn.pixabay.com/photo/2016/12/06/18/27/milk-1887237_960_720.jpg",
      "price": 33,
    });

    await userCollection.collection("products").add({
      "category_name": "Drink",
      "product_name": "Momoxi",
      "photo":
          "https://cdn.pixabay.com/photo/2017/03/03/18/40/quark-2114690_960_720.jpg",
      "price": 21,
    });

    await userCollection.collection("products").add({
      "category_name": "Noodles",
      "product_name": "Chowchow",
      "photo":
          "https://cdn.pixabay.com/photo/2017/03/03/18/40/quark-2114690_960_720.jpg",
      "price": 100,
    });
    await userCollection.collection("products").add({
      "category_name": "Noodles",
      "product_name": "Chowchow",
      "photo":
          "https://cdn.pixabay.com/photo/2017/03/03/18/40/quark-2114690_960_720.jpg",
      "price": 100,
    });
    await userCollection.collection("products").add({
      "category_name": "Noodles",
      "product_name": "Chowchow",
      "photo":
          "https://cdn.pixabay.com/photo/2017/03/03/18/40/quark-2114690_960_720.jpg",
      "price": 100,
    });
    await userCollection.collection("products").add({
      "category_name": "Noodles",
      "product_name": "Chowchow",
      "photo":
          "https://cdn.pixabay.com/photo/2017/03/03/18/40/quark-2114690_960_720.jpg",
      "price": 100,
    });
    await userCollection.collection("products").add({
      "category_name": "Noodles",
      "product_name": "Chowchow",
      "photo":
          "https://cdn.pixabay.com/photo/2017/03/03/18/40/quark-2114690_960_720.jpg",
      "price": 100,
    });
    await userCollection.collection("products").add({
      "category_name": "Noodles",
      "product_name": "Chowchow",
      "photo":
          "https://cdn.pixabay.com/photo/2017/03/03/18/40/quark-2114690_960_720.jpg",
      "price": 100,
    });
    await userCollection.collection("products").add({
      "category_name": "Noodles",
      "product_name": "Chowchow",
      "photo":
          "https://cdn.pixabay.com/photo/2017/03/03/18/40/quark-2114690_960_720.jpg",
      "price": 100,
    });
  }
}
