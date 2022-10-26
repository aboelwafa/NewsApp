// ignore_for_file: file_names, prefer_const_constructors, non_constant_identifier_names, use_key_in_widget_constructors, must_be_immutable, body_might_complete_normally_nullable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/layout/news_app/cubit/cubit.dart';
import 'package:shop/layout/news_app/cubit/states.dart';
import 'package:shop/shared/components/components.dart';

class SearchScreen extends StatelessWidget {

      var SearchController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context, state)  {},
      builder: (context, state) {
        var list=NewsCubit.get(context).search;
        return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: defultFormField(
                controller: SearchController,
                 validate: (String? value) {
                   if(value!.isEmpty){
                    return 'Search Must Not be Empty';
                   }
                   return null;
                 },
                 onChanged: (value) {
                   NewsCubit.get(context).getSearch(value!);
                 },
                  type: TextInputType.text,
                   label: 'Search',
                    prefix: Icons.search,
                  ),
                
                  
                  
            ),
            Expanded(
              child: articleBuilder(
                list, context),
            ),
          ],
        ),
      );
      },

    );
  }
}