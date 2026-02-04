import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/widgets/app_bar_back_button.dart';
import 'package:smart_medi/core/widgets/app_header.dart';
import 'package:smart_medi/features/meidcal_records/presentation/views/widgets/record_details_widgets/record_details_box.dart';
import 'package:smart_medi/features/meidcal_records/presentation/views/widgets/record_details_widgets/record_details_buttons.dart';
import 'package:smart_medi/features/meidcal_records/presentation/views/widgets/record_details_widgets/record_info_box.dart';
import 'package:smart_medi/features/meidcal_records/presentation/views/widgets/record_details_widgets/record_test_results_box.dart';
class RecordDetailsBody extends StatelessWidget {
  const RecordDetailsBody({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 25.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:[
            const AppBarBackButton(),
            const AppHeader(title: 'Chest X-Ray', subtitle: 'Chest X-ray imaging study for routine health screening.'),
            40.verticalSpace,
            const RecordDetailsButtons(),
            30.verticalSpace,
            const RecordInfoBox(),
            16.verticalSpace,
            const RecordDetailsBox(),
            16.verticalSpace,
            const RecordTestResultsBox(),
            20.verticalSpace,
          ],
        ),
      ),
    );
  }
}
