import 'package:flutter/material.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'package:smart_medi/features/medication_management/data/models/get_medications_model/get_medication_response.dart';
import 'package:smart_medi/features/medication_management/presentation/views/widgets/medication_search_widgets/medication_search_view_body.dart';

class MedicationSearchView extends StatelessWidget {
  const MedicationSearchView({
    super.key,
    required this.medications,
  });

  final List<MedicationModel> medications;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.whiteBackgroundColor,
        body: MedicationSearchViewBody(medications: medications),
      ),
    );
  }
}

