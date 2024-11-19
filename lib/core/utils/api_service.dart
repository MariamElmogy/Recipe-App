import 'package:dio/dio.dart';

class ApiService {
  final String baseUrl = 'https://dummyjson.com/recipes';
  final Dio dio;

  ApiService(this.dio);

  Future<Map<dynamic, dynamic>> get() async {
    var response = await dio.get(baseUrl);
    // log(response.data);
    return response.data;
  }
}
