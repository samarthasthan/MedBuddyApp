import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medbuddyapp/views/mainmenu.dart';

void main() {
  runApp(const MedBuddy());
}

class MedBuddy extends StatelessWidget {
  const MedBuddy({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: MainMenu(),
        );
      },
    );
  }
}
