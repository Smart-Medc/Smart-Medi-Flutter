import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_medi/core/routing/app_routes.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'package:smart_medi/core/widgets/app_header.dart';
import 'package:smart_medi/features/medical_journal/presentation/manager/get_medical_journals/get_medical_journals_cubit.dart';

class MedicalJournalHeader extends StatelessWidget {
  const MedicalJournalHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Expanded(
          child: AppHeader(
            title: 'Medical Journal',
            subtitle: 'Track your symptoms and daily observations',
          ),
        ),
        12.horizontalSpace,
        ElevatedButton.icon(
          onPressed: () async {
            final added = await GoRouter.of(context)
                .push<bool>(AppRoutes.addJournalEntry);
            if (added == true && context.mounted) {
              context
                  .read<GetMedicalJournalsCubit>()
                  .getMedicalJournalsForCurrentPatient();
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryColor,
            foregroundColor: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.r),
            ),
          ),
          icon: Icon(Icons.add, size: 18.sp),
          label: Text(
            'Add Entry',
            style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }
}
