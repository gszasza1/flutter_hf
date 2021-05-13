import 'package:dio/dio.dart';

// ignore: non_constant_identifier_names
Dio DioFactory() {
  final dio = Dio(BaseOptions(
      connectTimeout: 10000,
      receiveTimeout: 10000,
      baseUrl: "https://api.themoviedb.org/3"));
  dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
    options.queryParameters = {
      ...options.queryParameters,
      'api_key': "5637779ad0397a76e1cddf7bc16c3a4d"
    }; 
    return handler.next(options);
  }));

  return dio;
}
