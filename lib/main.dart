// ignore_for_file: deprecated_member_use, prefer_const_constructors, unused_import, unnecessary_import

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shop/layout/news_app/cubit/cubit.dart';
import 'package:shop/layout/news_app/cubit/states.dart';
import 'package:shop/layout/news_app/news_layout.dart';
import 'package:shop/layout/todo_App/home_layout.dart';
import 'package:shop/shared/bloc_observed.dart';
import 'package:shop/shared/network/remote/dio_helper.dart';
import 'package:shop/shared/styles/theme_service.dart';
// import 'package:shop/layout/todo_App/home_layout.dart';
// import 'package:shop/modules/login/Login_Screen.dart';

void main()async {
   await GetStorage.init();
  Bloc.observer = MyBlocObserver();
   DioHelper.init();
  runApp(const MyApp());
} 
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return   BlocProvider(
      create: (BuildContext context) =>NewsCubit(),
      child: BlocConsumer<NewsCubit,NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return 
           GetMaterialApp(
          debugShowCheckedModeBanner: false,
         theme: ThemeService().lightTheme,
         darkTheme: ThemeService().darkTheme,
         themeMode: ThemeService().getThemeMode(),
          home: NewsAPP(),
           
          // HomeLatout()
          // LoginScreen(),
        );
        },
      ),
    );
  
  }
}