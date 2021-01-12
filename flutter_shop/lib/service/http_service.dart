import 'dart:convert';
import 'dart:io';
import 'package:flutter_shop/utils/token_util.dart';
import 'package:flutter/material.dart';

class HttpService{

  //post请求
  static Future<Map<String,dynamic>> post(String url,{Map<String,dynamic> params}) async {
    HttpClient httpClient;
    HttpClientRequest request;
    HttpClientResponse response;

    try{
      httpClient = HttpClient();
      request = await httpClient.getUrl(Uri.parse(url));

      //设置请求头

      //设置请求参数
      if (params != null){
        request.add(utf8.encode(json.encode(params)));
      }
      response = await request.close();
      String body = await response.transform(utf8.decoder).join();
      if(response.statusCode == 200){
        Map<String,dynamic> resBody = json.decode(body);
        return resBody;
      }else{
        print('请求失败....');
      }
    }finally{
      if(request != null){
        request.close();
      }
    }
    return null;
  }
}