import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/widgets/app_bar_back_button.dart';
import 'package:smart_medi/core/widgets/app_header.dart';
import 'package:smart_medi/features/medication_management/presentation/views/widgets/add_medication_widgets/add_medication_bloc_listener.dart';

class AddMedicationViewBody extends StatefulWidget {
  const AddMedicationViewBody({super.key});

  @override
  State<AddMedicationViewBody> createState() => _AddMedicationViewBodyState();
}

class _AddMedicationViewBodyState extends State<AddMedicationViewBody> {
  final TextEditingController _medicationNameController = TextEditingController();
  final TextEditingController _dosageController = TextEditingController();
  final TextEditingController _dosageFrequencyController = TextEditingController();
  final TextEditingController _dosageRouteController = TextEditingController();
  final TextEditingController _startDateController = TextEditingController();
  final TextEditingController _prescribingDoctorController = TextEditingController();

  @override
  void dispose() {
    _medicationNameController.dispose();
    _dosageController.dispose();
    _dosageFrequencyController.dispose();
    _dosageRouteController.dispose();
    _startDateController.dispose();
    _prescribingDoctorController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AppBarBackButton(),
              const AppHeader(
                title: 'Add Medication',
                subtitle: 'Add a new medication to your records',
              ),
              16.verticalSpace,
              AddMedicationBlocListener(
                medicationNameController: _medicationNameController,
                dosageController: _dosageController,
                dosageFrequencyController: _dosageFrequencyController,
                dosageRouteController: _dosageRouteController,
                startDateController: _startDateController,
                prescribingDoctorController: _prescribingDoctorController,
              ),
              100.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}



