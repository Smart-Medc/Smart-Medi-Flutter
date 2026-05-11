import 'package:flutter/material.dart';


class AppointmentsConfirmedView extends StatelessWidget {
  const AppointmentsConfirmedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5F5F5),
        elevation: 0,
        title: const Text(
          'Patient Appointment Confirmed',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        leading: const BackButton(color: Colors.black87),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: const [
            SizedBox(height: 12),
            _SuccessIconWidget(),
            SizedBox(height: 16),
            _ConfirmedTitleWidget(),
            SizedBox(height: 20),
            _AppointmentDetailsCard(),
            SizedBox(height: 12),
            _ConfirmationSentCard(),
            SizedBox(height: 24),
            _ActionButtons(),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────
// 1. SUCCESS ICON WIDGET
// ─────────────────────────────────────────────
class _SuccessIconWidget extends StatelessWidget {
  const _SuccessIconWidget();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 72,
      height: 72,
      decoration: BoxDecoration(
        color: const Color(0xFFE8F5E9),
        shape: BoxShape.circle,
      ),
      child: const Icon(
        Icons.check_circle_outline_rounded,
        color: Color(0xFF4CAF50),
        size: 44,
      ),
    );
  }
}

// ─────────────────────────────────────────────
// 2. CONFIRMED TITLE WIDGET
// ─────────────────────────────────────────────
class _ConfirmedTitleWidget extends StatelessWidget {
  const _ConfirmedTitleWidget();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Text(
          'Appointment Confirmed!',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        SizedBox(height: 6),
        Text(
          'Your appointment has been successfully booked.\nCheck your email and SMS for confirmation.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 13,
            color: Colors.black54,
            height: 1.5,
          ),
        ),
      ],
    );
  }
}

// ─────────────────────────────────────────────
// 3. APPOINTMENT DETAILS CARD
// ─────────────────────────────────────────────
class _AppointmentDetailsCard extends StatelessWidget {
  const _AppointmentDetailsCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Hospital Header
          const _HospitalHeaderWidget(),
          const Divider(height: 24, thickness: 1, color: Color(0xFFEEEEEE)),
          // Detail Rows
          _DetailRow(
            icon: Icons.calendar_today_outlined,
            label: 'DATE',
            value: 'March 25, 2024',
          ),
          const SizedBox(height: 14),
          _DetailRow(
            icon: Icons.access_time_outlined,
            label: 'Time & Duration',
            value: '10:00 AM (30 minutes)',
          ),
          const SizedBox(height: 14),
          _DetailRow(
            icon: Icons.location_on_outlined,
            label: 'Location',
            value: '123 Medical Plaza, Downtown, City 12345',
          ),
          const SizedBox(height: 16),
          // Appointment ID
          const _AppointmentIdWidget(),
        ],
      ),
    );
  }
}

// ─── Hospital Header ───────────────────────
class _HospitalHeaderWidget extends StatelessWidget {
  const _HospitalHeaderWidget();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: const Color(0xFFE3F2FD),
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Icon(
            Icons.local_hospital_outlined,
            color: Color(0xFF1976D2),
            size: 22,
          ),
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'City Medical Center',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 2),
            Text(
              'First Visit',
              style: TextStyle(
                fontSize: 12,
                color: Colors.black45,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

// ─── Detail Row ────────────────────────────
class _DetailRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _DetailRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 18, color: const Color(0xFF1976D2)),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: Colors.black45,
                  letterSpacing: 0.5,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// ─── Appointment ID ────────────────────────
class _AppointmentIdWidget extends StatelessWidget {
  const _AppointmentIdWidget();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          'Appointment ID:',
          style: TextStyle(
            fontSize: 12,
            color: Colors.black45,
          ),
        ),
        const SizedBox(width: 6),
        Text(
          'APT-2024-001',
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: Color(0xFF1976D2),
          ),
        ),
      ],
    );
  }
}

// ─────────────────────────────────────────────
// 4. CONFIRMATION SENT CARD
// ─────────────────────────────────────────────
class _ConfirmationSentCard extends StatelessWidget {
  const _ConfirmationSentCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF3F3),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFFFCDD2), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Confirmation Sent',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 10),
          _ConfirmationRow(
            icon: Icons.email_outlined,
            text: 'Email confirmation sent to alex@email.com',
          ),
          const SizedBox(height: 8),
          _ConfirmationRow(
            icon: Icons.sms_outlined,
            text: 'SMS confirmation sent to alex@email.com',
          ),
        ],
      ),
    );
  }
}

// ─── Confirmation Row ──────────────────────
class _ConfirmationRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const _ConfirmationRow({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 16, color: Colors.black45),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.black54,
            ),
          ),
        ),
      ],
    );
  }
}

// ─────────────────────────────────────────────
// 5. ACTION BUTTONS WIDGET
// ─────────────────────────────────────────────
class _ActionButtons extends StatelessWidget {
  const _ActionButtons();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // View Appointment Details Button
        SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF1976D2),
              foregroundColor: Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text(
              'View Appointment Details',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        // Cancel Button
        SizedBox(
          width: double.infinity,
          height: 50,
          child: TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              foregroundColor: Colors.black54,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text(
              'Cancel',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ],
    );
  }
}