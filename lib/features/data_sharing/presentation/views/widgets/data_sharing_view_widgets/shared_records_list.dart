import 'package:flutter/material.dart';
import 'package:smart_medi/features/data_sharing/data/models/get_shared_records_models/get_shared_records_response.dart';
import 'package:smart_medi/features/data_sharing/presentation/views/widgets/data_sharing_view_widgets/shared_record_item.dart';

class SharedRecordsList extends StatelessWidget {
  const SharedRecordsList({super.key, required this.sharedRecords});

  final List<SharedRecordModel> sharedRecords;

  @override
  Widget build(BuildContext context) {
    if (sharedRecords.isEmpty) {
      return const SliverToBoxAdapter(
        child:  Center(
          child: Padding(
            padding: EdgeInsets.all(40.0),
            child: Text(
              'No shared records found',
              style: TextStyle(color: Colors.grey),
            ),
          ),
        ),
      );
    }

    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        return SharedRecordItem(sharedRecord: sharedRecords[index]);
      }, childCount: sharedRecords.length),
    );
  }
}
