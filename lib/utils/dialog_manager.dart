import 'package:firebase_flutter_starter/utils/common_libs.dart';

class DialogManager {
  static Future<bool?> confirmDialog(
    BuildContext context, {
    required String title,
    required String body,
    bool hasNo = true,
  }) async {
    return showDialog<bool>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(child: Text(title)),
          elevation: 8,
          content: SingleChildScrollView(
            child: Center(
              child: Text(body, textAlign: TextAlign.center),
            ),
          ),
          actionsAlignment: MainAxisAlignment.spaceEvenly,
          actions: <Widget>[
            if (hasNo)
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: $styles.colors.white,
                  foregroundColor: $styles.colors.black,
                ),
                child: Text('no'.tr),
                onPressed: () => Navigator.pop(context, false),
              ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(),
              child: Text('yes'.tr),
              onPressed: () => Navigator.pop(context, true),
            ),
          ],
        );
      },
    );
  }
}
