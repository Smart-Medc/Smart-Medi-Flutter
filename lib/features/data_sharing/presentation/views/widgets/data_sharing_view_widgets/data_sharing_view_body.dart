import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/widgets/custom_app_bar.dart';
import 'package:smart_medi/features/data_sharing/presentation/views/widgets/data_sharing_view_widgets/data_sharing_bloc_builder.dart';
import 'package:smart_medi/features/data_sharing/presentation/views/widgets/data_sharing_view_widgets/data_sharing_bloc_listener.dart';
import 'package:smart_medi/features/data_sharing/presentation/views/widgets/data_sharing_view_widgets/data_sharing_header.dart';
class DataSharingViewBody extends StatelessWidget {
  const DataSharingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return DataSharingBlocListener(
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 25.w),
            sliver: SliverMainAxisGroup(
              slivers: [
                const SliverToBoxAdapter(child: CustomAppBar()),
                const SliverToBoxAdapter(child: DataSharingHeader()),
                SliverToBoxAdapter(child: 16.verticalSpace),
                const DataSharingBlocBuilder(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
