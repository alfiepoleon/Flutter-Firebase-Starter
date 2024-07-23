import 'package:get/get.dart';
import 'package:firebase_flutter_starter/controllers/user.controller.dart';
import 'package:firebase_flutter_starter/utils/toast_manager.dart';

class AuthController extends GetxController {
  final userController = Get.put(UserController());
  var googleLoading = false.obs;
  var appleLoading = false.obs;

  Future<void> signInWithGoogle() async {
    googleLoading.value = true;
    await userController.signInWithGoogle().catchError((e) {
      googleLoading.value = false;
      ToastManager.error("error_google_sign_in".tr);
      return null; // Optionally, handle error e.g., show a Snackbar
    });
    googleLoading.value = false;
  }

  // Future<void> signInWithApple() async {
  //   appleLoading.value = true;
  //   await userController.signInWithApple().catchError((e) {
  //     appleLoading.value = false;
  //     return null; // Optionally, handle error e.g., show a Snackbar
  //   });
  //   appleLoading.value = false;
  // }
}
