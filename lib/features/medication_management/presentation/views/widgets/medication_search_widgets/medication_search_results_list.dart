import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/features/medication_management/data/models/get_medications_model/get_medication_response.dart';
import 'package:smart_medi/features/medication_management/presentation/views/widgets/medication_search_widgets/medication_search_result_card.dart';

class MedicationSearchResultsList extends StatelessWidget {
  const MedicationSearchResultsList({
    super.key,
    required this.medications,
  });

  final List<MedicationModel> medications;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemCount: medications.length,
      separatorBuilder: (_, __) => 12.verticalSpace,
      itemBuilder: (context, index) {
        return MedicationSearchResultCard(medication: medications[index]);
      },
    );
  }
}

