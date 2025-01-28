import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:scheduler_medical/global_bloc.dart';
import 'package:sizer/sizer.dart';
import 'pages/homePage.dart';
import 'constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  GlobalBloc? globalBloc;

  @override
  void initState() {
    globalBloc = GlobalBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Provider<GlobalBloc>.value(
      value: globalBloc!,
      child: Sizer(
        builder: (context, orientation, deviceType) {
          return MaterialApp(
            title: 'DoseCerta',
            //theme
            theme: ThemeData.dark().copyWith(
              primaryColor: kPrimaryColor,
              scaffoldBackgroundColor: kScaffoldColor,
              appBarTheme: AppBarTheme(
                  toolbarHeight: 5.h,
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
                headlineSmall: TextStyle(
                    fontSize: 15.sp,
                    color: kTextColor,
                    letterSpacing: 1.0,
                    fontWeight: FontWeight.w600),
                bodyMedium:
                    GoogleFonts.poppins(fontSize: 10.sp, color: kPrimaryColor),
                bodySmall: GoogleFonts.poppins(
                  fontSize: 10.sp,
                  color: kSubtitles,
                ),
                labelMedium: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: kTextColor,
                ),
                labelSmall: GoogleFonts.poppins(
                    fontSize: 16.sp,
                    color: kTextColor,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.0),
              ),
              inputDecorationTheme: InputDecorationTheme(
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
              timePickerTheme: TimePickerThemeData(
                backgroundColor: kScaffoldColor,
                hourMinuteColor: kPrimaryColor,
                hourMinuteTextColor: kScaffoldColor,
                dayPeriodColor: kTextColor,
                dayPeriodTextColor: kScaffoldColor,
                dialBackgroundColor: kPrimaryColor,
                dialHandColor: kOtherColor,
                dialTextColor: kScaffoldColor,
                entryModeIconColor: kOtherColor,
                dayPeriodTextStyle: GoogleFonts.aBeeZee(
                  fontSize: 7.sp,
                ),
              ),
            ),

            home: const HomePage(),
          );
        },
      ),
    );
  }
}
