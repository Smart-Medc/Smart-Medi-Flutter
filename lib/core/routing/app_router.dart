import 'package:go_router/go_router.dart';
import 'package:smart_medi/core/routing/app_routes.dart';
import 'package:smart_medi/core/routing/auth_guard.dart';
import 'package:smart_medi/features/ai_assistant/presentation/views/ai_assistant_view.dart';
import 'package:smart_medi/features/appointment/data/models/get_appointments_models/get_appointments_response.dart';
import 'package:smart_medi/features/appointment/data/models/get_organizations_models/get_organizations_response.dart';
import 'package:smart_medi/features/appointment/data/models/post_appointment_models/post_appointment_response.dart';
import 'package:smart_medi/features/appointment/presentation/views/appointment_view.dart';
import 'package:smart_medi/features/appointment/presentation/views/appointments_cancel_view.dart';
import 'package:smart_medi/features/appointment/presentation/views/appointments_confirmed_view.dart';
import 'package:smart_medi/features/appointment/presentation/views/appointments_details_view.dart';
import 'package:smart_medi/features/appointment/presentation/views/appointments_reschedule_view.dart';
import 'package:smart_medi/features/appointment/presentation/views/available_appointment_detail_view.dart';
import 'package:smart_medi/features/appointment/presentation/views/available_appointment_view.dart';
import 'package:smart_medi/features/appointment/presentation/views/book_appointments_view.dart';
import 'package:smart_medi/features/appointment/presentation/views/complete_booking_view.dart';
import 'package:smart_medi/features/auth/presentation/view/complete_profile_view.dart';
import 'package:smart_medi/features/auth/presentation/view/forget_password_view.dart';
import 'package:smart_medi/features/auth/presentation/view/login_view.dart';
import 'package:smart_medi/features/auth/presentation/view/otp_verification_view.dart';
import 'package:smart_medi/features/auth/presentation/view/reset_password_view.dart';
import 'package:smart_medi/features/auth/presentation/view/sign_up_view.dart';
import 'package:smart_medi/features/data_sharing/data/models/get_shared_records_models/get_shared_records_response.dart';
import 'package:smart_medi/features/data_sharing/presentation/views/code_generated_view.dart';
import 'package:smart_medi/features/data_sharing/presentation/views/data_sharing_view.dart';
import 'package:smart_medi/features/data_sharing/presentation/views/share_records_view.dart';
import 'package:smart_medi/features/home/presentation/views/home_view.dart';
import 'package:smart_medi/features/medical_journal/data/models/get_journals_models/get_journal_response.dart';
import 'package:smart_medi/features/medical_journal/presentation/views/add_journal_entry_view.dart';
import 'package:smart_medi/features/medical_journal/presentation/views/edit_journal_entry_view.dart';
import 'package:smart_medi/features/medical_journal/presentation/views/journal_element_details_view.dart';
import 'package:smart_medi/features/medical_records/presentation/views/edit_record_view.dart';
import 'package:smart_medi/features/medical_records/presentation/views/medical_records_view.dart';
import 'package:smart_medi/features/medical_records/presentation/views/record_details_view.dart';
import 'package:smart_medi/features/medication_management/presentation/views/add_medication_view.dart';
import 'package:smart_medi/features/medication_management/presentation/views/edit_medication_view.dart';
import 'package:smart_medi/features/medication_management/presentation/views/medication_management_view.dart';
import 'package:smart_medi/features/medication_management/presentation/views/medication_search_view.dart';
import 'package:smart_medi/features/medical_journal/presentation/views/medical_journal_view.dart';
import 'package:smart_medi/features/medication_management/data/models/get_medications_model/get_medication_response.dart';
import 'package:smart_medi/features/notifications/presentation/views/notifications_view.dart';
import 'package:smart_medi/features/organization_feature/Appointment%20Requests/presentation/views/appointment_details_screen.dart';
import 'package:smart_medi/features/organization_feature/Appointment%20Requests/presentation/views/appointment_requests_view.dart';
import 'package:smart_medi/features/organization_feature/Dashboard/presentation/views/organization_dashboard_view.dart';
import 'package:smart_medi/features/organization_feature/organization_availability/presentaion/views/availability_calender_view.dart';
import 'package:smart_medi/features/organization_feature/organization_sign_up/presentation/views/organization_sign_up_view.dart';
import 'package:smart_medi/features/organization_feature/patient_data_access/presentation/views/access_patient_data_page_view.dart';
import 'package:smart_medi/features/organization_feature/patient_data_access/presentation/views/organization_access_patient_data_view.dart';

