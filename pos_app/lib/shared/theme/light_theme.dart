// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// final defaultFontFamily = GoogleFonts.robotoCondensed();

// final ThemeData lightThemeData = ThemeData(
//   primaryColor: theme.primary,
//   canvasColor: theme.primary,
//   accentColor: theme.primary,
//   cardColor: theme.disabled,
//   backgroundColor: theme.backgroundColor,
//   scaffoldBackgroundColor: theme.mainColor,
//   fontFamily: theme.fontFamily.fontFamily,
//   iconTheme: IconThemeData(
//     color: theme.textColor,
//   ),
//   textTheme: TextTheme(
//     bodyText1: TextStyle(
//       color: theme.textColor,
//     ),
//     bodyText2: TextStyle(
//       color: theme.textColor,
//     ),
//   ).apply(
//     bodyColor: theme.textColor,
//     displayColor: theme.textColor,
//   ),
//   appBarTheme: AppBarTheme(
//     elevation: 0.0,
//     shadowColor: Colors.grey[50],
//     color: theme.mainColor,
//     iconTheme: IconThemeData(
//       color: theme.textColor,
//     ),
//     textTheme: TextTheme(
//       bodyText1: TextStyle(
//         color: theme.textColor,
//       ),
//       bodyText2: TextStyle(
//         color: theme.textColor,
//       ),
//       headline1: TextStyle(
//         color: theme.textColor,
//       ),
//       headline2: TextStyle(
//         color: theme.textColor,
//       ),
//       headline3: TextStyle(
//         color: theme.textColor,
//       ),
//       headline4: TextStyle(
//         color: theme.textColor,
//       ),
//       headline5: TextStyle(
//         color: theme.textColor,
//       ),
//       headline6: TextStyle(
//         color: theme.textColor,
//       ),
//     ),
//   ),
//   bottomNavigationBarTheme: BottomNavigationBarThemeData(
//     backgroundColor: Colors.black,
//     selectedItemColor: theme.primary,
//     unselectedItemColor: theme.textColor,
//   ),
// );

// class ApplicationTheme {
//   Color get mainColor {
//     return Colors.black;
//   }

//   Color get backgroundColor {
//     return Colors.black;
//   }

//   Color get appBarColor {
//     return Colors.black;
//   }

//   Color get textColor {
//     return Color(0xffF6F6F6);
//   }

//   Color get inactiveColor {
//     return Colors.grey[600];
//   }

//   Color get success {
//     return Colors.green;
//   }

//   Color get danger {
//     return Colors.red;
//   }

//   Color get warning {
//     return Colors.orange;
//   }

//   Color get info {
//     return Color(0xff49C3DE);
//   }

//   Color get primary {
//     return Color(0xffA58430);
//   }

//   Color get primaryAlternative {
//     return Colors.grey[900];
//   }

//   Color get secondary {
//     return Colors.grey;
//   }

//   Color get disabled {
//     return Color(0xff212121);
//   }

//   //Radius
//   double smallCircularRadius = 8.0;
//   double mediumCircularRadius = 16.0;
//   double largeCircularRadius = 32.0;

//   BorderRadiusGeometry get smallRadius {
//     return BorderRadius.all(Radius.circular(smallCircularRadius));
//   }

//   BorderRadiusGeometry get mediumRadius {
//     return BorderRadius.all(Radius.circular(mediumCircularRadius));
//   }

//   BorderRadiusGeometry get largeRadius {
//     return BorderRadius.all(Radius.circular(largeCircularRadius));
//   }

//   //Height
//   double get smallHeight {
//     return 48;
//   }

//   double get mediumHeight {
//     return 52;
//   }

//   double get largeHeight {
//     return 56;
//   }

//   //Shadow
//   normalShadow(Color color) {
//     return [
//       BoxShadow(
//         color: color.withOpacity(0.4),
//         blurRadius: 6.0,
//         spreadRadius: 4,
//       ),
//     ];
//   }

//   //Padding
//   EdgeInsetsGeometry get normalPadding {
//     return EdgeInsets.all(10.0);
//   }

//   EdgeInsetsGeometry get mediumPadding {
//     return EdgeInsets.all(16.0);
//   }

//   EdgeInsetsGeometry get largePadding {
//     return EdgeInsets.all(20.0);
//   }

//   //Border
//   BoxBorder get defaultBorder {
//     return Border.all(
//       width: 1.0,
//       color: Colors.grey[300],
//     );
//   }

//   TextStyle get fontFamily {
//     return GoogleFonts.montserrat();
//   }
// }

// var theme = ApplicationTheme();
