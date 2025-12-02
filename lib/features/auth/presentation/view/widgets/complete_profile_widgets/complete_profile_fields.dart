import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/helpers/validator.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'package:smart_medi/core/widgets/custom_button.dart';
import 'package:smart_medi/core/widgets/custom_text_form_field.dart';
import 'package:smart_medi/features/auth/presentation/view/widgets/auth_field_title.dart';
import 'package:smart_medi/features/auth/presentation/view/widgets/complete_profile_widgets/allergies_field.dart';
import 'package:smart_medi/features/auth/presentation/view/widgets/complete_profile_widgets/emergency_contact.dart';
import 'package:smart_medi/features/auth/presentation/view/widgets/complete_profile_widgets/gender_field.dart';
class CompleteProfileFields extends StatefulWidget {
  const CompleteProfileFields({super.key});

  @override
  State<CompleteProfileFields> createState() => _CompleteProfileFieldsState();
}

class _CompleteProfileFieldsState extends State<CompleteProfileFields> {
  final TextEditingController dateController = TextEditingController();
  final TextEditingController bloodTypeController = TextEditingController();
  final TextEditingController contactNameController = TextEditingController();
  final TextEditingController contactNumberController = TextEditingController();
  final TextEditingController relationshipController = TextEditingController();
  final TextEditingController allergiesController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String gender = 'Male';
  bool noKnownAllergies = false;

  @override
  void dispose() {
    dateController.dispose();
    bloodTypeController.dispose();
    contactNameController.dispose();
    contactNumberController.dispose();
    relationshipController.dispose();
    allergiesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          authFieldTitle('Date Of Birth'),
          4.verticalSpace,
          CustomTextFormField.date(hintText: 'dd/mm/yyyy', controller: dateController,validator: (value) => Validator.requiredValidator(value, 'Please select your birthday'),),
          16.verticalSpace,
          authFieldTitle('Gender'),
          4.verticalSpace,
          GenderSelectionField(initialGender: gender,onGenderChanged: (value){
            gender = value;
            setState(() {});
          },),
          16.verticalSpace,
          authFieldTitle('Blood Type'),
          4.verticalSpace,
          CustomTextFormField.dropdown(
            hintText: 'Select your blood type',
            validator: (value) => Validator.requiredValidator(value, 'Please select your blood type'),
            controller: bloodTypeController, dropdownItems: const ['A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-'],
          ),
          16.verticalSpace,
          AllergiesField(
            allergiesController: allergiesController,
            onNoAllergiesChanged: (value) {
              noKnownAllergies = value;
              setState(() {});
            },
          ),
          16.verticalSpace,
          const Divider(color: AppColors.formFieldFillColor,),
          16.verticalSpace,
          EmergencyContact(
            contactNameController: contactNameController,
            contactNumberController: contactNumberController,
            relationshipController: relationshipController,
          ),
          24.verticalSpace,
          CustomButton(text: 'Complete Profile',onPressed: (){
            if(formKey.currentState!.validate()){
              // Complete profile action
            }
          },)
        ],
      ),
    );
  }
}
