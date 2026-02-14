import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/utils/app_styles.dart';
import 'package:smart_medi/features/data_sharing/data/models/record_type_model.dart';
import 'package:smart_medi/features/data_sharing/presentation/views/widgets/share_records_view_widgets/record_type_item.dart';

class ShareRecordsList extends StatelessWidget {
  const ShareRecordsList({
    super.key,
    required this.recordTypes,
    required this.onUpdate,
  });

  final List<RecordTypeModel> recordTypes;
  final VoidCallback onUpdate;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Select Records to Share',
          style: AppStyles.textStyle14W400Black,
        ),
        16.verticalSpace,

        ...recordTypes.map((recordType) {
          return RecordTypeItem(
            recordType: recordType,
            onUpdate: onUpdate,
          );
        }).toList(),
      ],
    );
  }
}

