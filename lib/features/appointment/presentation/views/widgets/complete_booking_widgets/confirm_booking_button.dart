import 'package:flutter/material.dart';

/// ========================================================
/// ConfirmBookingButton
/// The main CTA button at the bottom of the screen.
/// Disabled state is shown when conditions are not met.
/// ========================================================
class ConfirmBookingButton extends StatelessWidget {
  final bool isEnabled;
  final VoidCallback? onPressed;

  const ConfirmBookingButton({
    super.key,
    required this.isEnabled,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: ElevatedButton(
        onPressed: isEnabled ? onPressed : null,
        style: ElevatedButton.styleFrom(
          backgroundColor:
              isEnabled ? const Color(0xFF4A90D9) : const Color(0xFFB8D4F0),
          disabledBackgroundColor: const Color(0xFFB8D4F0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: isEnabled ? 2 : 0,
        ),
        child: const Text(
          'Confirm Booking',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
