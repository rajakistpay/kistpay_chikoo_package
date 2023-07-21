
import 'package:kistpay_chikoo/core/app_export.dart';


import '../phone_details_screen/finance_price.dart';
import '../phone_details_screen/models/phone_details_model.dart';
import 'bloc/phone_listing_bloc.dart';

class PhoneListingScreen extends StatelessWidget {
  const PhoneListingScreen({super.key});

  static Widget builder(BuildContext context) {
    final phoneListingBloc = PhoneListingBloc(PhoneListingState());
    phoneListingBloc.add(PhoneListingInitialEvent());

    return BlocProvider.value(
      value: phoneListingBloc,
      child: const PhoneListingScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PhoneListingBloc, PhoneListingState>(
      builder: (context, state) {
        if (state.success) {
          final phoneListingModel = state.phoneListingModelObj;
          return SafeArea(
            child: Scaffold(
              backgroundColor: ColorConstant.gray200,
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(18, 20, 18, 0),
                    child: Text(
                      "Available Devices",
                      style: AppStyle.txtMulishRomanBold20,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(18, 19, 18, 10),
                    child: Text(
                      "Select Brand",
                      style: AppStyle.txtMulishRomanExtraBold20,
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(
                    height: 100,
                    child: ListView.builder(
                      padding: const EdgeInsets.only(left: 16),
                      scrollDirection: Axis.horizontal,
                      itemCount: state.uniqueBrands.length,
                      itemBuilder: (context, index) {
                        return SizedBox(
                          width: 105,
                          child: GestureDetector(
                            onTap: () {

                              final selectBrandEvent = SelectBrandEvent(index);
                              context.read<PhoneListingBloc>().add(selectBrandEvent);
                            },
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                side: BorderSide(
                                  color: state.selectedBrandIndex == index
                                      ? ColorConstant.darkBlue
                                      : Colors.transparent,
                                  width: 2.0,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 10),
                                child: Center(
                                  child: Text(
                                    state.uniqueBrands[index],
                                    style: AppStyle.txtMulishRomanExtraBold20.copyWith(
                                      color: ColorConstant.darkBlue,
                                      fontSize: 18,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 15),
                  Expanded(
                    child: BlocListener<PhoneDetailsBloc, PhoneDetailsState>(
                      listener: (context, state) {
                        print('object1');
                        if (state.data != null) {
                          NavigatorService.pushNamed(
                            AppRoutes.phoneDetailsScreen,
                            arguments: state.data,
                          );
                        }
                      },
                      listenWhen: (current, previous) {
                        return current.data != previous.data;
                      },
                      child: ListView.separated(
                        itemCount: phoneListingModel?.data?.length ?? 0,
                        separatorBuilder: (_, __) => const SizedBox(height: 5),
                        itemBuilder: (context, index) {
                          final device = phoneListingModel?.data?[index];
                          return InkWell(
                            onTap: () {
                              print('image ${device?.image}');
                              context.read<PhoneDetailsBloc>().state.selectedDownPayment=null;
                              context.read<PhoneDetailsBloc>().state.selectedTenureIndex=null; //phoneDetailsResponse
                              context.read<PhoneDetailsBloc>().state.phoneDetailsResponse=PhoneDetailsResponse();
                              print('package package ${context.read<PhoneDetailsBloc>().state.selectedDownPayment} ${context.read<PhoneDetailsBloc>().state.selectedTenureIndex} ${context.read<PhoneDetailsBloc>().state.phoneDetailsResponse} ');

                              context.read<PhoneDetailsBloc>().add(
                                PhoneDetailsAddDataEvent(
                                  MobileData(
                                    deviceName: device?.deviceName ?? '',
                                    price: device?.price ?? '',
                                    discountedPrice: device?.price ?? '',
                                    brand: device?.brand ?? '',
                                    ram: device?.ram ?? '',
                                    rom: device?.rom ?? '',
                                    isDeleted: device?.isDeleted,
                                    stockedUnit: device?.stockedUnit,
                                    financeDeviceVendorPublicId: device?.financeDeviceVendorPublicId ?? '',
                                    devicePublicId: device?.devicePublicId ?? '',
                                    isDlcEnable: device?.isDlcEnable,
                                    image: device?.image,
                                  ),
                                ),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                              child: Container(
                                padding: const EdgeInsets.fromLTRB(10, 12, 10, 10),
                                decoration: AppDecoration.outlineBlack90033.copyWith(
                                  borderRadius: BorderRadiusStyle.roundedBorder10,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const SizedBox(height: 5),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Card(
                                          clipBehavior: Clip.antiAlias,
                                          elevation: 0,
                                          color: ColorConstant.whiteA700,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadiusStyle.roundedBorder10,
                                          ),
                                          child: Container(
                                            height: getSize(99),
                                            width: getSize(99),
                                            padding: const EdgeInsets.all(10),
                                            decoration: AppDecoration.outlineBlack900331.copyWith(
                                              borderRadius: BorderRadiusStyle.roundedBorder10,
                                            ),
                                            child: CustomImageView(
                                              imagePath: ImageConstant.imgImage57,
                                              url: device?.image,
                                              height: getSize(78),
                                              width: getSize(78),
                                              alignment: Alignment.center,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        Flexible(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                '${device?.brand} ${device?.deviceName ?? ' '}',
                                                style: AppStyle.txtMulishRomanExtraBold16,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                              ),
                                              const SizedBox(height: 5),
                                              Text(
                                                '${device?.ram} RAM, ${device?.rom} ROM',
                                                style: AppStyle.txtMulishRomanMedium12Gray800,
                                                textAlign: TextAlign.left,
                                              ),
                                              const SizedBox(height: 5),
                                              Text(
                                                'PKR ${device?.price ?? 0}',
                                                style: AppStyle.txtMulishRomanBold14,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                              ),
                                              const SizedBox(height: 5),
                                              Container(
                                                width: MediaQuery.of(context).size.width,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(100),
                                                  color: const Color(0xFF4968AF),
                                                ),
                                                padding: const EdgeInsets.all(10),
                                                child: const Text(
                                                  'Choose Options',
                                                  style: TextStyle(
                                                    fontSize: 13,
                                                    color: Colors.white,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        } else if (state.isLoading) {
          return const Material(
            color: Colors.white,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          final errorMessage = state.error;
          return Scaffold(
            body: Center(
              child: GestureDetector(
                onTap: () {
                  // Retry the API call
                  final phoneListingBloc =
                      BlocProvider.of<PhoneListingBloc>(context);
                  phoneListingBloc.add(PhoneListingInitialEvent());
                },
                child: Text(
                  'An unexpected error occurred. Please try again later. $errorMessage',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          );
        }
      },
    );
  }

  onTapImgArrowLeft(BuildContext context) {
    NavigatorService.goBack();
  }
}
