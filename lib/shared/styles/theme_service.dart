// ignore_for_file: prefer_const_constructors, deprecated_member_use, duplicate_ignore, unused_field, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hexcolor/hexcolor.dart';

class ThemeService
{
  final lightTheme =
  ThemeData.light().copyWith(
          
            primaryColor: Colors.deepOrange ,
            scaffoldBackgroundColor: Colors.white,
            // ignore: prefer_const_constructors
            appBarTheme: AppBarTheme(
              titleSpacing: 20.0,
              backwardsCompatibility: false,
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: Colors.white,
                statusBarIconBrightness: Brightness.dark,
              ),
              backgroundColor: Colors.white,
              iconTheme: IconThemeData(
                color: Colors.black,
              ),
              elevation: 0.0,
              titleTextStyle: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
              
            ),
            floatingActionButtonTheme: FloatingActionButtonThemeData(
              backgroundColor: Colors.deepOrange,
            ),
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
              type: BottomNavigationBarType.fixed,
              selectedItemColor: Colors.deepOrange,
            ),
             textTheme: TextTheme(
              bodyText1: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
              
          );
  
  final darkTheme=
   ThemeData.dark().copyWith(
              primaryColorDark: Colors.deepOrange ,
            scaffoldBackgroundColor: HexColor('333739'),
            appBarTheme: AppBarTheme(
              titleSpacing: 20.0,
              backwardsCompatibility: false,
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor:HexColor('333739'),
                statusBarIconBrightness: Brightness.light,
              ),
              backgroundColor:HexColor('333739'),
              iconTheme: IconThemeData(
                color: Colors.white,
              ),
              elevation: 0.0,
              titleTextStyle: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              )
              
            ),
            floatingActionButtonTheme: FloatingActionButtonThemeData(
              backgroundColor: Colors.deepOrange,
            ),
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
              type: BottomNavigationBarType.fixed,
              selectedItemColor: Colors.deepOrange,
              unselectedIconTheme: IconThemeData(color: Colors.grey),
              backgroundColor: HexColor('333739'),
            ),
            textTheme: TextTheme(
              bodyText1: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              
            ),
            
         );
  
 
 
  final _getStorge=GetStorage();
  final StorgeKey="isDarkMode";

    ThemeMode getThemeMode(){
      return isSaveDarkMode()?ThemeMode.dark:ThemeMode.light;
    }


  bool isSaveDarkMode(){
    return _getStorge.read(StorgeKey)??false;

  }
  void SaveThemeMode(bool isDarkMode){
    _getStorge.write(StorgeKey, isDarkMode);
  }
  void changeThemeMode(){
    Get.changeThemeMode(isSaveDarkMode()?ThemeMode.dark:ThemeMode.light);
    SaveThemeMode(!isSaveDarkMode());
  }
}