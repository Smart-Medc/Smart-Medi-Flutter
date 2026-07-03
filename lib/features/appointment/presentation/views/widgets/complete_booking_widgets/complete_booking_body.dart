import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_medi/core/helpers/secure_storage_helper.dart';
import 'package:smart_medi/core/routing/app_routes.dart';
import 'package:smart_medi/features/appointment/data/models/get_organizations_models/get_organizations_response.dart';
import 'package:smart_medi/features/appointment/presentation/views/widgets/complete_booking_widgets/booking_summary_card.dart';
import 'package:smart_medi/features/appointment/presentation/views/widgets/complete_booking_widgets/confirm_booking_button.dart';
import 'package:smart_medi/features/appointment/presentation/views/widgets/complete_booking_widgets/consent_checkboxes.dart';
import 'package:smart_medi/features/appointment/presentation/views/widgets/complete_booking_widgets/hospital_header_card.dart';
import 'package:smart_medi/features/appointment/presentation/views/widgets/complete_booking_widgets/patient_info_card.dart';
import 'package:smart_medi/features/appointment/presentation/views/widgets/complete_booking_widgets/reason_for_visit_field.dart';
import 'package:smart_medi/features/appointment/presentation/views/widgets/complete_booking_widgets/visit_type_selector.dart';

class CompleteBookingBody extends StatefulWidget {
  const CompleteBookingBody({
    super.key,
    required this.selectedDate,
    required this.selectedTime,
    required this.organization,
  });

  final DateTime selectedDate;
  final String selectedTime;
  final GetOrganizationsResponse organization;

  @override
  State<CompleteBookingBody> createState() => _CompleteBookingBodyState();
}

class _CompleteBookingBodyState extends State<CompleteBookingBody> {
  // ── State Variables ─────────────────────────────────────
  String? _selectedVisitType;
  bool _shareMedicalRecords = false;
  bool _agreeCancellationPolicy = false;
  final TextEditingController _reasonController = TextEditingController();

  // ── Passed Data ──────────────────────────────────────────
  late String _formattedDate;
  late String _formattedTime;

  String _patientName = 'Alex Johnson (from profile)';

  // ── Derived State ────────────────────────────────────────
  bool get _isFormValid =>
      _selectedVisitType != null &&
          _reasonController.text.trim().isNotEmpty &&
          _agreeCancellationPolicy;
  Future<void> getPatientName() async {
    final String? patientName =  await SecureStorageHelper.getUserName();
    _patientName = patientName ?? '--';
    setState(() {

    });
  }
  @override
  void initState() {
    super.initState();
    _reasonController.addListener(() => setState(() {}));
    getPatientName();

    // Format the passed date and time
    _formattedDate = '${widget.selectedDate.day}/${widget.selectedDate.month}/${widget.selectedDate.year}';
    _formattedTime = widget.selectedTime;

  }

  @override
  void dispose() {
    _reasonController.dispose();
    super.dispose();
  }

  // ── Confirm Action ───────────────────────────────────────
  void _onConfirmBooking() {
    context.push(AppRoutes.appointmentsConfirmedView);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── 1. Hospital Header Card ─────────────────────
          HospitalHeaderCard(
            hospitalName: widget.organization.name,
            hospitalType: widget.organization.type,
            address: widget.organization.address,
          ),

          16.verticalSpace,

          // ── 2. Patient Info (Appointment Details) Card ──
          PatientInfoCard(
            patientName: _patientName,
            appointmentDate: _formattedDate,
            appointmentTime: _formattedTime,
          ),

          const SizedBox(height: 16),

          // ── 3. Visit Type Dropdown ──────────────────────
          VisitTypeSelector(
            selectedVisitType: _selectedVisitType,
            onChanged: (value) => setState(() => _selectedVisitType = value),
          ),

          const SizedBox(height: 16),

          // ── 4. Reason for Visit Text Field ──────────────
          ReasonForVisitField(controller: _reasonController),

          const SizedBox(height: 16),

          // ── 5. Consent Checkboxes ───────────────────────
          ConsentCheckboxes(
            shareMedicalRecords: _shareMedicalRecords,
            agreeCancellationPolicy: _agreeCancellationPolicy,
            onShareMedicalRecordsChanged: (val) =>
                setState(() => _shareMedicalRecords = val ?? false),
            onAgreeCancellationPolicyChanged: (val) =>
                setState(() => _agreeCancellationPolicy = val ?? false),
          ),

          const SizedBox(height: 16),

          // ── 6. Booking Summary Card ─────────────────────
          BookingSummaryCard(
            organization: widget.organization.name,
            date: _formattedDate,
            time: _formattedTime,
            visitType: _selectedVisitType ?? '—',
            shareRecords: _shareMedicalRecords,
          ),

          const SizedBox(height: 24),

          // ── 7. Confirm Booking Button ───────────────────
          ConfirmBookingButton(
            isEnabled: _isFormValid,
            onPressed: _onConfirmBooking,
          ),

          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
