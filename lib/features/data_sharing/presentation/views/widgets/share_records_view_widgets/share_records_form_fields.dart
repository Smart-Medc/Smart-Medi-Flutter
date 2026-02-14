import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/features/data_sharing/data/models/record_type_model.dart';
import 'package:smart_medi/features/data_sharing/presentation/views/widgets/share_records_view_widgets/access_expiration_section.dart';
import 'package:smart_medi/features/data_sharing/presentation/views/widgets/share_records_view_widgets/preview_section.dart';
import 'package:smart_medi/features/data_sharing/presentation/views/widgets/share_records_view_widgets/share_records_list.dart';

class ShareRecordsFormFields extends StatelessWidget {
  const ShareRecordsFormFields({
    super.key,
    required this.recordTypes,
    required this.onUpdate,
    required this.expirationController,
    required this.selectedRecords,
  });

  final List<RecordTypeModel> recordTypes;
  final VoidCallback onUpdate;
  final TextEditingController expirationController;
  final List<String> selectedRecords;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ShareRecordsList(
              recordTypes: recordTypes,
              onUpdate: onUpdate,
            ),

            20.verticalSpace,

            AccessExpirationSection(
              controller: expirationController,
            ),

            20.verticalSpace,

            PreviewSection(
              selectedRecords: selectedRecords,
            ),

            20.verticalSpace,
          ],
        ),
      ),
    );
  }
}

