import 'package:dio/dio.dart';

class ApiService {
  final String baseUrl = 'https://dummyjson.com/recipes';
  final Dio dio;

  ApiService(this.dio);

  Future<Map<dynamic, dynamic>> get({String? endpoint}) async {
    var response =
        await dio.get(endpoint != null ? "$baseUrl$endpoint" : baseUrl);
    return response.data;
  }
}
