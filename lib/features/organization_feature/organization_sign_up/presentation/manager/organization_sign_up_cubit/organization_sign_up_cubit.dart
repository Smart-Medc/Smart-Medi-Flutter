import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:smart_medi/features/organization_feature/organization_sign_up/data/models/organization_sign_up_models/organization_sign_up_request_model.dart';
import 'package:smart_medi/features/organization_feature/organization_sign_up/data/repos/organization_sign_up_repo/organization_sign_up_repo.dart';

part 'organization_sign_up_state.dart';

class OrganizationSignUpCubit extends Cubit<OrganizationSignUpState> {
  OrganizationSignUpCubit(this.organizationSignUpRepo) : super(OrganizationSignUpInitial());
  final OrganizationSignUpRepo organizationSignUpRepo;

  Future<void> registerOrganization(OrganizationSignUpRequestModel requestModel) async {
    emit(OrganizationSignUpLoading());
    final response = await organizationSignUpRepo.signUpOrganization(
      organizationSignUpRequestModel: requestModel,
    );
    response.fold(
      (failure) => emit(OrganizationSignUpFailure(message: failure.message)),
      (unit) => emit(OrganizationSignUpSuccess()),
    );
  }
}
