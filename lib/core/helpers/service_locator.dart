import 'package:get_it/get_it.dart';
import 'package:smart_medi/core/networking/api_service.dart';
import 'package:smart_medi/core/networking/dio_factory.dart';
import 'package:smart_medi/features/appointment/data/repos/appointment_repo.dart';
import 'package:smart_medi/features/appointment/data/repos/appointment_repo_impl.dart';
import 'package:smart_medi/features/auth/data/repos/login_repo/login_repo.dart';
import 'package:smart_medi/features/auth/data/repos/login_repo/login_repo_impl.dart';
import 'package:smart_medi/features/auth/data/repos/password_recovery_repo/password_recovery_repo.dart';
import 'package:smart_medi/features/auth/data/repos/password_recovery_repo/password_recovery_repo_impl.dart';
import 'package:smart_medi/features/auth/data/repos/registration_repo/registration_repo.dart';
import 'package:smart_medi/features/auth/data/repos/registration_repo/registration_repo_impl.dart';
import 'package:smart_medi/features/data_sharing/data/repos/data_sharing_repo.dart';
import 'package:smart_medi/features/data_sharing/data/repos/data_sharing_repo_impl.dart';
import 'package:smart_medi/features/medical_records/data/repos/medical_records_repo.dart';
import 'package:smart_medi/features/medical_records/data/repos/medical_records_repo_impl.dart';
import 'package:smart_medi/features/medication_management/data/repos/medication_management_repo.dart';
import 'package:smart_medi/features/medication_management/data/repos/medication_management_repo_impl.dart';
import 'package:smart_medi/features/medical_journal/data/repos/medical_journal_repo.dart';
import 'package:smart_medi/features/medical_journal/data/repos/medical_journal_repo_impl.dart';


final getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  // Get configured Dio instance from DioFactory
  final dio = await DioFactory.getInstance();

  getIt.registerSingleton<ApiService>(ApiService(dio));

  // Auth repositories
  getIt.registerSingleton<LoginRepo>(LoginRepoImpl(
    apiService: getIt.get<ApiService>(),
  ));

  getIt.registerSingleton<RegistrationRepo>(RegistrationRepoImpl(
    apiService: getIt.get<ApiService>(),
  ));

  getIt.registerSingleton<PasswordRecoveryRepo>(PasswordRecoveryRepoImpl(
    apiService: getIt.get<ApiService>(),
  ));

  // Medication repositories
  getIt.registerSingleton<MedicationManagementRepo>(MedicationManagementRepoImpl(
    apiService: getIt.get<ApiService>(),
  ));

  // Medical journal repositories
  getIt.registerSingleton<MedicalJournalRepo>(MedicalJournalRepoImpl(
    apiService: getIt.get<ApiService>(),
  ));

  // Appointment repositories
  getIt.registerSingleton<AppointmentRepo>(AppointmentRepoImpl(
    apiService: getIt.get<ApiService>(),
  ));

  // Medical Records repositories
   getIt.registerSingleton<MedicalRecordsRepo>(MedicalRecordsRepoImpl(
     apiService: getIt.get<ApiService>(),
   ));

   // Data Sharing repositories
   getIt.registerSingleton<DataSharingRepo>(DataSharingRepoImpl(
     apiService: getIt.get<ApiService>(),
   ));

}
