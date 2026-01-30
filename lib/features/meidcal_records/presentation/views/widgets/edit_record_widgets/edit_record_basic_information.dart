import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'package:smart_medi/core/utils/app_shadows.dart';
import 'package:smart_medi/core/utils/app_styles.dart';
import 'package:smart_medi/core/widgets/custom_text_form_field.dart';

class EditRecordBasicInformation extends StatefulWidget {
  const EditRecordBasicInformation({super.key});

  @override
  State<EditRecordBasicInformation> createState() => _EditRecordBasicInformationState();
}

class _EditRecordBasicInformationState extends State<EditRecordBasicInformation> {
  final TextEditingController _recordTitleController = TextEditingController();
  final TextEditingController _recordTypeController = TextEditingController(text: 'Imaging');
  final TextEditingController _startDateController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();


  final List<String> _recordTypes = [
    'Lab Report',
    'Imaging',
    'Consultation Notes',
    'Immunization',
    'Prescription',
    'Other',
  ];

  @override
  void dispose() {
    _recordTitleController.dispose();
    _recordTypeController.dispose();
    _startDateController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: AppColors.formFieldStrokeColor),
        boxShadow: AppShadows.medium,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Basic Information', style: AppStyles.textStyle24W600Black),
          16.verticalSpace,

          // Record Title
          _buildFieldLabel('Record Title', isRequired: true),
          8.verticalSpace,
          CustomTextFormField(
            controller: _recordTitleController,
            hintText: 'Chest X-Ray',
          ),
          16.verticalSpace,

          // Record Type
          _buildFieldLabel('Record Type', isRequired: true),
          8.verticalSpace,
          CustomTextFormField.dropdown(
            controller: _recordTypeController,
            hintText: 'Select record type',
            dropdownItems: _recordTypes,
          ),
          16.verticalSpace,

          // Start Date
          _buildFieldLabel('Start Date'),
          8.verticalSpace,
          CustomTextFormField.date(
            controller: _startDateController,
            hintText: '03/10/2024',
          ),
          16.verticalSpace,

          // Description
          _buildFieldLabel('Description'),
          8.verticalSpace,
          TextFormField(
            controller: _descriptionController,
            maxLines: 4,
            decoration: InputDecoration(
              hintText: 'Chest X-ray imaging study for routine health screening.',
              hintStyle: AppStyles.textStyle12W400DarkGrey,
              filled: true,
              fillColor: AppColors.formFieldBGColor,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: BorderSide(
                  color: AppColors.formFieldStrokeColor,
                  width: 1.sp,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: BorderSide(
                  color: AppColors.formFieldStrokeColor,
                  width: 1.sp,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFieldLabel(String label, {bool isRequired = false}) {
    return RichText(
      text: TextSpan(
        text: label,
        style: AppStyles.textStyle14W400Black,
        children: isRequired
            ? [
                TextSpan(
                  text: ' *',
                  style: AppStyles.textStyle14W400Black.copyWith(
                    color: Colors.red,
                  ),
                ),
              ]
            : [],
      ),
    );
  }
}

