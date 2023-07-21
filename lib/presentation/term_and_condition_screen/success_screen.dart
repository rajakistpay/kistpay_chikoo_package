
import 'package:kistpay_chikoo/core/app_export.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({Key? key}) : super(key: key);
  static Widget builder(BuildContext context) {
    return const SuccessScreen();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                // mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgRedminote11,
                    url: context.select(
                        (PhoneDetailsBloc bloc) => bloc.state.data?.image),
                    height: 300,
                    width: 150,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(
                    width: 28,
                  ),
                  Flexible(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          'Congrats! Mobile Application Sent.',
                          style: TextStyle(
                              color: Color(0xff000000),
                              fontSize: 26,
                              fontWeight: FontWeight.bold),
                        ),
                        Transform.translate(
                          offset: const Offset(0, -25),
                          child: Container(
                            width: 25,
                            height: 25,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xff6C63FF),
                            ),
                            child: const Center(
                                child: Icon(
                              Icons.check,
                              color: Colors.white,
                            )),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: RichText(
                text: TextSpan(
                  text: 'Great Job! Your application for \n',
                  style: const TextStyle(
                    color: Colors.black,
                    height: 1.3,
                    fontSize: 18,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text:
                          '${BlocProvider.of<PhoneDetailsBloc>(context).state.data?.brand ?? ''} ${BlocProvider.of<PhoneDetailsBloc>(context).state.data?.deviceName ?? ''}',
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 22),
                    ),
                    const TextSpan(
                      text:
                          ' has been sent. Our Team will review it shortly. Track its progress with ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                      ),
                    ),
                    TextSpan(
                      text:
                          'ID: ${BlocProvider.of<TermAndConditionBloc>(context).state.message} ',
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 22),
                    ),
                    const TextSpan(
                      text:
                          'Have question? Contact us at support@kistpay.com or call 021-111-111-222.',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: CustomButton(
        height: getVerticalSize(60),
        text: "Finish",
        margin: getMargin(left: 12, right: 13, bottom: 10, top: 5),
        padding: ButtonPadding.PaddingAll18,
        onTap: () {
          LoadingDialog.showLoadingDialog(context: context);


          context.read<LoginScreenBloc>().reset(LoginScrennInitialEvent());
          context.read<KycBloc>().reset(KycInitialEvent());
          context.read<PhoneDetailsBloc>().reset(PhoneDetailsInitialEvent());
          context.read<UserDetailsBloc>().reset(UserDetailsInitialEvent());
          context.read<TermAndConditionBloc>().reset( TermAndConditionInitialEvent());
          context.read<AuthenticateBloc>().reset(InitialEvent());
          print('object');
          Future.delayed(const Duration(seconds: 2),(){
            Navigator.of(context, rootNavigator: true).pop('dialog');

            Navigator.popUntil(context, (route) => route.isFirst);
          });



        },
      ),
    );
  }
}
extension BlocReset on Bloc {
  void reset(dynamic initialState) {
    // ignore: invalid_use_of_visible_for_testing_member
    add(initialState);
  }
}