import 'package:shared_preferences/shared_preferences.dart';

class TokenUtil {
  // 判断是否登录
  static Future<bool> isLogin() async{
    var token = "";
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = await prefs.getString('token');
    if (token == "" || token == null){
      return false;
    }
    return true;
  }

  // 获取token
  static Future<String> getToken() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = await prefs.getString('token');
    return token;
  }
}