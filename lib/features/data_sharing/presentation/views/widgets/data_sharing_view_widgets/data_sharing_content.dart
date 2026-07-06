import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/features/data_sharing/data/models/get_shared_records_models/get_shared_records_response.dart';
import 'package:smart_medi/features/data_sharing/presentation/views/widgets/data_sharing_view_widgets/data_sharing_hint_box.dart';
import 'package:smart_medi/features/data_sharing/presentation/views/widgets/data_sharing_view_widgets/data_sharing_summary.dart';
import 'package:smart_medi/features/data_sharing/presentation/views/widgets/data_sharing_view_widgets/data_sharing_tabs.dart';

class DataSharingContent extends StatelessWidget {
  const DataSharingContent({super.key, required this.getSharedRecordsResponse});
  final GetSharedRecordsResponse getSharedRecordsResponse;
  @override
  Widget build(BuildContext context) {
    return SliverMainAxisGroup(
      slivers: [
        SliverToBoxAdapter(child: DataSharingSummary(getSharedRecordsResponse: getSharedRecordsResponse,)),
        SliverToBoxAdapter(child: 16.verticalSpace),
        const SliverToBoxAdapter(child: DataSharingHintBox()),
        SliverToBoxAdapter(child: 20.verticalSpace),
        DataSharingTabs(getSharedRecordsResponse: getSharedRecordsResponse,),
      ],
    );
  }
}
