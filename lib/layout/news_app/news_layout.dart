

// ignore_for_file: prefer_const_constructors, avoid_print, unused_import

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:shop/layout/news_app/cubit/cubit.dart';
import 'package:shop/layout/news_app/cubit/states.dart';
import 'package:shop/modules/Search/Search_Screen.dart';
import 'package:shop/shared/components/components.dart';
import 'package:shop/shared/network/remote/dio_helper.dart';
import 'package:shop/shared/styles/theme_service.dart';

class NewsAPP extends StatelessWidget {
  const NewsAPP({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>NewsCubit()..getBusiness()..getSports()..getScience()..getHealth(),
      child: BlocConsumer<NewsCubit,NewsStates>(
        listener: (context, state) => {},
        builder: (context, state) {
          var cubit=NewsCubit.get(context);
          return  Scaffold(
          appBar: AppBar(
            title: Text(
              'News App',
              
            ),
            actions: [
              IconButton(onPressed: (){
                navigateTo(
                  context, SearchScreen(),
                  );
              }, icon: Icon(Icons.search)),
              IconButton(onPressed: (){
                // NewsCubit.get(context).changeAppMode();
                // Get.changeThemeMode(Get.isDarkMode?ThemeMode.light:ThemeMode.dark);
                ThemeService().changeThemeMode();
              }, icon: Icon(Icons.brightness_4_outlined))
            ],
            
          ),
          
            body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            onTap: (index) {
              cubit.ChangeBottomNavBar(index);
            },
            items: cubit.bottomItems,
          ),
          
        );
        },
      ),
    );
  }
}