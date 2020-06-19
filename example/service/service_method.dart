import 'package:dio/dio.dart';
import 'dart:io';
import 'dart:async';
import '../config/service_url.dart';

Future getHomeBanner() async {
  try {
    Response response = await Dio().get(servicePath['homeBanner']);
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('后端接口出现异常，请检测代码和服务器情况.........');
    }
  } catch (e) {
    return print(e);
  }
}