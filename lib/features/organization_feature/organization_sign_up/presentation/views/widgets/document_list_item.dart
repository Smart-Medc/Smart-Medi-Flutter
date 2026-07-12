import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/utils/app_styles.dart';
import 'package:smart_medi/features/organization_feature/organization_sign_up/data/models/picked_document.dart';

class DocumentListItem extends StatelessWidget {
  const DocumentListItem({
    super.key,
    required this.document,
    required this.onDelete,
  });

  final PickedDocument document;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: const Color(0xFFE5E7EB)),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.description_outlined,
            color: Color(0xFF2563EB),
            size: 20,
          ),
          10.horizontalSpace,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  document.name,
                  style: AppStyles.textStyle14W400Black,
                  overflow: TextOverflow.ellipsis,
                ),
                2.verticalSpace,
                Row(
                  children: [
                    Text(
                      document.sizeLabel,
                      style: TextStyle(fontSize: 11.sp, color: Colors.grey.shade500),
                    ),
                    6.horizontalSpace,
                    const Icon(Icons.check_circle, size: 12, color: Color(0xFF059669)),
                    4.horizontalSpace,
                    const Text(
                      'Ready',
                      style: TextStyle(fontSize: 11, color: Color(0xFF059669)),
                    ),
                  ],
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: onDelete,
            icon: const Icon(Icons.delete_outline, color: Colors.red, size: 20),
          ),
        ],
      ),
    );
  }
}
