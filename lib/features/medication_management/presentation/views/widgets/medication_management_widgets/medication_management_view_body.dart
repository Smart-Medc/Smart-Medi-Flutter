import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_medi/core/routing/app_routes.dart';
import 'package:smart_medi/core/widgets/app_search_bar.dart';
import 'package:smart_medi/core/widgets/custom_app_bar.dart';
import 'package:smart_medi/features/medication_management/data/models/get_medications_model/get_medication_response.dart';
import 'package:smart_medi/features/medication_management/presentation/manager/get_medications_cubit/get_medications_cubit.dart';
import 'package:smart_medi/features/medication_management/presentation/views/widgets/medication_management_widgets/add_medication_button.dart';
import 'package:smart_medi/features/medication_management/presentation/views/widgets/medication_management_widgets/medication_management_data_section.dart';
import 'package:smart_medi/features/medication_management/presentation/views/widgets/medication_management_widgets/medication_management_header.dart';

class MedicationManagementViewBody extends StatelessWidget {
  const MedicationManagementViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<GetMedicationsCubit>().state;
    final medications = state is GetMedicationsSuccess
        ? state.medications.medications
        : const <MedicationModel>[];

    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverPadding(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
          sliver: SliverMainAxisGroup(
            slivers: [
              const SliverToBoxAdapter(child: CustomAppBar()),
              const SliverToBoxAdapter(
                child: MedicationManagementHeader(),
              ),
              SliverToBoxAdapter(
                child: AppSearchBar(
                  hintText: 'Search medications',
                  showFilter: false,
                  readOnly: true,
                  onTap: () => context.push(
                    AppRoutes.medicationSearch,
                    extra: {'medications': medications},
                  ),
                ),
              ),
              const MedicationManagementDataSection(),
              SliverToBoxAdapter(child: 16.verticalSpace),
              const SliverToBoxAdapter(
                child: SizedBox(width: double.infinity, child: AddMedicationButton()),
              ),
              SliverToBoxAdapter(child: 100.verticalSpace),
            ],
          ),
        ),
      ],
    );
  }
}


