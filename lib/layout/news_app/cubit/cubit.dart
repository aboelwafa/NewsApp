// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, avoid_print, curly_braces_in_flow_control_structures, unused_import, unnecessary_string_interpolations
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/layout/news_app/cubit/states.dart';
import 'package:shop/modules/Health/health_screen.dart';
import 'package:shop/modules/Technology/techonolgy_screen.dart';
import 'package:shop/modules/business/business_Screen.dart';
import 'package:shop/modules/science/science_screen.dart';
import 'package:shop/modules/settings_Screen/settings_screen.dart';
import 'package:shop/modules/sports/sports_screen.dart';
import 'package:shop/shared/network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates>{
NewsCubit():super(NewsIntialState());
static NewsCubit get(context)=>BlocProvider.of(context);
int currentIndex=0;

List<BottomNavigationBarItem> bottomItems=[
  BottomNavigationBarItem(icon: Icon(Icons.business),
  label: 'Business',
  ),
   BottomNavigationBarItem(icon: Icon(Icons.sports),
  label: 'Sports',
  ),
   BottomNavigationBarItem(icon: Icon(Icons.science),
  label: 'science',
  ),
   BottomNavigationBarItem(icon: Icon(Icons.health_and_safety),
  label: 'health',
  ),
  // BottomNavigationBarItem(icon: Icon(Icons.computer),
  // label: 'technology',
  // ),
   
  //  BottomNavigationBarItem(icon: Icon(Icons.settings),
  // label: 'Setting',
  // ),


];
List<Widget> screens=[
  BusinessScreen(),
  SportsScreen(),
  ScienceScreen(),
  HealthScreen(),
  // TechnologyScreen(),
  // SettingsScreen(),
];
void ChangeBottomNavBar(int index){
  currentIndex=index;
  if(index==1)
  getSports();
  if(index==2)
  getScience();
  if(index==3)
  getHealth();
  // if(index==3)
  // getTechnology();
  emit(NewsBottomNavState());
}

  List<dynamic> business=[];

  void getBusiness()
  {

    emit(NewsGetBusinessLoadingState());
    DioHelper.getData(
    url: 'v2/top-headlines',
    query: {
   'country':'eg',
   'category':'business',
   'apiKey':'f1e7f33e4c5149ffa05d3c74351bbcc8',
            },
      ).then((value) {
   //print(value?.data['articles'][0]['author']);
    business=value?.data['articles'];
    print(business[0]['title']);


    emit(NewsGetBusinessSuccessState());
    }).catchError((error){
    print(error.toString());
    emit(NewsGetBusinessErrorState(error.toString()));
    });
  }
List<dynamic> sports=[];

  void getSports()
  {

    emit(NewsGetSportsLoadingState());
    DioHelper.getData(
    url: 'v2/top-headlines',
    query: {
   'country':'eg',
   'category':'sports',
   'apiKey':'f1e7f33e4c5149ffa05d3c74351bbcc8',
            },
      ).then((value) {
   //print(value?.data['articles'][0]['author']);
    sports=value?.data['articles'];
    print(sports[0]['title']);


    emit(NewsGetSportsSuccessState());
    }).catchError((error){
    print(error.toString());
    emit(NewsGetSportsErrorState(error.toString()));
    });
  }

List<dynamic> science=[];

  void getScience()
  {

    emit(NewsGetScienceLoadingState());
    DioHelper.getData(
    url: 'v2/top-headlines',
    query: {
   'country':'eg',
   'category':'science',
   'apiKey':'f1e7f33e4c5149ffa05d3c74351bbcc8',
            },
      ).then((value) {
   //print(value?.data['articles'][0]['author']);
    science=value?.data['articles'];
    print(science[0]['title']);
    emit(NewsGetScienceSuccessState());
    }).catchError((error){
    print(error.toString());
    emit(NewsGetScienceErrorState(error.toString()));
    });
  }
  List<dynamic> health=[];

  void getHealth()
  {

    emit(NewsGetScienceLoadingState());
    DioHelper.getData(
    url: 'v2/top-headlines',
    query: {
   'country':'eg',
   'category':'health',
   'apiKey':'f1e7f33e4c5149ffa05d3c74351bbcc8',
            },
      ).then((value) {
   //print(value?.data['articles'][0]['author']);
    health=value?.data['articles'];
    print(health[0]['title']);
    emit(NewsGetHealthSuccessState());
    }).catchError((error){
    print(error.toString());
    emit(NewsGetHealthErrorState(error.toString()));
    });
  }
  
List<dynamic> search=[];

  void getSearch(String value)
  {

    emit(NewsGetSearchLoadingState());
    search=[];

     DioHelper.getData(
    url: 'v2/everything',
    query: {
    'q':'$value',
   'apiKey':'f1e7f33e4c5149ffa05d3c74351bbcc8',
            },
      ).then((value) {
    search=value?.data['articles'];
    print(search[0]['title']);
    emit(NewsGetSearchSuccessState());
    }).catchError((error){
    print(error.toString());
    emit(NewsGetSearchErrorState(error.toString()));
    });
  }






  
  // List<dynamic> technology=[];
  // void getTechnology()
  // {
  //   emit(NewsGetTechnologyLoadingState());
  //   DioHelper.getData(
  //   url: 'v2/top-headlines',
  //   query: {
  //  'country':'eg',
  //  'category':'technology',
  //  'apiKey':'f1e7f33e4c5149ffa05d3c74351bbcc8',
  //           },
  //     ).then((value) {
  //  //print(value?.data['articles'][0]['author']);
  //   health=value?.data['articles'];
  //   print(health[0]['title']);
  //   emit(NewsGetTechnologySuccessState());
  //   }).catchError((error){
  //   print(error.toString());
  //   emit(NewsGetTechnologyErrorState(error.toString()));
  //   });
  // }



  bool isDark=false;
 ThemeMode appMode=ThemeMode.light;

void changeAppMode()
{
 if(isDark=!isDark) 
  emit(AppChangeModeState());
}

}
