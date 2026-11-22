import 'package:dartz/dartz.dart';
import 'package:smart_medi/core/networking/api_failure.dart';
import 'package:smart_medi/features/organization_feature/organization_sign_up/data/models/organization_sign_up_models/organization_sign_up_request_model.dart';

abstract class OrganizationSignUpRepo {
  Future<Either<Failure, Unit>> signUpOrganization({
    required OrganizationSignUpRequestModel organizationSignUpRequestModel,
  });
}
