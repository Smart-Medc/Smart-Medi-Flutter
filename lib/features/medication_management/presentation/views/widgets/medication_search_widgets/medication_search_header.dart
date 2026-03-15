import 'package:flutter/material.dart';
import 'package:smart_medi/core/widgets/app_bar_back_button.dart';
import 'package:smart_medi/core/widgets/app_header.dart';

class MedicationSearchHeader extends StatelessWidget {
  const MedicationSearchHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppBarBackButton(),
        AppHeader(
          title: 'Search Medication',
          subtitle: 'Find medications by name, doctor, dosage, or status',
        ),
      ],
    );
  }
}
