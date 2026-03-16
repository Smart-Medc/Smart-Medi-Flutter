import 'package:dartz/dartz.dart';
import 'package:smart_medi/core/helpers/api_helper.dart';
import 'package:smart_medi/core/networking/api_endpoints.dart';
import 'package:smart_medi/core/networking/api_failure.dart';
import 'package:smart_medi/core/networking/api_service.dart';
import 'package:smart_medi/features/medical_journal/data/models/add_journal_models/add_journal_request.dart';
import 'package:smart_medi/features/medical_journal/data/repos/medical_journal_repo.dart';

class MedicalJournalRepoImpl extends MedicalJournalRepo{
  MedicalJournalRepoImpl({required this.apiService});

  final ApiService apiService;
  @override
  Future<Either<Failure, Unit>> addJournalEntry({required String patientId, required AddJournalRequest addJournalRequest}) async{
    return ApiHelper.execute<Unit>(() async {
      await apiService.post(
        endpoint: ApiEndpoints.addPatientJournal(patientId: patientId),
        data: addJournalRequest.toJson(),
      );
      return unit;
    });
  }

}