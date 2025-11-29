import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/routing/app_router.dart';

void main() {
  runApp(const SmartMedi());
}

class SmartMedi extends StatelessWidget {
  const SmartMedi({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(440, 956),
      minTextAdapt: true,
      splitScreenMode: true,
      ensureScreenSize: true,
      builder: (_, child) {
        return MaterialApp.router(
          routerConfig: AppRouter.router,
          debugShowCheckedModeBanner: false,
          color: const Color(0xffF4F4F4),
          theme: ThemeData(
            // textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme),
            scaffoldBackgroundColor: const Color(0xffF4F4F4),
          ),
        );
      },
    );
  }
}