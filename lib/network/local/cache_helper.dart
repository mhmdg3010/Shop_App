import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> putData(
      {required String key, required bool value}) async {
    return await sharedPreferences.setBool(key, value);
  }

  static bool? getData({required String key}) {
    return sharedPreferences.getBool(key);
  }

  static Future<bool> putBool({
    required String key,
    required bool value,
})async{
return await sharedPreferences.setBool(key, value);
}

static dynamic getdata({required String key}){
    return sharedPreferences.get(key);
}
static Future<bool?> saveData({
  required String key,
  required dynamic value,
})async{
   if(value is bool) return await sharedPreferences.setBool(key, value);
   if(value is String) return await sharedPreferences.setString(key, value);
   if(value is int) return await sharedPreferences.setInt(key, value);
return await sharedPreferences.setDouble(key, value);
}

static Future<bool?> removeData({required String key})async
{
     return sharedPreferences.remove(key);
}
}