abstract class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const LoginView(),
        redirect: (context, state) => AuthGuard.checkGuest(state),
      ),
      GoRoute(
        path: AppRoutes.loginView,
        builder: (context, state) => const LoginView(),
        redirect: (context, state) => AuthGuard.checkGuest(state),
      ),
      GoRoute(
        path: AppRoutes.signUpView,
        builder: (context, state) => const SignUpView(),
        redirect: (context, state) => AuthGuard.checkGuest(state),
      ),
      GoRoute(
        path: AppRoutes.otpVerificationView,
        redirect: (context, state) async {
          // First check authentication
          final authRedirect = await AuthGuard.checkGuest(state);
          if (authRedirect != null) return authRedirect;

          // Then validate parameters
          final extraData = state.extra as Map<String, dynamic>?;
          if (extraData == null ||
              !extraData.containsKey('isComingFromSignUp') ||
              !extraData.containsKey('email')) {
            return AppRoutes.loginView;
          }

          return null;
        },
        builder: (context, state) {
          // Safe to cast - redirect already validated
          final extraData = state.extra as Map<String, dynamic>;
          final bool isComingFromSignUp =
              extraData['isComingFromSignUp'] as bool;
          final String email = extraData['email'] as String;

          return OtpVerificationView(
            isComingFromSignUp: isComingFromSignUp,
            email: email,
          );
        },
      ),
      GoRoute(
        path: AppRoutes.forgetPasswordView,
        builder: (context, state) => const ForgetPasswordView(),
        redirect: (context, state) => AuthGuard.checkGuest(state),
      ),
      GoRoute(
        path: AppRoutes.resetPassView,
        redirect: (context, state) async {
          // First check authentication
          final authRedirect = await AuthGuard.checkGuest(state);
          if (authRedirect != null) return authRedirect;

          // Then validate parameters
          final extraData = state.extra as Map<String, dynamic>?;
          if (extraData == null ||
              !extraData.containsKey('email') ||
              !extraData.containsKey('code')) {
            return AppRoutes.loginView;
          }

          return null;
        },
        builder: (context, state) {
          // Safe to cast - redirect already validated
          final extraData = state.extra as Map<String, dynamic>;
          final String email = extraData['email'] as String;
          final String code = extraData['code'] as String;

          return ResetPasswordView(email: email, code: code);
        },
      ),
      GoRoute(
        path: AppRoutes.completeProfileView,
        builder: (context, state) => const CompleteProfileView(),
        redirect: (context, state) => AuthGuard.checkGuest(state),
      ),
      GoRoute(
        path: AppRoutes.homeView,
        builder: (context, state) => const HomeView(),
        redirect: (context, state) => AuthGuard.checkAuth(state),
      ),
      GoRoute(
        path: AppRoutes.medicalRecords,
        builder: (context, state) => const MedicalRecordsView(),
        redirect: (context, state) => AuthGuard.checkAuth(state),
      ),
      GoRoute(
        path: AppRoutes.recordDetailsView,

        redirect: (context, state) async {
          final authRedirect = await AuthGuard.checkAuth(state);
          if (authRedirect != null) return authRedirect;

          final extraData = state.extra as Map<String, dynamic>?;

          if (extraData == null ||
              extraData['patientId'] == null ||
              extraData['recordId'] == null ||
              extraData['patientId'].toString().trim().isEmpty ||
              extraData['recordId'].toString().trim().isEmpty) {
            return AppRoutes.medicalRecords;
          }

          return null;
        },

        builder: (context, state) {
          final extraData = state.extra as Map<String, dynamic>;

          return RecordDetailsView(
            patientId: extraData['patientId'] as String,
            recordId: extraData['recordId'] as String,
          );
        },
      ),
      GoRoute(
        path: AppRoutes.editRecordView,

        redirect: (context, state) async {
          final authRedirect = await AuthGuard.checkAuth(state);
          if (authRedirect != null) return authRedirect;

          final extraData = state.extra as Map<String, dynamic>?;

          final isEdit = extraData?['isEdit'] as bool?;

          // ❌ لازم isEdit يكون موجود
          if (isEdit == null) {
            return AppRoutes.medicalRecords;
          }

          // 🟢 ADD MODE → ادخل مباشرة بدون أي validation
          if (isEdit == false) {
            return null;
          }

          // 🔵 EDIT MODE → لازم recordId
          final recordId = extraData?['recordId'];

          if (recordId == null || recordId.toString().trim().isEmpty) {
            return AppRoutes.medicalRecords;
          }

          return null;
        },

        builder: (context, state) {
          final extraData = state.extra as Map<String, dynamic>? ?? {};

          final isEdit = extraData['isEdit'] as bool? ?? false;
          final recordId = extraData['recordId'] as String?;

          return EditRecordView(
            isEdit: isEdit,
            recordId: recordId, // 👈 مهم جدًا
          );
        },
      ),
      GoRoute(
        path: AppRoutes.medicationManagement,
        builder: (context, state) => const MedicationManagementView(),
        redirect: (context, state) => AuthGuard.checkAuth(state),
      ),
      GoRoute(
        path: AppRoutes.addMedication,
        builder: (context, state) => const AddMedicationView(),
        redirect: (context, state) => AuthGuard.checkAuth(state),
      ),
      GoRoute(
        path: AppRoutes.editMedication,
        redirect: (context, state) async {
          final authRedirect = await AuthGuard.checkAuth(state);
          if (authRedirect != null) return authRedirect;

          final extraData = state.extra as Map<String, dynamic>?;
          if (extraData == null) {
            return AppRoutes.medicationManagement;
          }

          final medicationId = extraData['medicationId'];
          if (medicationId is! String || medicationId.trim().isEmpty) {
            return AppRoutes.medicationManagement;
          }

          return null;
        },
        builder: (context, state) {
          final extraData = state.extra as Map<String, dynamic>;

          return EditMedicationView(
            medicationId: extraData['medicationId'] as String,
            medicationName: (extraData['medicationName'] as String?) ?? '',
            dosage: (extraData['dosage'] as String?) ?? '',
            frequency: (extraData['frequency'] as String?) ?? '',
            dosageRoute:
                ((extraData['dosageRoute'] ?? extraData['type']) as String?) ??
                '',
            startDate: (extraData['startDate'] as String?) ?? '',
            prescribingDoctor:
                ((extraData['prescribingDoctor'] ?? extraData['doctorName'])
                    as String?) ??
                '',
          );
        },
      ),
      GoRoute(
        path: AppRoutes.medicationSearch,
        builder: (context, state) {
          final extraData = state.extra as Map<String, dynamic>?;
          final medications = extraData?['medications'];

          return MedicationSearchView(
            medications: medications is List<MedicationModel>
                ? medications
                : const <MedicationModel>[],
          );
        },
        redirect: (context, state) => AuthGuard.checkAuth(state),
      ),
      GoRoute(
        path: AppRoutes.medicalJournal,
        builder: (context, state) => const MedicalJournalView(),
        redirect: (context, state) => AuthGuard.checkAuth(state),
      ),
      GoRoute(
        path: AppRoutes.journalElementDetails,
        builder: (context, state) {
          final journalEntry = state.extra as JournalListItem;
          return JournalElementDetailsView(journalEntry: journalEntry);
        },
        redirect: (context, state) => AuthGuard.checkAuth(state),
      ),
      GoRoute(
        path: AppRoutes.addJournalEntry,
        builder: (context, state) => const AddJournalEntryView(),
        redirect: (context, state) => AuthGuard.checkAuth(state),
      ),
      GoRoute(
        path: AppRoutes.editJournalEntry,
        redirect: (context, state) async {
          final authRedirect = await AuthGuard.checkAuth(state);
          if (authRedirect != null) return authRedirect;

          final entry = state.extra;
          if (entry is! JournalListItem || entry.id.trim().isEmpty) {
            return AppRoutes.medicalJournal;
          }

          return null;
        },
        builder: (context, state) {
          final entry = state.extra as JournalListItem;

          return EditJournalEntryView(
            journalId: entry.id,
            title: entry.title,
            content: entry.excerpt,
            entryDate: entry.entryDate,
            moodLevel: entry.moodLevel,
            painLevel: entry.painLevel,
            tags: entry.tags,
            symptoms: entry.symptoms,
          );
        },
      ),
      GoRoute(
        path: AppRoutes.notificationsView,
        builder: (context, state) => const NotificationsView(),
        redirect: (context, state) => AuthGuard.checkAuth(state),
      ),
      GoRoute(
        path: AppRoutes.dataSharingView,
        builder: (context, state) => const DataSharingView(),
        redirect: (context, state) => AuthGuard.checkAuth(state),
      ),
      GoRoute(
        path: AppRoutes.shareRecordsView,
        builder: (context, state) => const ShareRecordsView(),
        redirect: (context, state) => AuthGuard.checkAuth(state),
      ),
      GoRoute(
        path: AppRoutes.codeGeneratedView,
        redirect: (context, state) async {
          final authRedirect = await AuthGuard.checkAuth(state);
          if (authRedirect != null) return authRedirect;

          final extraData = state.extra as Map<String, dynamic>?;

          if (extraData == null || extraData['sharedRecord'] == null) {
            return AppRoutes.shareRecordsView;
          }

          if (extraData['sharedRecord'] is! SharedRecordModel) {
            return AppRoutes.shareRecordsView;
          }

          return null;
        },
        builder: (context, state) {
          final extraData = state.extra as Map<String, dynamic>;

          return CodeGeneratedView(
            sharedRecord: extraData['sharedRecord'] as SharedRecordModel,
          );
        },
      ),

      GoRoute(
        path: AppRoutes.appointmentsView,
        builder: (context, state) => const AppointmentView(),
        redirect: (context, state) => AuthGuard.checkAuth(state),
      ),
      GoRoute(
        path: AppRoutes.bookAppointmentsView,
        redirect: (context, state) async {
          final authRedirect = await AuthGuard.checkAuth(state);
          if (authRedirect != null) return authRedirect;

          final extraData = state.extra as Map<String, dynamic>?;

          if (extraData == null ||
              extraData['organization'] == null ||
              extraData['organization'].toString().trim().isEmpty) {
            return AppRoutes.appointmentsView;
          }

          return null;
        },
        builder: (context, state) {
          final extraData = state.extra as Map<String, dynamic>;
          final organization =
              extraData['organization'] as GetOrganizationsResponse;

          return BookAppointmentsView(organization: organization);
        },
      ),
      GoRoute(
        path: AppRoutes.appointmentsCancelView,

        redirect: (context, state) async {
          final authRedirect = await AuthGuard.checkAuth(state);
          if (authRedirect != null) return authRedirect;

          final extraData = state.extra as Map<String, dynamic>?;

          if (extraData == null || !extraData.containsKey('appointment')) {
            return AppRoutes.appointmentsView;
          }

          return null;
        },

        builder: (context, state) {
          final extraData = state.extra as Map<String, dynamic>;

          return AppointmentsCancelView(
            appointment: extraData['appointment'] as AppointmentItemModel,
          );
        },
      ),
      GoRoute(
        path: AppRoutes.appointmentsRescheduleView,
        builder: (context, state) => const AppointmentsRescheduleView(),
        redirect: (context, state) => AuthGuard.checkAuth(state),
      ),
      GoRoute(
        path: AppRoutes.appointmentsDetailsView,

        redirect: (context, state) async {
          final authRedirect = await AuthGuard.checkAuth(state);
          if (authRedirect != null) return authRedirect;

          final extraData = state.extra as Map<String, dynamic>?;

          if (extraData == null ||
              extraData['appointmentId'] == null ||
              extraData['appointmentId'].toString().trim().isEmpty) {
            return AppRoutes.appointmentsView;
          }

          return null;
        },

        builder: (context, state) {
          final extraData = state.extra as Map<String, dynamic>;
          final appointmentId = extraData['appointmentId'] as String;

          return AppointmentsDetailsView(appointmentId: appointmentId);
        },
      ),
      GoRoute(
        path: AppRoutes.appointmentsConfirmedView,
        redirect: (context, state) async {
          final authRedirect = await AuthGuard.checkAuth(state);
          if (authRedirect != null) return authRedirect;

          final extraData = state.extra as Map<String, dynamic>?;

          if (extraData == null ||
              !extraData.containsKey('postAppointmentResponse') ||
              !extraData.containsKey('address')) {
            return AppRoutes.appointmentsView;
          }

          return null;
        },
        builder: (context, state) {
          final extraData = state.extra as Map<String, dynamic>;

          return AppointmentsConfirmedView(
            postAppointmentResponse:
                extraData['postAppointmentResponse'] as PostAppointmentResponse,
            address: extraData['address'] as String,
          );
        },
      ),
      GoRoute(
        path: AppRoutes.availableAppointmentView,
        builder: (context, state) => const AvailableAppointmentView(),
        redirect: (context, state) => AuthGuard.checkAuth(state),
      ),
      GoRoute(
        path: AppRoutes.availableAppointmentDetailView,
        redirect: (context, state) async {
          final authRedirect = await AuthGuard.checkAuth(state);
          if (authRedirect != null) return authRedirect;

          final extraData = state.extra as Map<String, dynamic>?;

          if (extraData == null || !extraData.containsKey('organization')) {
            return AppRoutes.availableAppointmentView;
          }

          if (extraData['organization'] == null ||
              extraData['organization'] is! GetOrganizationsResponse) {
            return AppRoutes.availableAppointmentView;
          }

          final organization =
              extraData['organization'] as GetOrganizationsResponse;
          final organizationId = organization.id;

          if (organizationId.trim().isEmpty) {
            return AppRoutes.availableAppointmentView;
          }

          return null;
        },

        builder: (context, state) {
          final extraData = state.extra as Map<String, dynamic>?;
          final organization =
              extraData!['organization'] as GetOrganizationsResponse;
          final organizationId = organization.id;
          return AvailableAppointmentDetailView(
            organizationId: organizationId,
            organization: organization,
          );
        },
      ),
      GoRoute(
        path: AppRoutes.completeBookingView,
        redirect: (context, state) async {
          final authRedirect = await AuthGuard.checkAuth(state);
          if (authRedirect != null) return authRedirect;

          final extraData = state.extra as Map<String, dynamic>?;
          if (extraData == null ||
              !extraData.containsKey('date') ||
              !extraData.containsKey('time') ||
              !extraData.containsKey('organization')) {
            return AppRoutes.bookAppointmentsView;
          }

          return null;
        },
        builder: (context, state) {
          final extraData = state.extra as Map<String, dynamic>;
          final DateTime selectedDate = extraData['date'] as DateTime;
          final String selectedTime = extraData['time'] as String;
          final GetOrganizationsResponse organization =
              extraData['organization'] as GetOrganizationsResponse;

          return CompleteBookingView(
            selectedDate: selectedDate,
            selectedTime: selectedTime,
            organization: organization,
          );
        },
      ),
      // GoRoute(
      //   path: AppRoutes.completeBookingView,
      //   builder: (context, state) => const CompleteBookingView(),
      //   redirect: (context, state) => AuthGuard.checkAuth(state),
      // ),
      GoRoute(
        path: AppRoutes.organizationDashboardView,
        builder: (context, state) => const OrganizationDashboardView(),
        redirect: (context, state) => AuthGuard.checkAuth(state),
      ),
      GoRoute(
        path: AppRoutes.organizationAccessPatientDataView,
        builder: (context, state) => const OrganizationAccessPatientDataView(),
        redirect: (context, state) => AuthGuard.checkAuth(state),
      ),
      GoRoute(
        path: AppRoutes.accessPatientDataView,
        builder: (context, state) => const AccessPatientDataView(),
        redirect: (context, state) => AuthGuard.checkAuth(state),
      ),
      GoRoute(
        path: AppRoutes.organizationAvailabilityCalenderView,
        builder: (context, state) => const AvailabilityCalenderView(),
        redirect: (context, state) => AuthGuard.checkAuth(state),
      ),
      GoRoute(
        path: AppRoutes.appointmentRequestsView,
        builder: (context, state) => const AppointmentRequestsView(),
        redirect: (context, state) => AuthGuard.checkAuth(state),
      ),
      GoRoute(
        path: AppRoutes.appointmentDetailsScreen,
        builder: (context, state) => const AppointmentDetailsScreen(),
        redirect: (context, state) => AuthGuard.checkAuth(state),
      ),
      GoRoute(
        path: AppRoutes.aiAssistantView,
        builder: (context, state) => const AiAssistantView(),
        redirect: (context, state) => AuthGuard.checkAuth(state),
      ),
      GoRoute(path: AppRoutes.organizationSignUpView,
      builder: (context, state) => const OrganizationSignUpView()),

      // GoRoute(
      //     path: AppRoutes.onboardingView,
      //     builder: (context, state) => const OnboardingView()),
      // GoRoute(path: kHomeView, builder: (context, state) {
      //   final extraDate = state.extra as Map<String,dynamic>;
      //   final userId = extraDate['userId'] as int;
      //   final userName = extraDate['userName'] as String;
      //   return NavigationView(userId: userId, userName: userName,);
      // }),
    ],
  );
}
