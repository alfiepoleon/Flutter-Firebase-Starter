import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_flutter_starter/telemetry/telemetry.dart';
import 'package:firebase_flutter_starter/utils/common_libs.dart';

class UserController extends GetxController {
  //Create an instance
  static UserController get to => Get.find();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Rxn<User> firebaseUser = Rxn<User>();

  @override
  void onInit() {
    super.onInit();
    firebaseUser.bindStream(_auth.authStateChanges());

    // Whenever the firebaseUser changes, fetch user model from Firestore
    ever(firebaseUser, handleAuthChanged);
  }

  void handleAuthChanged(User? user) {
    Log.printLog("User changed: ${user?.uid}: ${user?.email}");
    if (user != null) {
      // User is signed in
      Get.offAllNamed('/home');
    } else {
      // User is null, user not signed in
    }
  }

  Future<void> signInWithGoogle() async {
    try {
      GoogleSignIn googleSignIn = GoogleSignIn(
        scopes: [
          'email',
          'profile',
        ],
      );
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Sign in the user
      UserCredential cred = await FirebaseAuth.instance.signInWithCredential(credential);

      // Return the user
      User? u = cred.user;
      if (u != null) {
        FirebaseCrashlytics.instance.setUserIdentifier(u.uid);
      }

      AppTelemetry.logUserLogin("google");

      Get.offAllNamed('/profile');

      return;
    } on FirebaseAuthException catch (e) {
      // Handle specific Firebase authentication errors
      Log.printError("Firebase Auth Exception: ${e.code} - ${e.message}");
      AppTelemetry.logEvent('firebase_google_auth_exception',
          parameters: {'code': e.code, 'message': e.message ?? "", 'error': e.toString()});
      ToastManager.error("error_google_sign_in".tr);
      return; // Or rethrow if needed
    } catch (e) {
      // Catch all other unexpected errors
      Log.printError("Unexpected Error during Google Sign-In: $e");
      AppTelemetry.logEvent('unexpected_google_sign_in_error', parameters: {'error': e.toString()});
      // Show a generic error message to the user
      ToastManager.error("error_google_sign_in".tr);
      return;
    }
  }

  // Method to change the language and reload the application
  Future<void> changeLanguage(String lc) async {
    var parts = lc.split('_');
    if (parts.length != 2) {
      Log.printError("Invalid language code: $lc");
      ToastManager.error("error_invalid_language_code".tr);
      return;
    }

    var locale = Locale(parts[0], parts[1]);
    Get.updateLocale(locale); // Update GetX locale
    AppTelemetry.logEvent("language_change", parameters: {"language_selected": lc});
  }

  Future<void> signOut() async {
    await _auth.signOut();

    Get.offAllNamed('/');
  }
}
