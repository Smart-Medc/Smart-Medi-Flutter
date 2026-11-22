import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_medi/core/helpers/service_locator.dart';
import 'package:smart_medi/features/organization_feature/organization_sign_up/data/repos/organization_sign_up_repo/organization_sign_up_repo.dart';
import 'package:smart_medi/features/organization_feature/organization_sign_up/presentation/manager/organization_sign_up_cubit/organization_sign_up_cubit.dart';
import 'package:smart_medi/features/organization_feature/organization_sign_up/presentation/views/widgets/organization_sign_up_body.dart';

class OrganizationSignUpView extends StatelessWidget {
  const OrganizationSignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocProvider(
          create: (context) => OrganizationSignUpCubit(getIt<OrganizationSignUpRepo>()),
          child: const OrganizationSignUpBody(),
        ),
      ),
    );
  }
}
