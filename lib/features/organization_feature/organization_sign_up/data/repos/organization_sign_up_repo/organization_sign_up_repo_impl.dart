import 'package:dartz/dartz.dart';
import 'package:smart_medi/core/helpers/api_helper.dart';
import 'package:smart_medi/core/networking/api_endpoints.dart';
import 'package:smart_medi/core/networking/api_failure.dart';
import 'package:smart_medi/core/networking/api_service.dart';
import 'package:smart_medi/features/organization_feature/organization_sign_up/data/models/organization_sign_up_models/organization_sign_up_request_model.dart';
import 'package:smart_medi/features/organization_feature/organization_sign_up/data/repos/organization_sign_up_repo/organization_sign_up_repo.dart';

class OrganizationSignUpRepoImpl extends OrganizationSignUpRepo {
  OrganizationSignUpRepoImpl({required this.apiService});

  final ApiService apiService;

  @override
  Future<Either<Failure, Unit>> signUpOrganization({
    required OrganizationSignUpRequestModel organizationSignUpRequestModel,
  }) async {
    return ApiHelper.execute<Unit>(() async {
      // NOTE: assumes ApiService.post forwards `data` straight to Dio, which
      // auto-detects FormData and sends it as multipart/form-data. If your
      // ApiService JSON-encodes `data` internally instead, this call needs a
      // dedicated multipart method there.
      final formData = await organizationSignUpRequestModel.toFormData();
      await apiService.postWithFormData(
        endPoint: ApiEndpoints.signUpOrganization(),
        formData: formData,
      );
      return unit;
    });
  }
}
