import 'package:flutter/material.dart';
import 'package:smart_medi/features/home/presentation/views/widgets/app_drawer.dart';
import 'package:smart_medi/features/home/presentation/views/widgets/home_body.dart';
class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: HomeBody(),
        drawer: AppDrawer(),
      ),
    );
  }
}
