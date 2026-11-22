import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/features/auth/presentation/view/widgets/auth_header.dart';
import 'package:smart_medi/features/auth/presentation/view/widgets/complete_profile_widgets/complete_profile_fields.dart';
class CompleteProfileBody extends StatelessWidget {
  const CompleteProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(25.w),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            80.verticalSpace,
            const AuthHeader(title: 'CompleteYour Profile', subTitle: 'Help us keep you safe by providing critical medical information'),
            23.verticalSpace,
            const CompleteProfileFields(),
          ],
        ),
      ),
    );
  }
}
