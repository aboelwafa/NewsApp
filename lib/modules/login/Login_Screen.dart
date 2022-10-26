// ignore_for_file: file_names, prefer_const_constructors, avoid_print, must_be_immutable, use_key_in_widget_constructors
import 'package:flutter/material.dart';
import 'package:shop/shared/components/components.dart';
class LoginScreen extends StatefulWidget
 { 
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailcontroller=TextEditingController();
  var passwordcontroller=TextEditingController();
  var fromkey=GlobalKey<FormState>();
  bool ispassword=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
                key: fromkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                    Text(
                    'LOGIN', style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 40.0,),
                    defultFormField(
                      controller: emailcontroller,
                      label: 'Email Address',
                      prefix: Icons.email,
                      type: TextInputType.emailAddress,
                      validate: (p0) {
                        if(p0!.isEmpty){
                          return'email must not be empty';
                        }
                        return null;
                      },
                    ),               
                    SizedBox(
                      height: 15.0,),
                     defultFormField(
                      controller: passwordcontroller,
                      label: 'password',
                      prefix: Icons.lock,
                      suffix: ispassword ? Icons.visibility:Icons.visibility_off,
                      ispassword: ispassword,
                      suffixpress: () {
                       setState(() {
                         ispassword=!ispassword;
                       }); 
                      },
                      type: TextInputType.visiblePassword,
                      validate: (p0) {
                        if(p0!.isEmpty){
                          return'Password  must not be empty';
                        }
                        return null;
                      },
                    ),        
                    SizedBox(
                      height: 25.0,),
                  defultButton(
                  
                    background: Colors.blue,
                    isUpperCase: true,
                    width: double.infinity,
                    radius: 15.0,
                    text: 'login',                  
                      function:()
                    {
                      if(fromkey.currentState!.validate()){
                         print(emailcontroller.text);
                      print(passwordcontroller.text);
                      }
                     
                      
                     },
                  ),       
                    const SizedBox(
                      height: 15.0,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      const Text('Don\'t have an account?'),
                        const SizedBox(width: 5.0,),
                        TextButton(onPressed: (){}, child: const Text('Register Now')),
                    ],),
                ]
                  ),
            ),
          ),
        ),
      ));
  }
}
