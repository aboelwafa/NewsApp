// // ignore_for_file: camel_case_types

// import 'package:shared_preferences/shared_preferences.dart';

// class cacheHelper
// {
//   static late SharedPreferences sharedpreferences;

//   static init()async
  
//          {
//                 sharedpreferences= await SharedPreferences.getInstance();
//          }
//         static Future<bool> putData({
//           required String key,
//           required bool value,
//          }) async {
//              return await  sharedpreferences.setBool(key,value);
//          }  
//          static bool? getData({
//           required String key,
//          })  
//          {
//              return sharedpreferences.getBool(key);
//          }  
// }