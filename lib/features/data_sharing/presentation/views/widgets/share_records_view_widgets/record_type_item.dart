import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/utils/app_styles.dart';
import 'package:smart_medi/core/widgets/card_container.dart';
import 'package:smart_medi/features/data_sharing/data/models/record_type_model.dart';
import 'package:smart_medi/features/data_sharing/presentation/views/widgets/share_records_view_widgets/record_checkbox.dart';

class RecordTypeItem extends StatelessWidget {
  const RecordTypeItem({
    super.key,
    required this.recordType,
    required this.onUpdate,
  });

  final RecordTypeModel recordType;
  final VoidCallback onUpdate;


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Parent record type
        Padding(
          padding: EdgeInsets.only(bottom: 12.h),
          child: Row(
            children: [
              RecordCheckbox(
                size: 20,
                isSelected: recordType.isTypeSelected,
                onTap: () {
                  recordType.toggleType();
                  onUpdate();
                },
              ),
              8.horizontalSpace,
              Expanded(
                child: Text(
                  recordType.typeName,
                  style: AppStyles.textStyle14W400Black,
                ),
              ),
            ],
          ),
        ),

        // Child records
        ...recordType.records.map((record) {
          return Padding(
            padding: EdgeInsets.only(
              bottom: 8.h,
            ),
            child: InkWell(
              onTap: () {
                recordType.toggleRecord(record);
                onUpdate();
              },
              child: CardContainer(
                padding: EdgeInsets.only(left: 11.w, top: 15.h, bottom: 15.h),
                child: Row(
                  children: [
                    RecordCheckbox(
                      isSelected: recordType.selectedRecords[record] ?? false,
                      onTap: () {
                        recordType.toggleRecord(record);
                        onUpdate();
                      },
                    ),
                    12.horizontalSpace,
                    Expanded(
                      child: Text(
                        record,
                        style: AppStyles.textStyle14W400Black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }).toList(),

        12.verticalSpace,
      ],
    );
  }
}

