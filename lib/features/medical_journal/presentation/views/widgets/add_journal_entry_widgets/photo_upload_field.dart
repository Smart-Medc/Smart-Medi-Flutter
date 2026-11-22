import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'package:smart_medi/core/utils/app_styles.dart';

/// A widget for uploading photos in journal entries
class PhotoUploadField extends StatelessWidget {
  const PhotoUploadField({
    super.key,
    required this.label,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label
        Text(
          label,
          style: AppStyles.textStyle14W400Black,
        ),
        8.verticalSpace,
        // Upload button
        GestureDetector(
          onTap: () {
            // TODO: Implement file picker
            // Example:
            // final ImagePicker picker = ImagePicker();
            // final List<XFile> images = await picker.pickMultiImage();
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            decoration: BoxDecoration(
              color: AppColors.formFieldBGColor,
              borderRadius: BorderRadius.circular(10.r),
              border: Border.all(color: AppColors.formFieldStrokeColor),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Choose File',
                  style: AppStyles.textStyle14W400Black.copyWith(
                    color: AppColors.formFieldHintColor,
                  ),
                ),
                Icon(
                  Icons.upload_file,
                  color: AppColors.textDarkGrey,
                  size: 20.sp,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

