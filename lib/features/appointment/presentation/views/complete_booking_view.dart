import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_medi/core/routing/app_routes.dart';
import 'package:smart_medi/features/appointment/presentation/views/widgets/complete_booking_widgets/booking_summary_card.dart';
import 'package:smart_medi/features/appointment/presentation/views/widgets/complete_booking_widgets/confirm_booking_button.dart';
import 'package:smart_medi/features/appointment/presentation/views/widgets/complete_booking_widgets/consent_checkboxes.dart';
import 'package:smart_medi/features/appointment/presentation/views/widgets/complete_booking_widgets/hospital_header_card.dart';
import 'package:smart_medi/features/appointment/presentation/views/widgets/complete_booking_widgets/patient_info_card.dart';
import 'package:smart_medi/features/appointment/presentation/views/widgets/complete_booking_widgets/reason_for_visit_field.dart';
import 'package:smart_medi/features/appointment/presentation/views/widgets/complete_booking_widgets/visit_type_selector.dart';

class CompleteBookingView extends StatefulWidget {
  const CompleteBookingView({
    super.key,
    required this.selectedDate,
    required this.selectedTime,
    required this.organizationId,
  });

  final DateTime selectedDate;
  final String selectedTime;
  final String organizationId;

  @override
  State<CompleteBookingView> createState() => _BookAppointmentScreenState();
}

class _BookAppointmentScreenState extends State<CompleteBookingView> {
  // ── State Variables ─────────────────────────────────────
  String? _selectedVisitType;
  bool _shareMedicalRecords = false;
  bool _agreeCancellationPolicy = false;
  final TextEditingController _reasonController = TextEditingController();

  // ── Passed Data ──────────────────────────────────────────
  late String _formattedDate;
  late String _formattedTime;

  // ── Static Demo Data ────────────────────────────────────
  final String _hospitalName = 'City Medical Center';
  final String _hospitalType = 'Hospital';
  final String _address = '123 Medical Plaza, Downtown';
  final String _patientName = 'Alex Johnson (from profile)';

  // ── Derived State ────────────────────────────────────────
  bool get _isFormValid =>
     _selectedVisitType != null &&
         _reasonController.text.trim().isNotEmpty &&
         _agreeCancellationPolicy;

  @override
  void initState() {
    super.initState();
    _reasonController.addListener(() => setState(() {}));

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
    // ScaffoldMessenger.of(context).showSnackBar(
    //   SnackBar(
    //     content: const Text('Booking confirmed successfully! ✅'),
    //     backgroundColor: const Color(0xFF4A90D9),
    //     behavior: SnackBarBehavior.floating,
    //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    //     margin: const EdgeInsets.all(16),
    //   ),
    // );
  }

  // ── Build ────────────────────────────────────────────────
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F4F8),
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── 1. Hospital Header Card ─────────────────────
            HospitalHeaderCard(
              hospitalName: _hospitalName,
              hospitalType: _hospitalType,
              address: _address,
            ),

            const SizedBox(height: 16),

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
              organization: _hospitalName,
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
      ),
    );
  }

  // ── AppBar ────────────────────────────────────────────────
  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0.5,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Color(0xFF1A1A2E)),
        onPressed: () => Navigator.of(context).maybePop(),
      ),
      title: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Book Appointment',
            style: TextStyle(
              color: Color(0xFF1A1A2E),
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Complete your booking',
            style: TextStyle(
              color: Color(0xFF888888),
              fontSize: 12,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
