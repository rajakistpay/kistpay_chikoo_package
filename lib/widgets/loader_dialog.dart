import 'package:kistpay_chikoo/core/app_export.dart';

GlobalKey<NavigatorState> dialogNavigatorKey = GlobalKey<NavigatorState>();

class LoadingDialog {
  static showLoadingDialog(
      {String message = 'Loading....', BuildContext? context}) async {
    await
    showDialog(
      context: context ?? NavigatorService.navigatorKey.currentState!.context,
      barrierDismissible: false,
      barrierColor: Colors.black38.withOpacity(0.3),
      builder: (_) => WillPopScope(
        onWillPop: () async => false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(
              strokeWidth: 8,
            ),
            const SizedBox(height: 20),
            Material(
              color: Colors.transparent,
              child: Text(
                message,
                style: TextStyle(
                    color: ColorConstant.blue600,
                    fontWeight: FontWeight.w600,
                    fontSize: 16),
              ),
            )
          ],
        ),
      ),
    );
  }

  static hideLoadingDialog({BuildContext? context}) {
    Navigator.of(context ?? NavigatorService.navigatorKey.currentState!.context)
        .pop();
  }
}
