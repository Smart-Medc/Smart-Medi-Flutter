import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/utils/app_styles.dart';
import 'package:smart_medi/core/widgets/custom_button.dart';
import 'package:smart_medi/features/auth/data/models/verify_email/verify_email_request.dart';
import 'package:smart_medi/features/auth/data/models/verify_reset_code/verify_reset_code_request.dart';
import 'package:smart_medi/features/auth/presentation/manager/verify_email_cubit/verify_email_cubit.dart';
import 'package:smart_medi/features/auth/presentation/manager/verify_reset_code_cubit/verify_reset_code_cubit.dart';

class OtpFields extends StatefulWidget {
  const OtpFields({super.key,required this.isComingFromSignUp, required this.email});
  final bool isComingFromSignUp;
  final String email;
  @override
  State<OtpFields> createState() => _OtpFieldsState();
}

class _OtpFieldsState extends State<OtpFields> {
  final List<TextEditingController> _controllers = List.generate(
    6,
    (index) => TextEditingController(),
  );
  final List<FocusNode> _focusNodes = List.generate(
    6,
    (index) => FocusNode(),
  );
  String? _errorMessage;

  @override
  void dispose() {
    for (final controller in _controllers) {
      controller.dispose();
    }
    for (final node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  bool _validateOtp() {
    final otp = _controllers.map((c) => c.text.trim()).join();

    if (otp.length < 6) {
      setState(() {
        _errorMessage = 'Please enter all 6 digits';
      });
      return false;
    }

    if (!RegExp(r'^\d{6}$').hasMatch(otp)) {
      setState(() {
        _errorMessage = 'OTP must contain only numbers';
      });
      return false;
    }

    setState(() {
      _errorMessage = null;
    });
    return true;
  }

  void _clearError() {
    if (_errorMessage != null) {
      setState(() {
        _errorMessage = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(6, (index) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 8.w),
              width: 48.w,
              height: 56.h,
              child: TextField(
                controller: _controllers[index],
                focusNode: _focusNodes[index],
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                maxLength: 1,
                style: AppStyles.textStyle24W700Black,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                decoration:  InputDecoration(
                  counterText: '',
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: _errorMessage != null
                        ? Colors.red
                        : _controllers[index].text.trim().isNotEmpty
                          ? const Color(0xff2743FD)
                          : const Color(0xffB9B9B9),
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: _errorMessage != null ? Colors.red : const Color(0xff2743FD),
                      width: 1.5,
                    ),
                  ),
                  contentPadding: EdgeInsets.zero,
                ),
                onChanged: (value) {
                  _clearError();
                  setState(() {});

                  if (value.isNotEmpty && index < 5) {
                    _focusNodes[index + 1].requestFocus();
                  } else if (value.isEmpty && index > 0) {
                    _focusNodes[index - 1].requestFocus();
                  }
                },
              ),
            );
          }),
        ),
        if (_errorMessage != null) ...[
          16.verticalSpace,
          Text(
            _errorMessage!,
            style: TextStyle(
              color: Colors.red,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
        59.verticalSpace,
        CustomButton(
          text: 'Verify',
          onPressed: () {
            if (_validateOtp()) {
              final String otp = _controllers.map((c) => c.text).join();

              if (widget.isComingFromSignUp) {
                // Email verification flow (after sign up)
                context.read<VerifyEmailCubit>().verifyEmail(
                  verifyEmailRequest: VerifyEmailRequest(
                    email: widget.email,
                    code: otp,
                  ),
                );
              } else {
                // Password reset verification flow (after forgot password)
                context.read<VerifyResetCodeCubit>().verifyResetCode(
                  verifyCodeResetRequest: VerifyResetCodeRequest(
                    email: widget.email,
                    code: otp,
                  ),
                );
              }
            }
          },
        ),
      ],
    );
  }
}
