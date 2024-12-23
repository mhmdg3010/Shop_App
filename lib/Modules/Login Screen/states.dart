abstract class ShopLoginStates {}
class ShopInitialState extends ShopLoginStates{}
class ShopLoginLoadinglState extends ShopLoginStates{}
class ShopLoginSuccessState extends ShopLoginStates{}
class ShopLoginEroorState extends ShopLoginStates{
  String error;
  ShopLoginEroorState(this.error);
}
class ShopChangeVisibilityState extends ShopLoginStates{}
