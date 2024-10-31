
import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:money_manager/services/local_storage_service.dart';

class HttpService {
  String host = '';
  String method = '';
  Map<String, dynamic> body = {};
  Map<String, String?> queries = {};
  List<String?> paths = ['api'];
  
  HttpService();

  HttpService withHost(String apiHost) {
    host = apiHost;
    return this;
  }

  HttpService withVersion(String version) {
    paths.add(version);
    return this;
  }

  HttpService withPath(String? path) {
    paths.add(path);
    return this;
  }

  HttpService makeGet() {
    method = 'GET';
    return this;
  }

  HttpService makePost() {
    method = 'POST';
    return this;
  }

  HttpService makePut() {
    method = 'PUT';
    return this;
  }

  HttpService makeDelete() {
    method = 'DELETE';
    return this;
  }

  HttpService withBody(Map<String, dynamic> data) {
    body.addAll(data);
    return this;
  }

  HttpService withQueries(Map<String, String?> data) {
    queries.addAll(data);
    return this;
  }

  getHeader() async {
    String? jwt = await LocalStorageService().getString('JWT');
    Map<String, String> header = {
      'content-type': 'application/json',
    };

    if (jwt != null) {
      header['Authorization'] = "Bearer $jwt";
    }

    return header;
  }

  Future<Response> execute({int? timeout = 240}) async {
    var httpClient = http.Client();
    Map<String, String> headers = await getHeader();
    Response responseObject = Response();

    Future<http.Response> exec;

    switch (method) {
      case 'GET':
        exec = httpClient.get(Uri.http(host, paths.join('/'), queries), headers: headers);
        break;
      case 'POST':
        exec = httpClient.post(Uri.http(host, paths.join('/'), queries), body: json.encode(body), headers: headers);
        break;
      case 'PUT':
        exec = httpClient.put(Uri.http(host, paths.join('/')), body: json.encode(body), headers: headers);
        break;
      case 'DELETE':
        exec = httpClient.delete(Uri.http(host, paths.join('/')), headers: headers);
        break;
      default:
        throw 'Method invalid';
    }

    DateTime startRequestDate = DateTime.now();
    return exec.timeout(Duration(seconds: timeout!)).then((response) async {

      httpClient.close();

      DateTime endRequestDate = DateTime.now();
      int duration = endRequestDate.difference(startRequestDate).inMilliseconds;
      log(json.encode(body),
          name: "${DateTime.now().toIso8601String()} ${duration.toString()}ms $method ${Uri.http('', paths.join('/'), queries)}");

      responseObject = Response.fromJson(response.body);

      if ([503, 413, 500].contains(response.statusCode)) {
        responseObject.message = 'Lỗi không xác định';
        throw responseObject;
      }

      if (response.statusCode == 401) {
        responseObject.isForceLogin = true;
        responseObject.message = 'Phiên đăng nhập hết hạn';
        await LocalStorageService().remove('JWT');
        await LocalStorageService().remove('isSaveLoggedIn');

        throw responseObject;
      }
      if (response.statusCode == 204) {
        return responseObject;
      }

      if ([200, 201, 202, 203].contains(response.statusCode)) {
        return responseObject;
      }

      throw responseObject;
    }).catchError((onError) async {
      throw responseObject;
    });
  }
}

class Response {
  int? statusCode = 400;
  int? total;
  int? skip;
  String? message;
  dynamic data;
  bool? isForceLogin = false;

  Response({
    this.statusCode,
    this.isForceLogin,
    this.total,
    this.skip,
    this.message,
    this.data,
  });

  factory Response.fromJson(String jsonString) {
    Map<String, dynamic> json = jsonDecode(jsonString);
    return Response(
      statusCode: json['status'], 
      isForceLogin: json['is_force_login'] ?? false,
      total: json['total'] ?? 0,
      skip: json['skip'] ?? 0,
      message: json['message'],
      data: json['data'],
      );
  }
}