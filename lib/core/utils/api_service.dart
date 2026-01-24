import 'package:bookly/core/errors/failurs.dart';
import 'package:bookly/core/utils/api_end_points.dart';
import 'package:dio/dio.dart';

class ApiService {
  final String _baseUrl = 'https://www.googleapis.com/books/v1/';
  final Dio _dio;
  ApiService(this._dio);

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    try {
      Response response = await _dio.get(
        "$_baseUrl$endPoint",
        queryParameters: {'key': ApiEndPoints.apiKey},
      );

      return response.data;
    } catch (e) {
      if (e is DioError) {
        throw ServerFailure.fromDioError(e);
      } else {
        throw ServerFailure(errMessage: e.toString());
      }
    }
  }
}
