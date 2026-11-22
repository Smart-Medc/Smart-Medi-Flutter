import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/features/auth/presentation/view/widgets/auth_header.dart';
import 'package:smart_medi/features/organization_feature/organization_sign_up/presentation/manager/organization_sign_up_cubit/organization_sign_up_cubit.dart';
import 'package:smart_medi/features/organization_feature/organization_sign_up/presentation/views/widgets/organization_sign_up_bloc_listener.dart';

class OrganizationSignUpBody extends StatelessWidget {
  const OrganizationSignUpBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(25.w),
      child: SingleChildScrollView(
        child: Column(
          children: [
            40.verticalSpace,
            BlocBuilder<OrganizationSignUpCubit, OrganizationSignUpState>(
              buildWhen: (previous, current) =>
                  current is OrganizationSignUpSuccess ||
                  previous is OrganizationSignUpSuccess,
              builder: (context, state) {
                final isApproved = state is OrganizationSignUpSuccess;
                return AuthHeader(
                  title: isApproved ? 'Waiting For Approval' : 'Create account',
                  subTitle: isApproved
                      ? 'Almost there'
                      : 'Fill your information below or register with your social account',
                );
              },
            ),
            30.verticalSpace,
            const OrganizationSignUpBlocListener(),
          ],
        ),
      ),
    );
  }
}
