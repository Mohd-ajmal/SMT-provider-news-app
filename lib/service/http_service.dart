import 'package:http/http.dart' as http;
import 'package:provider1/constants/constants.dart';

class HttpService {
  static Future<http.Response> getAllNews() async {
    http.Response response;
    var url = Uri.parse(Constants.url);
    try {
      response = await http.get(url);
    } catch (e) {
      rethrow;
    }
    return response;
  }

  // get business news
  static Future<http.Response> getBusinessNews() async {
    http.Response response;
    var url = Uri.parse(Constants.everyNews);
    try {
      response = await http.get(url);
    } catch (e) {
      rethrow;
    }
    return response;
  }

  // get technology news
  static Future<http.Response> getTechnologyNews() async {
    http.Response response;
    var url = Uri.parse(Constants.everyTechnologyNews);
    try {
      response = await http.get(url);
    } catch (e) {
      rethrow;
    }
    return response;
  }
}
