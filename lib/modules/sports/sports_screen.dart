// ignore_for_file: prefer_const_constructors, prefer_is_empty, unused_import

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/layout/news_app/cubit/cubit.dart';
import 'package:shop/layout/news_app/cubit/states.dart';
import 'package:shop/shared/components/components.dart';

class SportsScreen extends StatelessWidget {
  const SportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
   return BlocConsumer<NewsCubit,NewsStates>(
     listener: (BuildContext context, Object? state) {  
     },
     builder: (BuildContext context, state) {

        var list =  NewsCubit.get(context).sports;

      return articleBuilder(list,context);
       },
     
     
   ); 
  }
}