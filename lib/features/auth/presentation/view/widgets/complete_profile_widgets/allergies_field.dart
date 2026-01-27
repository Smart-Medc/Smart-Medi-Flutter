import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'package:smart_medi/core/utils/app_styles.dart';
import 'package:smart_medi/features/auth/presentation/view/widgets/auth_field_title.dart';

class AllergiesField extends StatefulWidget {
  const AllergiesField({
    super.key,
    required this.allergiesController,
    this.onNoAllergiesChanged,
  });

  final TextEditingController allergiesController;
  final Function(bool)? onNoAllergiesChanged;

  @override
  State<AllergiesField> createState() => _AllergiesFieldState();
}

class _AllergiesFieldState extends State<AllergiesField> {
  bool _noKnownAllergies = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        authFieldTitle('Allergies'),
        4.verticalSpace,
        TextFormField(
          controller: widget.allergiesController,
          enabled: !_noKnownAllergies,
          maxLines: 5,
          style: AppStyles.textStyle14W400Black,
          decoration: InputDecoration(
            hintText: 'List any known allergies (medications, food, environmental)',
            hintStyle: AppStyles.textStyle14W400formFieldHintColor,
            filled: true,
            fillColor: _noKnownAllergies
                ? AppColors.secondBackgroundColor.withValues(alpha: 0.5)
                : AppColors.secondBackgroundColor,  // todo change when the design system is ready

            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: const BorderSide(
                color: Colors.red ,// todo change when the design system is ready
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: const BorderSide(
                color: AppColors.primaryLightColor,
                width: 1,
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: const BorderSide(
                color: Colors.red ,// todo change when the design system is ready
                width: 1,
              ),
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 12.h,
            ),
          ),
        ),
        12.verticalSpace,
        GestureDetector(
          onTap: () {
            setState(() {
              _noKnownAllergies = !_noKnownAllergies;
              if (_noKnownAllergies) {
                widget.allergiesController.clear();
              }
            });
            widget.onNoAllergiesChanged?.call(_noKnownAllergies);
          },
          child: Row(
            children: [
              Container(
                width: 24.w,
                height: 24.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: _noKnownAllergies
                        ? AppColors.primaryLightColor
                        : Colors.red, // todo change when the design system is ready
                    width: 2,
                  ),
                ),
                child: _noKnownAllergies
                    ? Center(
                        child: Container(
                          width: 12.w,
                          height: 12.h,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.primaryLightColor,
                          ),
                        ),
                      )
                    : null,
              ),
              SizedBox(width: 8.w),
              Text(
                'No Known Allergies',
                style: AppStyles.textStyle16W400Black,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
