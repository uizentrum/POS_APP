import 'package:pos_app/core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  ProfileView view;

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

  doLogout() async {
    showLoading();
    await FirebaseAuth.instance.signOut();
    AppSession.userCredential = null;
    hideLoading();
    Get.off(LoginView());
  }
}
