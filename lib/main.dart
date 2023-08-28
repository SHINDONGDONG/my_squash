import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:my_squash/screens/navigation.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(430,932),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.light,
          // textTheme: GoogleFonts.nunitoTextTheme(),
          useMaterial3: true,
            primaryColor: Colors.white,
            primaryColorBrightness: Brightness.light,
            primaryColorDark: Colors.black,
            canvasColor: Colors.white,
            // next line is important!
        ),
        darkTheme: ThemeData(
          useMaterial3: true,
          brightness: Brightness.dark,
          // textTheme: GoogleFonts.nunitoTextTheme(),
            primaryColor: Colors.black,
            primaryColorBrightness: Brightness.dark,
            primaryColorLight: Colors.black,
            primaryColorDark: Colors.black,
            indicatorColor: Colors.white,
            canvasColor: Colors.black,
            appBarTheme: AppBarTheme(
              systemOverlayStyle: SystemUiOverlayStyle.light,
            )
            // next line is important!
        ),
        themeMode: ThemeMode.system,
        home: const Navigation(),
      ),
    );
  }
}
