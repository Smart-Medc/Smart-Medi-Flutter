import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_medi/core/routing/app_routes.dart';
import 'package:smart_medi/core/widgets/app_bar_back_button.dart';
import 'package:smart_medi/core/widgets/app_header.dart';
import 'package:smart_medi/core/widgets/custom_button.dart';
import 'package:smart_medi/features/data_sharing/presentation/views/widgets/code_generated_view_widgets/box_code_and_copy_buttons.dart';
import 'package:smart_medi/features/data_sharing/presentation/views/widgets/code_generated_view_widgets/code_generated_successfully.dart';
import 'package:smart_medi/features/data_sharing/presentation/views/widgets/code_generated_view_widgets/shared_records_info.dart';

class CodeGeneratedBody extends StatelessWidget {
  const CodeGeneratedBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppBarBackButton(),
            const AppHeader(title: 'Share Medical Records', subtitle: 'Select records to share and configure access settings'),
            20.verticalSpace,
            const CodeGeneratedSuccessfully(),
            32.verticalSpace,
            const BoxCodeAndCopyButtons(),
            32.verticalSpace,
            const SharedRecordsInfo(
              sharedRecords: [
                'Prescription History',
                'ECG Report',
                'Annual Physical Examination',
              ],
              expirationDate: 'Dec 19, 2025',
            ),
            20.verticalSpace,
            CustomButton(text: 'Done',onPressed: (){
              GoRouter.of(context).push(AppRoutes.dataSharingView);
            },),
            22.verticalSpace,
          ],
        ),
      ),
    );
  }
}
