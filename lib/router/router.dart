import 'package:get/get.dart';
import 'package:firebase_flutter_starter/ui/pages/home/home_page.dart';
import 'package:firebase_flutter_starter/ui/pages/profile/profile.page.dart';
import 'package:firebase_flutter_starter/ui/pages/auth/auth.page.dart';

class AppRouter {
// GetRouter pages
  static final List<GetPage> pages = [
    GetPage(
      name: '/',
      page: () => AuthPage(),
    ),
    GetPage(
      name: '/home',
      page: () => const HomePage(),
    ),
    GetPage(
      name: '/profile',
      page: () => ProfilePage(),
    ),
  ];
}
