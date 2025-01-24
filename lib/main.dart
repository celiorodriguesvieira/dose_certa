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
            appBarTheme: AppBarTheme(
                toolbarHeight: 7.h,
                backgroundColor: kScaffoldColor,
                elevation: 0,
                iconTheme: IconThemeData(
                  color: kSecondaryColor,
                  size: 20,
                ),
                titleTextStyle: GoogleFonts.mulish(
                    color: kTextColor,
                    fontWeight: FontWeight.w800,
                    fontStyle: FontStyle.normal,
                    fontSize: 16.sp)),
            textTheme: TextTheme(
              headlineLarge: TextStyle(
                  fontSize: 28.sp,
                  color: kSecondaryColor,
                  fontWeight: FontWeight.w500),
              headlineMedium: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.w600,
                color: kTextColor,
              ),
              bodySmall: GoogleFonts.poppins(
                fontSize: 12.sp,
                color: kSubtitles,
              ),
              labelMedium: TextStyle(
                fontSize: 10.sp,
                fontWeight: FontWeight.w500,
                color: kTextColor,
              ),
            ),
            inputDecorationTheme: const InputDecorationTheme(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: kTextLightColor,
                  width: 0.7,
                ),
              ),
              border: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: kTextLightColor,
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: kPrimaryColor,
                ),
              ),
            ),
          ),

          home: const HomePage(),
        );
      },
    );
  }
}
