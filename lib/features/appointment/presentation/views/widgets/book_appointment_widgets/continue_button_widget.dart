import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_medi/core/routing/app_routes.dart';
import 'package:smart_medi/core/utils/app_colors.dart';

class ContinueButtonWidget extends StatelessWidget {
  final String? selectedTime;
  final VoidCallback? onPressed;

  const ContinueButtonWidget({
    super.key,
    required this.selectedTime,
    this.onPressed,
  });

  bool get _isEnabled => selectedTime != null && selectedTime!.isNotEmpty;

  @override
  Widget build(BuildContext context) {
    final VoidCallback? effectiveOnPressed = _isEnabled
        ? onPressed ?? () => context.push(AppRoutes.completeBookingView)
        : null;

    return SizedBox(
      width: double.infinity,
      height: 54,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        child: ElevatedButton(
          onPressed: effectiveOnPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: _isEnabled
                ? AppColors.primaryColor
                : AppColors.primaryLightColor,
            disabledBackgroundColor: AppColors.primaryLightColor,
            foregroundColor: AppColors.white,
            disabledForegroundColor: AppColors.white.withValues(alpha: 0.8),
            elevation: _isEnabled ? 3 : 0,
            shadowColor: AppColors.grey.withValues(alpha: 0.4),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
          ),
          child: const Text(
            'Continue To Details',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.3,
            ),
          ),
        ),
      ),
    );
  }
}
