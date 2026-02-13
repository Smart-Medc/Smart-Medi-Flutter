import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/widgets/custom_app_bar.dart';
import 'package:smart_medi/features/data_sharing/presentation/views/widgets/data_sharing_header.dart';
import 'package:smart_medi/features/data_sharing/presentation/views/widgets/data_sharing_summary.dart';
import 'package:smart_medi/features/data_sharing/presentation/views/widgets/data_sharing_tabs.dart';
class DataSharingViewBody extends StatelessWidget {
  const DataSharingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.w),
      child: Column(
        children: [
          const CustomAppBar(),
          const DataSharingHeader(),
          16.verticalSpace,
          const DataSharingSummary(),
          20.verticalSpace,
          DataSharingTabs()
        ],
      ),
    );
  }
}
