import 'package:get/get.dart';
import 'package:firebase_flutter_starter/ui/pages/auth/auth.controller.dart';
import 'package:firebase_flutter_starter/utils/common_libs.dart';
import 'package:sign_in_button/sign_in_button.dart';

class AuthPage extends StatelessWidget {
  AuthPage({super.key});

  final AuthController controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    Widget signInButton(Buttons buttonType, String textKey, RxBool isLoading, VoidCallback onPressed) {
      return SizedBox(
        width: MediaQuery.of(context).size.width * 0.9,
        height: 50,
        child: Obx(() => SignInButton(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              buttonType,
              text: isLoading.value ? "${"loading".tr}..." : textKey.tr,
              onPressed: isLoading.value ? () {} : onPressed,
            )),
      );
    }

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // signInButton(Buttons.appleDark, "continue_with_apple", controller.appleLoading, controller.signInWithApple),
            // const SizedBox(height: 14),
            signInButton(
              Buttons.googleDark,
              "continue_with_google",
              controller.googleLoading,
              controller.signInWithGoogle,
            ),
          ],
        ),
      ),
    );
  }
}
