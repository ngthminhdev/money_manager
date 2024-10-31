import 'package:money_manager/services/http_services.dart';

abstract class BaseService {
  String endpoint = '';
  late HttpService http;
  
  BaseService() {
    http = HttpService();
  }
}