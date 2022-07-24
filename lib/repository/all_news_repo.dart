import 'dart:io';

import 'package:provider1/models/all_news_model.dart';
import 'package:provider1/service/http_service.dart';

class AllNewsRepository {
  static Future<List<Article>?> getAllNewsResponse() async {
    try {
      var response = await HttpService.getAllNews();
      if (response.statusCode == 200) {
        var result = newsApiFromJson(response.body);
        return result.articles;
      } else {
        return null;
      }
    } on SocketException {
      rethrow;
    } on FormatException {
      rethrow;
    } on HttpException {
      rethrow;
    }
  }
}