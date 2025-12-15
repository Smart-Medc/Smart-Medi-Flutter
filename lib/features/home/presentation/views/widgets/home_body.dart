import 'package:flutter/material.dart';
import 'package:smart_medi/features/home/presentation/views/widgets/home_app_bar.dart';
class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HomeAppBar(),
      ],
    );
  }
}
