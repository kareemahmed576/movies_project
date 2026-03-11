import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
@module
abstract class DioImpl {
  Dio DioImplement(){
    return Dio();
  }
}