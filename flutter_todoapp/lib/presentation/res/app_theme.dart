// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

ThemeData lightTheme=ThemeData(
  brightness: Brightness.light
);
ThemeData darkTheme=ThemeData(
  brightness: Brightness.dark,
);

// enum AppTheme{
//   darkTheme,lightTheme
// }
// class AppThemes{
//    static final appThemeData={
//     AppTheme.darkTheme: ThemeData(
//       primarySwatch: Colors.grey, 
//       primaryColor: Colors.white, 
//        brightness: Brightness.dark,
//        floatingActionButtonTheme: const FloatingActionButtonThemeData(
//            backgroundColor: Colors.white, 
//             ), 
//     appBarTheme: AppBarTheme(backgroundColor: GREY),
//        textTheme: const TextTheme( 
//                titleMedium: TextStyle(color: Colors.white),
               
//                  )
    
//     ),
//      AppTheme.lightTheme: ThemeData(primarySwatch: Colors.grey, 
//       primaryColor: Colors.white, 
//        brightness: Brightness.light,
//        floatingActionButtonTheme: const FloatingActionButtonThemeData(
//             backgroundColor: Colors.black,  ),  
//       appBarTheme: AppBarTheme(backgroundColor: SecondaryColor),
//          textTheme: const TextTheme( 
//                titleMedium: TextStyle(color: Colors.white),
//                  )
//       )
//    };
// }
