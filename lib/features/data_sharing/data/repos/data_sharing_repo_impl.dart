import 'package:dartz/dartz.dart';
import 'package:smart_medi/core/helpers/api_helper.dart';
import 'package:smart_medi/core/networking/api_endpoints.dart';
import 'package:smart_medi/core/networking/api_failure.dart';
import 'package:smart_medi/core/networking/api_service.dart';
import 'package:smart_medi/features/data_sharing/data/models/get_shared_records_models/get_shared_records_response.dart';
import 'package:smart_medi/features/data_sharing/data/repos/data_sharing_repo.dart';

class DataSharingRepoImpl extends DataSharingRepo{
  DataSharingRepoImpl({required this.apiService});

  final ApiService apiService;
  @override
  Future<Either<Failure, GetSharedRecordsResponse>> getSharedRecords() {
    return ApiHelper.execute<GetSharedRecordsResponse>(() async {
      final response = await apiService.get(
        endpoint: ApiEndpoints.getSharedRecords(),
      );
      return GetSharedRecordsResponse.fromJson(response);
    });
  }

  @override
  Future<Either<Failure, GetSharedRecordsResponse>> shareRecords() {
    return ApiHelper.execute<GetSharedRecordsResponse>(() async {
      final response = await apiService.post(
        endpoint: ApiEndpoints.shareRecords(),
      );
      return GetSharedRecordsResponse.fromJson(response);
    });
  }

}