import '../core/app_export.dart';

class UploadKycDocumentWidget extends StatelessWidget {
  const UploadKycDocumentWidget({super.key,  this.title, this.onTap});
  final void Function()? onTap;
  final String? title;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title ?? '',
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtRobotoRomanSemiBold25),
              Container(
                height: 51,
                width: 51,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: ColorConstant.indigo400),
                child: const Center(
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
