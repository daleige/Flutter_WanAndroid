import 'package:dio/dio.dart';
import 'package:flutter_wanandroid/constants/ApiService.dart';

class Singleton {
  static final Singleton _singleton = Singleton._internal();
  static Dio dio = _createDio();

  factory Singleton() => _singleton;

  Singleton._internal() {}

  static Dio _createDio() {
    var options = BaseOptions(
      baseUrl: ApiService.BASE_URL,
      connectTimeout: 5000,
      receiveTimeout: 3000,
    );
    return Dio(options);
  }

  static Dio getDio() {
    return dio;
  }
}
