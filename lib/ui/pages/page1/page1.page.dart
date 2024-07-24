import 'package:mojateam/utils/common_libs.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(MdiIcons.plus),
      ),
      body: const Center(
        child: Text('Page 1'),
      ),
    );
  }
}
