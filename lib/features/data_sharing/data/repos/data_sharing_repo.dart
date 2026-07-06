import 'package:dartz/dartz.dart';
import 'package:smart_medi/core/networking/api_failure.dart';
import 'package:smart_medi/features/data_sharing/data/models/get_shared_records_models/get_shared_records_response.dart';
import 'package:smart_medi/features/data_sharing/data/models/share_records_models/share_records_request.dart';

abstract class DataSharingRepo {
  Future<Either<Failure, GetSharedRecordsResponse>> getSharedRecords();
  Future<Either<Failure, SharedRecordModel>> shareRecords({required ShareRecordsRequest shareRecordsRequest});
}