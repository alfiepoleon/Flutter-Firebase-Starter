import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_flutter_starter/controllers/user.controller.dart';
import 'package:firebase_flutter_starter/utils/common_libs.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  final UserController userController = UserController.to;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('profile'.tr, style: GoogleFonts.lato()),
        actions: <Widget>[
          PopupMenuButton<String>(
            icon: const Icon(Icons.language),
            onSelected: (localeCode) {
              userController.changeLanguage(localeCode);
            },
            itemBuilder: (context) => const [
              PopupMenuItem<String>(
                value: 'en_US',
                child: Text('English'),
              ),
              PopupMenuItem<String>(
                value: 'es_ES',
                child: Text('Español'),
              ),
              PopupMenuItem<String>(
                value: 'fr_FR',
                child: Text('Français'),
              ),
              PopupMenuItem<String>(
                value: 'sw_KE',
                child: Text('Kiswahili'),
              ),
            ],
            tooltip: "change_language".tr,
          ),
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: () async {
              bool confirm = await DialogManager.confirmDialog(context,
                      title: "Confirm", body: "Are you sure you want to sign out?", hasNo: true) ??
                  false;

              if (confirm) {
                userController.signOut();
              }
            },
            tooltip: 'sign_out'.tr,
          ),
        ],
      ),
      body: Obx(
        () {
          // Use Obx to make the widget listen to changes
          User? user = userController.firebaseUser.value;
          if (user == null) {
            return Center(
              child: SpinKitSpinningLines(
                color: $styles.colors.blue, // Example color, replace with $styles.colors.blue if defined
                size: 50.0,
              ),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100.0), // Ensure fully circular
                    child: user.photoURL != null
                        ? CachedNetworkImage(
                            imageUrl: user.photoURL!,
                            placeholder: (context, url) => const CircularProgressIndicator(),
                            errorWidget: (context, url, error) => const Icon(Icons.error),
                          )
                        : Image.asset('assets/default_profile.png'), // Replace with your default image
                  ),
                  const SizedBox(
                    height: 21,
                  ),
                  Card(
                    elevation: 4,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListTile(
                          title: Text("full_name".tr, style: $styles.text.h5),
                          subtitle: Text("${user.displayName}", style: $styles.text.body),
                        ),
                        ListTile(
                          title: Text("email".tr, style: $styles.text.h5),
                          subtitle: Text(user.email ?? "not_set".tr, style: $styles.text.body),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
