import 'package:pos_app/core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginController extends GetxController {
  LoginView view;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void doLogin() async {
    Get.off(MainNavigationView());
  }

  GoogleSignIn googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      // 'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );
  GoogleSignInAccount googleUser;

  doGoogleLogin() async {
    showLoading();
    try {
      try {
        googleUser = await googleSignIn.signIn();
      } catch (e) {
        print("Error here");
        print(e);
      }

      GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      GoogleAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      AppSession.userCredential = userCredential;
      await UserApi.initialize();
      hideLoading();

      Get.off(MainNavigationView());
    } catch (error) {
      print(error);
    }
  }

  doAnonymousLogin() async {
    showLoading();
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInAnonymously();
      print("8");

      AppSession.userCredential = userCredential;

      print("Email:");
      print(userCredential.user.email);

      await UserApi.initialize();

      hideLoading();

      Get.off(MainNavigationView());
    } catch (error) {
      print(error);
    }
  }
}
