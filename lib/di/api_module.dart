import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';

@module
abstract class ApiModule {
  Dio getDioClient() {
    return Dio();
  }
}
