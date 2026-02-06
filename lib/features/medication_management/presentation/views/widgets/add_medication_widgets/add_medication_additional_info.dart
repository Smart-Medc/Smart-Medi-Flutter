import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/utils/app_styles.dart';
import 'package:smart_medi/core/widgets/custom_text_form_field.dart';

class AddMedicationAdditionalInfo extends StatelessWidget {
  const AddMedicationAdditionalInfo({
    super.key,
    required this.startDateController,
    required this.prescribingDoctorController,
  });

  final TextEditingController startDateController;
  final TextEditingController prescribingDoctorController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Start Date',
          style: AppStyles.textStyle14W400Black,
        ),
        8.verticalSpace,
        CustomTextFormField.date(
          controller: startDateController,
          hintText: 'mm/dd/yyyy',
        ),
        16.verticalSpace,
        Text(
          'Prescribing Doctor',
          style: AppStyles.textStyle14W400Black,
        ),
        8.verticalSpace,
        CustomTextFormField(
          controller: prescribingDoctorController,
          hintText: 'Enter doctor\'s name',
        ),
      ],
    );
  }
}

