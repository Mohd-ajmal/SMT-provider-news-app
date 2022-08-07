import 'dart:async';
import 'dart:io';

import 'package:provider1/models/all_news_model.dart';
import 'package:provider1/service/http_service.dart';

class EntertainmentNewsRepo {
  static Future<List<Article>?> getEntertainmentNews() async {
    try {
      var response = await HttpService.getEntertainmentNews();

      if (response.statusCode == 200) {
        var result = newsApiFromJson(response.body);
        return result.articles;
      } else {
        return null;
      }
    } on SocketException {
      rethrow;
    } on HttpException {
      rethrow;
    } on FormatException {
      rethrow;
    } on TimeoutException {
      rethrow;
    }
  }
}
