import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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




Widget buildArticleItem(articles, context) => Padding(
  padding: const EdgeInsets.all(15.0),
  child: Row(
    children: [
      Container(
        height: 150,
        width: 190,

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            fit: BoxFit.fill,
            image: NetworkImage('${articles['urlToImage']}'),
          ),

        ),
      ),
      SizedBox(width: 10,),
      Expanded(
        child: Container(
          height: 150,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Text('${articles['title']}',
                  style:Theme.of(context).textTheme.bodyLarge,
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text('${articles['publishedAt']}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.grey,
                ),),
            ],
          ),
        ),
      ),
    ],
  ),
);


Widget defaultTextFormFaild({
  required TextEditingController controller,
  void Function(String)? onChanged,
  bool obscureText = false,
  void Function(String)? onFieldSubmitted,
  void Function()? onTap,
  required String? Function(String?)? validator,
  required String hintText,
  required String label,
  required TextInputType type,
  required Widget? prefixIcon,
  Widget? suffixIcon,
}) {
  return TextFormField(
    keyboardType: TextInputType.emailAddress,
    controller: controller,
    onChanged: onChanged,
    obscureText: obscureText,
    onFieldSubmitted: onFieldSubmitted,
    onTap: onTap,
    validator: validator,
    decoration: InputDecoration(
      hintText: hintText,
      label: Text(label),
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      hintStyle: const TextStyle(color: Colors.white),
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(),
      ),
      border: const OutlineInputBorder(
        borderSide: BorderSide(),
      ),
    ),
  );
}






Widget myDivider() {
  return Container(
    width: double.infinity,
    height: 1,
    color: Colors.grey[200],
  );
}


