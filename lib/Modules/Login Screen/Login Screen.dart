import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:untitled1/Components/components.dart';
import 'package:untitled1/Modules/Login%20Screen/cubit.dart';
import 'package:untitled1/Modules/Login%20Screen/states.dart';
import 'package:untitled1/Modules/Shop_Layout/Shop-Lyout.dart';
import 'package:untitled1/network/local/cache_helper.dart';

import '../Shop Register Screen.dart';

class ShopLogin extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ShopLoginCubit(),
      child: BlocConsumer<ShopLoginCubit, ShopLoginStates>(
        listener: (context, state) {
          if(state is ShopLoginSuccessState){
            if(state.loginModel.status!){
              print(state.loginModel.message);
              print(state.loginModel.data!.token);
              CacheHelper.saveData(
                key: 'token',
                value: state.loginModel.data!.token!,
              ).then((value) {

                navigateAndfinish(
                  context,
                  ShopLayout(),
                );
              });

            }else
            {
              print(state.loginModel.message);
              showToast(
                state.loginModel.message,
                context: context,
                backgroundColor: Colors.red,
                animation: StyledToastAnimation.slideFromBottom,
                reverseAnimation: StyledToastAnimation.slideFromBottom,
                position: StyledToastPosition.top,
                startOffset: Offset(0.0, -3.0),
                reverseEndOffset: Offset(0.0, -3.0),
                duration: Duration(seconds: 4),
              );

            }
          }
        },
        builder: (context, state) {
          return  Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
            ),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formKey,
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
                        SizedBox(
                          height: 15,),

                        Text(
                          'Login now to browse our hot offers',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: 15,),

                        defaultFormField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          validate: (String? value) {
                            if (value!.isEmpty) {
                              return 'please enter your email address';
                            }
                          },
                          label: 'Email Address',
                          prefix: Icons.email_outlined,
                        ),

                        SizedBox(
                          height: 10,
                        ),
                        defaultFormField(
                          controller:passwordController,
                          keyboardType: TextInputType.visiblePassword,
                          onSubmit: (value) {
                            if (formKey.currentState!.validate()) {
                              ShopLoginCubit.get(context).userLogin(
                                email: emailController.text,
                                password: passwordController.text,
                              );
                            }
                          },
                          validate: (String? value) {
                            if (value!.isEmpty) {
                              return 'password is too short';
                            }
                          },
                          label: 'Password',
                          prefix: Icons.lock_outline,
                          suffix: ShopLoginCubit.get(context).suffix,
                          isPassword: ShopLoginCubit.get(context).isPassword,
                          suffixPressed: () {
                            ShopLoginCubit.get(context).changePasswordVisibility();
                          },
                        ),

                        SizedBox(
                          height: 15,),

                        ConditionalBuilder(
                          builder: (context) => Container(
                            width: double.infinity,
                            height: 40,
                            child: MaterialButton(
                              color: Colors.blue,
                              onPressed: (){
                                if(formKey.currentState!.validate()){
                                  ShopLoginCubit.get(context).userLogin(
                                      email: emailController.text,
                                      password: passwordController.text);
                                }
                              },
                              child: Text('LOGIN',
                                style: TextStyle(
                                    fontSize: 20
                                ),
                              ),
                            ),
                          ),
                          condition: state is! ShopLoginLoadinglState,
                          fallback:(context) => Center(child: CircularProgressIndicator()) ,
                        ),
                        SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Don\'t have an account?'),
                            SizedBox(width: 5,),
                            TextButton(onPressed: (){
                              navigateTo(context, ShopRegisterScreen());
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
            ),
          );
        },
      ),
    );
  }
}
