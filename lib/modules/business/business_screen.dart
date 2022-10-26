// ignore_for_file: prefer_const_constructors, file_names, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, import_of_legacy_library_into_null_safe, unused_import, depend_on_referenced_packages, unused_local_variable, prefer_is_empty
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/layout/news_app/cubit/cubit.dart';
import 'package:shop/layout/news_app/cubit/states.dart';
import 'package:shop/shared/components/components.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({super.key});

  @override
  Widget build(BuildContext context) {
   return BlocConsumer<NewsCubit,NewsStates>(
     listener: (BuildContext context, Object? state) {  
     },
     builder: (BuildContext context, state) {

        var list =  NewsCubit.get(context).business;

      return articleBuilder(list,context);
       },
     
     
   ); 
  //  

}
}