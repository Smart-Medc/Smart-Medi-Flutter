import 'package:dartz/dartz.dart';
import 'package:smart_medi/core/networking/api_failure.dart';
import 'package:smart_medi/features/medical_journal/data/models/add_journal_models/add_journal_request.dart';

abstract class MedicalJournalRepo {
  Future<Either<Failure, Unit>> addJournalEntry({
    required String patientId,
    required AddJournalRequest addJournalRequest,
  });
}