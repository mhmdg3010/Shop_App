import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Styles/colors.dart';

void navigateTo (context ,widget) =>
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context)=> widget));
void navigateAndfinish (context, widget)=>
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context)=> widget),
            (route) => false
    );
Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType keyboardType,
  ValueChanged<String>? onSubmit,
  ValueChanged<String>? onChange,
  VoidCallback? onTap,
  bool isPassword = false,
  FormFieldValidator<String>? validate,
  required String label,
  required IconData prefix,
  IconData? suffix,
  VoidCallback? suffixPressed,
  bool isClickable = true,
}) =>
    TextFormField(
      cursorColor: defaultColor,
      controller: controller,
      keyboardType: keyboardType,
      obscureText: isPassword,
      enabled: isClickable,
      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      onTap: onTap,
      validator: validate,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(
          prefix,
        ),
        suffixIcon: suffix != null
            ? IconButton(
          onPressed: suffixPressed,
          icon: Icon(
            suffix,
          ),
        )
            : null,
        border: OutlineInputBorder(),
      ),
    );Widget myDivider() {
  return Container(
    width: double.infinity,
    height: 1,
    color: Colors.grey[200],
  );
}







