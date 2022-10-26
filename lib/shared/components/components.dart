// ignore_for_file: sort_child_properties_last, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, non_constant_identifier_names, avoid_types_as_parameter_names, unused_import, avoid_web_libraries_in_flutter


import 'dart:developer';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//  1-material button
Widget defultButton({
  double width=double.infinity,
  Color background =Colors.blue ,
required void Function()? function, // Good
 required String text,
  double height=40.0,
 bool isUpperCase=true,
 double radius=5.0,
})=>
 Container(
  width: width,
  height: height,
  child: MaterialButton(
    onPressed:function,
    child:
     Text(
      isUpperCase?text.toUpperCase():text,
       style: TextStyle(
      color: Colors.white,
    ),),
  ),
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(radius),
      color:background,

    ),

);
// 2-TextFormField
Widget defultFormField({
  required TextEditingController controller,
  String? Function(String?)? onSubmit,
  String? Function(String?)? onChanged,
 required String? Function(String?)? validate,
 required TextInputType type,
  required String label,
  required IconData prefix,
   IconData? suffix,
   Function()? suffixpress,
  bool ispassword=false,
})=>
 TextFormField(    
                         
  controller: controller,
  onFieldSubmitted:onSubmit,
 onChanged: onChanged,
 validator: validate,
 keyboardType: type,
 obscureText: ispassword,
 decoration: InputDecoration(
 labelText: label,
 prefixIcon: Icon(prefix),
    suffixIcon: suffix!=null? IconButton(
      onPressed: suffixpress,
      icon: Icon(
      Icons.remove_red_eye),
    )
  :null,
 border: OutlineInputBorder(),
                ),
                );        

Widget mydivider()=>Padding(
              padding: const EdgeInsetsDirectional.only(start: 20.0),
              child: Container(
                width: double.infinity,
                height: 1,
                color: Colors.grey[500],
              ),
            );
//  atrticle(image-text-text)


Widget buildArticleItem(article,context)=>
 Padding(

      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Container(
            width: 150.0,
            height: 150.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(image: NetworkImage("${article['urlToImage']}"),
              fit: BoxFit.cover,
              ),
              
            ),
          ),
        SizedBox(
          width: 20.0,
        ),
          Expanded(
            child: Container(
              height: 150.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,

                children: [
                  Expanded(
                    child: Text(
                     '${article['title']}'
                      ,style: Theme.of(context).textTheme.bodyText1,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    ),
                                          
                  ),
                  Text(
                    '${article['publishedAt']}',
                    style: TextStyle(color: Colors.grey),)
                  
                ],
              ),
            ),
          ),
        ],
      ),
    );

Widget articleBuilder(list,context)=>
  ConditionalBuilder(
      condition: list.length>0,
       builder: (context) => ListView.separated(
        physics: BouncingScrollPhysics(),
         itemBuilder: ( context,  index) =>buildArticleItem(list[index],context),
         separatorBuilder: ( context,  index)=>mydivider() ,
         itemCount: 10,
       ),
        fallback: (context) => Center(child: CircularProgressIndicator()),
       );


void navigateTo(context,Widget)=> Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Widget,
    ),
  );