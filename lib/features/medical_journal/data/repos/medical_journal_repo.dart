import 'package:dartz/dartz.dart';
import 'package:smart_medi/core/networking/api_failure.dart';
import 'package:smart_medi/features/medical_journal/data/models/add_journal_models/add_journal_request.dart';
import 'package:smart_medi/features/medical_journal/data/models/get_journals_models/get_journal_response.dart';

abstract class MedicalJournalRepo {
  Future<Either<Failure, Unit>> addJournalEntry({
    required String patientId,
    required AddJournalRequest addJournalRequest,
  });
  Future<Either<Failure, GetJournalResponse>> getMedicalJournals({
    required String patientId,
  });

  Future<Either<Failure, Unit>> deleteJournalEntry({
    required String patientId,
    required String journalId,
  });
}