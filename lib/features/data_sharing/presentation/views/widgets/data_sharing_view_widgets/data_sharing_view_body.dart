import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/widgets/custom_app_bar.dart';
import 'package:smart_medi/features/data_sharing/presentation/views/widgets/data_sharing_view_widgets/data_sharing_header.dart';
import 'package:smart_medi/features/data_sharing/presentation/views/widgets/data_sharing_view_widgets/data_sharing_hint_box.dart';
import 'package:smart_medi/features/data_sharing/presentation/views/widgets/data_sharing_view_widgets/data_sharing_summary.dart';
import 'package:smart_medi/features/data_sharing/presentation/views/widgets/data_sharing_view_widgets/data_sharing_tabs.dart';
class DataSharingViewBody extends StatelessWidget {
  const DataSharingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          sliver: SliverMainAxisGroup(
            slivers: [
              const SliverToBoxAdapter(child: CustomAppBar()),
              const SliverToBoxAdapter(child: DataSharingHeader()),
              SliverToBoxAdapter(child: 16.verticalSpace),
              const SliverToBoxAdapter(child: DataSharingSummary()),
              SliverToBoxAdapter(child: 16.verticalSpace),
              const SliverToBoxAdapter(child: DataSharingHintBox()),
              SliverToBoxAdapter(child: 20.verticalSpace),
              const DataSharingTabs(),
            ],
          ),
        ),
      ],
    );
  }
}
