import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:skor_id_flutter/model/contact_list.dart';
import 'package:skor_id_flutter/utils/helper/constant.dart';
import '../../main.dart';

class BaseService {
  Map<String, String> bearerTokenHeaders() {
    var maps = Map<String, String>();
    maps['Authorization'] =
        'Bearer ${commonController.preferences.getString(Constant.TOKEN) ?? ''}';
    return maps;
  }

  Map<String, String> basicAuthHeaders() {
    var maps = Map<String, String>();
    maps['authorization'] =
        'Basic ${base64Encode(utf8.encode('username:password'))}';
    return maps;
  }

  dynamic get _errorResponse {
    return {'status': false, 'message': 'Mohon dicoba beberapa saat lagi'};
  }

  dynamic get _errorConnection {
    return {'status': false, 'message': 'Connection Error!'};
  }

  /// POST WITH FORM DATA
  Future<T> postFormData<T>(
      String url, FormData body, Map<String, String> headers) async {
    T resultResponse;

    try {
      final dio = Dio();
      dio.interceptors
          .add(LogInterceptor(responseBody: true, requestBody: true));
      var response = await dio.post(url,
          data: body,
          options: Options(
              headers: headers, sendTimeout: 5000, receiveTimeout: 5000));
      resultResponse = fromJson<T>(response.data);
    } on DioError catch (e) {
      if (commonController.notConnected.value) {
        resultResponse = fromJson<T>(_errorConnection);
      } else {
        resultResponse = fromJson<T>((e.response?.statusCode ?? 500) >= 500
            ? _errorResponse
            : jsonDecode(e.response.toString()));
      }
    }

    return resultResponse;
  }

  /// POST
  Future<T> post<T>(String url, Map<String, String> headers) async {
    T resultResponse;

    try {
      final dio = Dio();
      dio.interceptors
          .add(LogInterceptor(responseBody: true, requestBody: true));
      var response = await dio.post(url,
          options: Options(
              headers: headers, sendTimeout: 5000, receiveTimeout: 5000));
      resultResponse = fromJson<T>(response.data);
    } on DioError catch (e) {
      if (commonController.notConnected.value) {
        resultResponse = fromJson<T>(_errorConnection);
      } else {
        resultResponse = fromJson<T>((e.response?.statusCode ?? 500) >= 500
            ? _errorResponse
            : jsonDecode(e.response.toString()));
      }
    }
    return resultResponse;
  }

  /// POST WITH JSON BODY
  Future<T> postJsonBody<T>(
      String url, dynamic body, Map<String, String> headers) async {
    T resultResponse;

    try {
      final dio = Dio();
      dio.interceptors
          .add(LogInterceptor(responseBody: true, requestBody: true));
      var response = await dio.post(url,
          data: body,
          options: Options(
              headers: headers, sendTimeout: 5000, receiveTimeout: 5000));
      resultResponse = fromJson<T>(response.data);
    } on DioError catch (e) {
      if (commonController.notConnected.value) {
        resultResponse = fromJson<T>(_errorConnection);
      } else {
        resultResponse = fromJson<T>((e.response?.statusCode ?? 500) >= 500
            ? _errorResponse
            : jsonDecode(e.response.toString()));
      }
    }

    return resultResponse;
  }

  /// GET
  Future<T> get<T>(String url, Map<String, String> headers) async {
    T resultResponse;

    try {
      final dio = Dio();
      dio.interceptors
          .add(LogInterceptor(responseBody: true, requestBody: true));
      var response = await dio.get(url,
          options: Options(
              headers: headers, sendTimeout: 5000, receiveTimeout: 5000));
      resultResponse = fromJson<T>(response.data);
    } on DioError catch (e) {
      if (commonController.notConnected.value) {
        resultResponse = fromJson<T>(_errorConnection);
      } else {
        resultResponse = fromJson<T>((e.response?.statusCode ?? 500) >= 500
            ? _errorResponse
            : jsonDecode(e.response.toString()));
      }
    }

    return resultResponse;
  }

  Future<List<T>> getList<T>(String url, Map<String, String> headers) async {
    List<T> resultResponse;

    try {
      final dio = Dio();
      dio.interceptors
          .add(LogInterceptor(responseBody: true, requestBody: true));
      var response = await dio.get(url,
          options: Options(
              headers: headers, sendTimeout: 5000, receiveTimeout: 5000));
      resultResponse = _fromJsonList<T>(response.data);
    } on DioError catch (_) {
      resultResponse = _fromJsonList<T>(null);
    }

    return resultResponse;
  }

  /// PUT WITH FORM DATA
  Future<T> putFormData<T>(
      String url, FormData body, Map<String, String> headers) async {
    T resultResponse;

    try {
      final dio = Dio();
      dio.interceptors
          .add(LogInterceptor(responseBody: true, requestBody: true));
      var response = await dio.put(url,
          data: body,
          options: Options(
              headers: headers, sendTimeout: 5000, receiveTimeout: 5000));
      resultResponse = fromJson<T>(response.data);
    } on DioError catch (e) {
      if (commonController.notConnected.value) {
        resultResponse = fromJson<T>(_errorConnection);
      } else {
        resultResponse = fromJson<T>((e.response?.statusCode ?? 500) >= 500
            ? _errorResponse
            : jsonDecode(e.response.toString()));
      }
    }

    return resultResponse;
  }

  /// DELETE
  Future<T> delete<T>(String url, Map<String, String> headers) async {
    T resultResponse;

    try {
      final dio = Dio();
      dio.interceptors
          .add(LogInterceptor(responseBody: true, requestBody: true));
      var response = await dio.delete(url,
          options: Options(
              headers: headers, sendTimeout: 5000, receiveTimeout: 5000));
      resultResponse = fromJson<T>(response.data);
    } on DioError catch (e) {
      if (commonController.notConnected.value) {
        resultResponse = fromJson<T>(_errorConnection);
      } else {
        resultResponse = fromJson<T>((e.response?.statusCode ?? 500) >= 500
            ? _errorResponse
            : jsonDecode(e.response.toString()));
      }
    }

    return resultResponse;
  }

  /// Converter json to dart object
  static T fromJson<T>(dynamic json) {
    if (json is Iterable) {
      print('isIterable');
      return _fromJsonList<T>(json as List<dynamic>) as T;
    } else if (T == ContactList) {
      return ContactList.fromJson(json) as T;
    } else {
      throw Exception(
          'Unknown class, dont forget to add your model in BaseService.dart to parse the json');
    }
  }

  //from json list
  static List<T> _fromJsonList<T>(List? jsonList) {
    if (jsonList == null) {
      return <T>[];
    }

    List<T> output = [];

    for (Map<String, dynamic> json in jsonList) {
      output.add(fromJson<T>(json));
    }

    return output;
  }
}
