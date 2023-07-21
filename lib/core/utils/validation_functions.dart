
// import 'package:fluttertoast/fluttertoast.dart';


import '../app_export.dart';

/// Checks if string is phone number
bool isValidPhoneNumber(String number) {
  // Remove any whitespace or special characters from the number
  RegExp regExp = RegExp(
      r'^(?:\+92|0|0092)(?:(?<=\+92|0092)(?:3[0-9]{2}|5[0-6]{2}|7[0-1]{2}|9[2-9]{2})[0-9]{7}|[1-9][0-9]{9})$');

  // Check if the number matches the pattern
  return regExp.hasMatch(number);
}

/// Checks if string consist only Alphabet. (No Whitespace)
bool isText(
  String? inputString, {
  bool isRequired = false,
}) {
  bool isInputStringValid = false;

  if (inputString != null || inputString!.isNotEmpty) {
    const pattern = r'^[a-zA-Z]+$';

    final regExp = RegExp(pattern);

    isInputStringValid = regExp.hasMatch(inputString);
  }

  return isInputStringValid;
}

const Color defaultBackgroundColor = Color(0xFF7B3FD3);
// void showToast({
//   required String message,
//   ToastGravity gravity = ToastGravity.BOTTOM,
//   int timeInSeconds = 2,
//   Color backgroundColor = defaultBackgroundColor,
//   Color textColor = Colors.white,
//   double fontSize = 16.0,
// }) {
//   Fluttertoast.showToast(
//     msg: message,
//     toastLength: Toast.LENGTH_SHORT,
//     gravity: gravity,
//     timeInSecForIosWeb: timeInSeconds,
//     backgroundColor: backgroundColor,
//     textColor: textColor,
//     fontSize: fontSize,
//   );
// }

class PakistaniCnicInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final sanitizedText = newValue.text.replaceAll(RegExp(r'\D'), '');
    final cnicLength = 13;

    if (sanitizedText.length <= cnicLength) {
      String formattedText = '';

      for (int i = 0; i < sanitizedText.length; i++) {
        if (i == 5 || i == 12) {
          formattedText += '-';
        }
        formattedText += sanitizedText[i];
      }

      return newValue.copyWith(
        text: formattedText,
        selection: TextSelection.collapsed(offset: formattedText.length),
      );
    } else {
      return oldValue;
    }
  }
}

void showToast({
  required String message,
  ToastGravity gravity = ToastGravity.TOP,
  int timeInSeconds = 3,
  Color backgroundColor = Colors.transparent,
  Color textColor = Colors.white,
  double fontSize = 16.0,
}) {
  WidgetsFlutterBinding.ensureInitialized();

  late OverlayEntry overlayEntry; // Make overlayEntry nullable

  OverlayState overlayState =
      Overlay.of(NavigatorService.navigatorKey.currentState!.context);
  bool check = false;
  overlayEntry = OverlayEntry(builder: (context) {
    return Positioned(
      top: gravity == ToastGravity.TOP ? 50.0 : null,
      bottom: gravity == ToastGravity.BOTTOM ? 50.0 : null,
      left: 20.0,
      right: 20.0,
      child: Material(
        color: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: backgroundColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  message,
                  style: TextStyle(
                    fontSize: fontSize,
                    color: textColor,
                  ),
                ),
              ),
              const SizedBox(width: 8.0),
              backgroundColor != Colors.green
                  ? InkWell(
                      onTap: () {
                        overlayEntry.remove();
                        check = true;
                      },
                      child: Icon(
                        Icons.close,
                        color: textColor,
                      ),
                    )
                  : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  });

  overlayState.insert(overlayEntry);

  Future.delayed(Duration(seconds: timeInSeconds)).then((value) {
    if (!check) {
      overlayEntry.remove();
    }
  });
}
