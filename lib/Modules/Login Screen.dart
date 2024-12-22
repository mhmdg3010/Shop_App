import 'package:flutter/material.dart';
import 'package:untitled1/Components/components.dart';
import 'package:untitled1/Modules/Register%20Screen.dart';

class ShopLogin extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'LOGIN',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  'Login now to browse our hot offers',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                defaultTextFormFaild(
                    controller: emailController,
                    type: TextInputType.emailAddress,
                    validator: (String? value){
                      if( value!.isEmpty ){
                        return 'Please enter your email adress';
                      }
                    },
                    hintText: 'Enter your email adress',
                    label: 'Email Adress',
                    prefixIcon: Icon(Icons.email_outlined),),
                SizedBox(
                  height: 15,
                ),

                defaultTextFormFaild(
                  suffixIcon: Icon(Icons.remove_red_eye_outlined),
                  controller: passwordController,
                  type: TextInputType.visiblePassword,
                  validator: (String? value){
                    if( value!.isEmpty ){
                      return 'Password is too short';
                    }
                  },
                  hintText: 'Enter your password',
                  label: 'Passowrd',
                  prefixIcon: Icon(Icons.lock_outline),),
                SizedBox(height: 15,),

                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.blue,

                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: MaterialButton(
                    onPressed: (){},
                  child: Text('login',
                    style: TextStyle(
                      fontSize: 20
                    ),
                  ),
                  ),
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Don\'t have an account?'),
                    SizedBox(width: 5,),
                    TextButton(onPressed: (){
                      navigateTo(context, RegisterScreen());
                    }, child: Text(
                      'Register'
                    )),
                  ],
                ),



              ],
            ),
          ),
        ),
      ),
    );
  }
}
