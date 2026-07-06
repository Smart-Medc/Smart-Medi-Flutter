import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_medi/core/routing/app_routes.dart';
import 'package:smart_medi/core/widgets/app_header.dart';
import 'package:smart_medi/core/widgets/custom_button.dart';
import 'package:smart_medi/features/data_sharing/data/models/get_shared_records_models/get_shared_records_response.dart';
import 'package:smart_medi/features/data_sharing/presentation/views/widgets/code_generated_view_widgets/box_code_and_copy_buttons.dart';
import 'package:smart_medi/features/data_sharing/presentation/views/widgets/code_generated_view_widgets/code_generated_successfully.dart';
import 'package:smart_medi/features/data_sharing/presentation/views/widgets/code_generated_view_widgets/shared_records_info.dart';

class CodeGeneratedBody extends StatelessWidget {
  const CodeGeneratedBody({super.key, required this.sharedRecord});
  final SharedRecordModel sharedRecord;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            60.verticalSpace,
            const AppHeader(title: 'Share Medical Records', subtitle: 'Select records to share and configure access settings'),
            20.verticalSpace,
            const CodeGeneratedSuccessfully(),
            32.verticalSpace,
            BoxCodeAndCopyButtons(accessCode: sharedRecord.code, url: sharedRecord.shareUrl),
            32.verticalSpace,
             SharedRecordsInfo(
              sharedRecords: sharedRecord.sharedRecordsSummary,
              expirationDate: sharedRecord.formattedExpiryDate,
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
