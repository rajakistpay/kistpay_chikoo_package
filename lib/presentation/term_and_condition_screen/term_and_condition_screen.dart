import 'package:kistpay_chikoo/core/app_export.dart';

import '../../webview.dart';


class TermAndConditionScreen extends StatefulWidget {
  const TermAndConditionScreen({super.key});

  static Widget builder(BuildContext context) {
    return TermAndConditionScreen();
  }

  @override
  State<TermAndConditionScreen> createState() => _TermAndConditionScreenState();
}

class _TermAndConditionScreenState extends State<TermAndConditionScreen> {
  bool isLoading = false;
  double loadingPercentage = 0.0;
  final WebViewController webViewController = WebViewController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TermAndConditionBloc, TermAndConditionState>(
      builder: (context, state) {
        return Scaffold(
            backgroundColor: ColorConstant.gray50,
            body:
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: WebViewExample(isTrue: (_){
                    setState(() {
                      isLoading=_;
                    });
                  },),
                ),
                isLoading? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: CustomButton(
                    height: 50,
                    text: "Agree",
                    variant: ButtonVariant.OutlineWhiteA700_1,
                    fontStyle: ButtonFontStyle.MulishRomanRegular18,
                    onTap: () {
                      BlocProvider.of<TermAndConditionBloc>(context)
                          .add(SubmitApplicationEvent());
                    },
                  ),
                ):const SizedBox.shrink(),
              ],
            )
        );
      },
    );
  }
}
