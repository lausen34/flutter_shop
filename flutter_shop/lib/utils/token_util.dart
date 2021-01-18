import 'package:flutter_shop/model/user_model.dart';
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

  static clearUserInfo() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('id');
    await prefs.remove('token');
    await prefs.remove('username');
    await prefs.remove('mobile');
    await prefs.remove('head_image');
    await prefs.remove('address');
  }

  static Future<UserModel> getUserInfo() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var id = await prefs.getInt('id');
    var token = await prefs.getString('token');
    var username = await prefs.getString('username');
    var mobile = await prefs.getString('mobile');
    var head_image = await prefs.getString('head_image');
    var address = await prefs.getString('address');
    var json = {
      'id': id,
      'token': token,
      'username': username,
      'mobile': mobile,
      'head_image': head_image,
      'address': address,
    };
    return UserModel.fromJson(json);
  }

  static saveLoginInfo(UserModel userModel) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('id', userModel.id);
    await prefs.setString('token', userModel.token);
    await prefs.setString('username', userModel.username);
    await prefs.setString('mobile', userModel.mobile);
    await prefs.setString('head_image', userModel.head_image);
    await prefs.setString('address', userModel.address);
  }
}