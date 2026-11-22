import 'package:flutter/material.dart';
import 'package:smart_medi/features/auth/presentation/view/widgets/complete_profile_widgets/complete_profile_body.dart';
class CompleteProfileView extends StatelessWidget {
  const CompleteProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(child: Scaffold(body: CompleteProfileBody(),));
  }
}
