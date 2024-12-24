import 'package:untitled1/Models/login%20Model.dart';

abstract class ShopLoginStates {}
class ShopInitialState extends ShopLoginStates{}
class ShopLoginLoadinglState extends ShopLoginStates{}
class ShopLoginSuccessState extends ShopLoginStates{
final  ShopLoginModel loginModel;
ShopLoginSuccessState(this.loginModel);
}
class ShopLoginEroorState extends ShopLoginStates{
  String error;
  ShopLoginEroorState(this.error);
}
class ShopChangeVisibilityState extends ShopLoginStates{}
