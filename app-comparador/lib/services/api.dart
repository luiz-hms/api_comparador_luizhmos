import 'package:dio/dio.dart';

class Api {
  final dio = Dio();
  void dioConfig() {
    dio.options.baseUrl = '';
  }
}
