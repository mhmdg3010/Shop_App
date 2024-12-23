import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/Modules/Login%20Screen/states.dart';
import 'package:untitled1/network/end_points/end_points.dart';
import 'package:untitled1/network/remote/dio_helper.dart';

class ShopLoginCubit extends Cubit<ShopLoginStates>{
  ShopLoginCubit() : super (ShopInitialState());
  static ShopLoginCubit get(context) => BlocProvider.of(context);

  void userLogin({
    required String email,
    required String password,
}){
    emit(ShopLoginLoadinglState());
    DioHelper.postData(
        url: LOGIN,
        data: {
          'email':email,
          'password': password,
        },).then((value) {
          print(value.data);
          emit(ShopLoginSuccessState());
    }).catchError((onError){
      print('error message :$onError');
      emit(ShopLoginEroorState(onError.toString()));
    });
  }
  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(ShopChangeVisibilityState());
  }


}