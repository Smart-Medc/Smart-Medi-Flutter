import 'package:dartz/dartz.dart';
import 'package:smart_medi/core/networking/api_failure.dart';
import 'package:smart_medi/features/medical_records/data/models/get_medical_record_details_models/get_medical_record_details_response.dart';
import 'package:smart_medi/features/medical_records/data/models/get_medical_records_models/get_medical_records_response.dart';
import 'package:smart_medi/features/medical_records/data/models/get_medical_records_statistics/get_medical_records_statistics_response.dart';

abstract class MedicalRecordsRepo{
  Future<Either<Failure, GetMedicalRecordsResponse>> getMedicalRecords({required String patientId});
  Future<Either<Failure, GetMedicalRecordDetailsResponse>> getMedicalRecordDetails({required String patientId, required String recordId});
  Future<Either<Failure, Unit>> deleteMedicalRecord({required String patientId, required String recordId});
  Future<Either<Failure, GetMedicalRecordsStatisticsResponse>> getMedicalRecordsStatistics({required String patientId});
}