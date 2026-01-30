import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'package:smart_medi/core/utils/app_styles.dart';
import 'package:smart_medi/core/widgets/icon_with_background.dart';

class MedicalRecordsDocument extends StatelessWidget {
  const MedicalRecordsDocument({super.key, required this.documentName, required this.date, required this.size});
  final String documentName;
  final String date;
  final double size;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 24.w,
        right: 24.w,
        top: 20.h,
        bottom: 16.h,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: AppColors.formFieldStrokeColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const IconWithBackground(icon: Icons.picture_as_pdf_outlined, backgroundColor: AppColors.iconBGBlue, iconColor: AppColors.iconBlue),
              Text(
                documentName,
                style: AppStyles.textStyle15W600Black
              ),
            ],
          ),
          34.verticalSpace,
          Text('Imaging',style: AppStyles.textStyle10W400LightGrey,),
          Text('$date - $size GB',style: AppStyles.textStyle10W400LightGrey,),
          10.verticalSpace,
          Row(
            children: [
              Expanded(
                child: documentButton(
                  text: 'Share',
                  icon: Icons.share_outlined,
                  onTap: () {},
                ),
              ),
              12.horizontalSpace,
              Expanded(
                child: documentButton(
                  text: 'Download',
                  icon: Icons.download_outlined,
                  onTap: () {},
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
  Widget documentButton({required String text,required IconData icon, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 35.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.greyBackgroundColor,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon,size: 16.sp,),
            4.horizontalSpace,
            Text(
              text,
              style: AppStyles.textStyle12W600Black,
            ),
          ],
        ),
      ),
    );
  }
}
