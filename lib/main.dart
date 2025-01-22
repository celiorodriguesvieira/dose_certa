import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'pages/homePage.dart';
import 'constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          title: 'DoseCerta',
          //theme
          theme: ThemeData.dark().copyWith(
              primaryColor: kPrimaryColor,
              scaffoldBackgroundColor: kScaffoldColor,
              appBarTheme: const AppBarTheme(
                backgroundColor: kScaffoldColor,
                elevation: 0,
              ),
              textTheme: TextTheme(
                  headlineMedium: TextStyle(
                      fontSize: 28.sp,
                      color: kSecondaryColor,
                      fontWeight: FontWeight.w500),
                  headlineSmall: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w600,
                    color: kTextColor,
                  ),
                  bodySmall: GoogleFonts.poppins(
                    fontSize: 12.sp,
                    color: kSubtitles,
                  ))),

          home: const HomePage(),
        );
      },
    );
  }
}
