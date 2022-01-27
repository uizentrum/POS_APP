import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AppSession {
  static UserCredential userCredential;

  //Vendor Only Sessions
  static String documentId;
  static Map<String, dynamic> myVendor = {};
}

DocumentReference get userCollection {
  return FirebaseFirestore.instance
      .collection("user")
      .doc(AppSession.userCredential.user.uid);
}
