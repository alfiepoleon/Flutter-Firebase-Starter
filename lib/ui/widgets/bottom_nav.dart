import 'package:firebase_flutter_starter/utils/common_libs.dart';

Widget bottomNav({
  required Function(int) onTabTapped,
  required int currentIndex,
}) {
  return ClipRRect(
    borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
    child: BottomNavigationBar(
      onTap: onTabTapped, // new
      currentIndex: currentIndex, // this will be set when a new tab is tapped
      items: [
        BottomNavigationBarItem(
          icon: Icon(MdiIcons.cashMultiple),
          label: 'Page 1',
        ),
        BottomNavigationBarItem(
          icon: Icon(MdiIcons.accountCircle),
          label: 'Profile',
        ),
      ],
      type: BottomNavigationBarType.fixed,
    ),
  );
}
