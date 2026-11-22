import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_medi/core/widgets/custom_loading_indicator.dart';
import 'package:smart_medi/features/organization_feature/organization_sign_up/presentation/manager/organization_sign_up_cubit/organization_sign_up_cubit.dart';
import 'package:smart_medi/features/organization_feature/organization_sign_up/presentation/views/widgets/organization_sign_up_fields.dart';
import 'package:smart_medi/features/organization_feature/organization_sign_up/presentation/views/widgets/organization_waiting_approval_step.dart';

class OrganizationSignUpBlocListener extends StatelessWidget {
  const OrganizationSignUpBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrganizationSignUpCubit, OrganizationSignUpState>(
      listener: (context, state) {
        if (state is OrganizationSignUpLoading) {
          showLoadingDialog(context, message: 'Submitting your application...');
        } else if (state is OrganizationSignUpSuccess) {
          hideLoadingDialog(context);
        } else if (state is OrganizationSignUpFailure) {
          hideLoadingDialog(context);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Sign Up Failed: ${state.message}'),
              duration: const Duration(seconds: 5),
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is OrganizationSignUpSuccess) {
          return const OrganizationWaitingApprovalStep();
        }
        return const OrganizationSignUpFields();
      },
    );
  }
}
