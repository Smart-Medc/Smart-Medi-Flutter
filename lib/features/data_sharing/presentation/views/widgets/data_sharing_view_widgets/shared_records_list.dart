import 'package:flutter/material.dart';
import 'package:smart_medi/features/data_sharing/data/models/shared_record_model.dart';
import 'package:smart_medi/features/data_sharing/presentation/views/widgets/data_sharing_view_widgets/shared_record_item.dart';

class SharedRecordsList extends StatelessWidget {
  const SharedRecordsList({
    super.key,
    required this.sharedRecords,
  });

  final List<SharedRecordModel> sharedRecords;

  @override
  Widget build(BuildContext context) {
    if (sharedRecords.isEmpty) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(40.0),
          child: Text(
            'No shared records found',
            style: TextStyle(color: Colors.grey),
          ),
        ),
      );
    }

    return Expanded(
      child: ListView.builder(
        itemCount: sharedRecords.length,
        itemBuilder: (context, index) {
          return SharedRecordItem(sharedRecord: sharedRecords[index]);
        },
      ),
    );
  }
}

