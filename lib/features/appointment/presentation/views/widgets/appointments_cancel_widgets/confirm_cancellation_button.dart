import 'package:flutter/material.dart';
class ConfirmCancellationButton extends StatelessWidget {
  const ConfirmCancellationButton({
    super.key,
    required this.isEnabled,
    required this.isLoading,
    this.onPressed,
  });

  final bool isEnabled;
  final bool isLoading;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: ElevatedButton(
        onPressed:
        (isEnabled && !isLoading)
            ? onPressed
            : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFEF4444),
          disabledBackgroundColor: const Color(0xFFFCA5A5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(
            vertical: 15,
          ),
          elevation: 0,
        ),
        child: isLoading
            ? const SizedBox(
          height: 22,
          width: 22,
          child: CircularProgressIndicator(
            strokeWidth: 2,
            color: Colors.white,
          ),
        )
            : const Text(
          'Confirm Cancellation',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
