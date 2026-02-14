import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_medi/core/routing/app_routes.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'package:smart_medi/core/utils/app_shadows.dart';
import 'package:smart_medi/core/utils/app_styles.dart';
import 'package:smart_medi/core/widgets/app_header.dart';

class DataSharingHeader extends StatelessWidget {
  const DataSharingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child:  AppHeader(title: 'Secure Data Sharing', subtitle: 'Control who can access your medical records')),
        60.verticalSpace,
        InkWell(
          onTap: () => context.push(AppRoutes.shareRecordsView),
          borderRadius: BorderRadius.circular(10.r),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 7.w,vertical: 9.h),
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              boxShadow: AppShadows.small,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Row(
              children: [
                Icon(Icons.add,color: AppColors.textWhite,size: 22.sp,),
                8.horizontalSpace,
                Text('Share Records',style: AppStyles.textStyle12W500White,)
              ],
            ),
          ),
        )
      ],
    );
  }
}
