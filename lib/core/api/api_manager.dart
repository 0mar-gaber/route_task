import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';


import '../constant.dart';

@singleton
class ApiManager {
  static late Dio dio;

  static void init() {
    dio = Dio(
      BaseOptions(
        baseUrl: Constant.baseUrl,
        validateStatus: (status) {
          if (status! < 500) {
            return true;
          }
          return false;
        },
      ),
    );
  }

  Future<dynamic> getRequest({required String endPoint, Map<String, dynamic>? queryParameters , String ? token}) async {
    try {
      Options options = Options(headers: {'token': token});
      Response response = await dio.get(endPoint, queryParameters: queryParameters , options: options);
      if (response.statusCode == 200) {
        return response.data;
      } else {
        // Handle other status codes
        throw Exception('Failed to load data ${response.statusCode}');
      }
    } catch (error) {
      // Handle DioError and other exceptions
      throw Exception('Network error: $error');
    }
  }

  Future<Response> postRequest({required String endPoint, Map<String, dynamic>? body, String? token}) async {
    Options options = Options(headers: {'token': token});
    return await dio.post(endPoint, data: body,options: options);
  }

  Future<Response> putRequest({required String endPoint, Map<String, dynamic>? body, String? token}) async {
    try {
      Options options = Options(headers: {'token': token});
      return await dio.put(endPoint, data: body, options: options);
    } catch (error) {
      // Handle DioError and other exceptions
      throw Exception('Network error: $error');
    }
  }

  Future<Response> deleteRequest({required String endPoint ,required String token}) async {
    try {
      Options options = Options(headers: {'token': token});
      return await dio.delete(endPoint, options: options);
    } catch (error) {
      // Handle DioError and other exceptions
      throw Exception('Network error: $error');
    }
  }
}
