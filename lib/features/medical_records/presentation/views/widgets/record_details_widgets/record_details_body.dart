import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/widgets/app_bar_back_button.dart';
import 'package:smart_medi/core/widgets/app_header.dart';
import 'package:smart_medi/features/medical_records/presentation/views/widgets/record_details_widgets/record_details_bloc_builder.dart';
import 'package:smart_medi/features/medical_records/presentation/views/widgets/record_details_widgets/record_details_buttons.dart';
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
            const RecordDetailsBlocBuilder(),
            20.verticalSpace,
          ],
        ),
      ),
    );
  }
}
