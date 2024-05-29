import 'package:dio/dio.dart';
import 'package:nike/common/exception.dart';

mixin HttpResponseValdiator{
   validateResponse(Response response){
    if (response.statusCode != 200) {
      AppException();
    }
  }
}