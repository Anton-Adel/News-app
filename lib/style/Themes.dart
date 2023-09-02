
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'colors.dart';

ThemeData darktheme=  ThemeData(

  primarySwatch: Colors.amber,
  appBarTheme:AppBarTheme(
    backgroundColor: Colors.black12,
    elevation: 0.0,
    backwardsCompatibility: false,
    systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.grey,
        statusBarBrightness: Brightness.light

    ),
    titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold
    ),
    actionsIconTheme: IconThemeData(
        color: Colors.white
    ),
    titleSpacing: 20,
  ),
  scaffoldBackgroundColor: Colors.white10,
  floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Colors.grey
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.black12,
      unselectedItemColor: Colors.white,
      selectedItemColor: DefualtColor
  ),

  textTheme: TextTheme(
    bodyText1: TextStyle(
      fontSize: 18,
      color: Colors.white,

    ),
      subtitle1: TextStyle(
        fontSize: 16,
        color: Colors.white,
      )
  ),
);




ThemeData lighttheme=  ThemeData(
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.white,
    backwardsCompatibility:false ,
    systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark

    ),

    iconTheme: IconThemeData(
      color: Colors.black
    ),

    elevation: 0.0,
    titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.bold
    ),
    //backgroundColor: Colors.grey[300],


    actionsIconTheme: IconThemeData(
        color: Colors.black
    ),
    titleSpacing: 20,
  ),



  bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.shifting,
      elevation: 20,
      selectedItemColor: DefualtColor,
      unselectedItemColor: Colors.black,
      unselectedIconTheme:  IconThemeData(
          color: Colors.black
      )
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: DefualtColor
  ),
  textTheme: TextTheme(
    bodyText1: TextStyle(
      fontSize: 18,
      color: Colors.black,

    ),
    subtitle1: TextStyle(
      fontSize: 16,
      color: Colors.black,
    )
  ),


);