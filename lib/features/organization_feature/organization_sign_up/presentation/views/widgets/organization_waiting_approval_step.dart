// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:smart_medi/core/utils/app_styles.dart';
//
// class OrganizationWaitingApprovalStep extends StatelessWidget {
//   const OrganizationWaitingApprovalStep({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.symmetric(vertical: 40.h),
//       child: Column(
//         children: [
//           Container(
//             width: 90.w,
//             height: 90.w,
//             decoration: const BoxDecoration(
//               color: Color(0xFF2563EB),
//               shape: BoxShape.circle,
//             ),
//             child: const Icon(Icons.check, color: Colors.white, size: 44),
//           ),
//           24.verticalSpace,
//           Text(
//             'Signed Up Successfully',
//             style: AppStyles.textStyle20W400Black.copyWith(fontWeight: FontWeight.w700),
//           ),
//           10.verticalSpace,
//           Text(
//             'Wait until your account is reviewed and approved.',
//             textAlign: TextAlign.center,
//             style: TextStyle(fontSize: 13.sp, color: Colors.grey.shade600),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_medi/core/routing/app_routes.dart';
import 'package:smart_medi/core/utils/app_styles.dart';
import 'package:smart_medi/core/widgets/custom_button.dart';

class OrganizationWaitingApprovalStep extends StatelessWidget {
  const OrganizationWaitingApprovalStep({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 40.h),
      child: Column(
        children: [
          Container(
            width: 90.w,
            height: 90.w,
            decoration: const BoxDecoration(
              color: Color(0xFF2563EB),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.check, color: Colors.white, size: 44),
          ),
          24.verticalSpace,
          Text(
            'Signed Up Successfully',
            style: AppStyles.textStyle20W400Black.copyWith(fontWeight: FontWeight.w700),
          ),
          10.verticalSpace,
          Text(
            'Wait until your account is reviewed and approved.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 13.sp, color: Colors.grey.shade600),
          ),
          32.verticalSpace,
          CustomButton(
            text: 'Go to Login',
            onPressed: () => GoRouter.of(context).replace(AppRoutes.loginView),
          ),
        ],
      ),
    );
  }
}