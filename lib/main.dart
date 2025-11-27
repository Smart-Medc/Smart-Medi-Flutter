import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const SmartMedi());
}

class SmartMedi extends StatelessWidget {
  const SmartMedi({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      ensureScreenSize: true,
      builder: (_, child) {
        return MaterialApp.router(
          // routerConfig: AppRouter.router,
          debugShowCheckedModeBanner: false,
          color: Colors.white,
          theme: ThemeData(
            // textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme),
            scaffoldBackgroundColor: Colors.white,
          ),
        );
      },
    );
  }
}