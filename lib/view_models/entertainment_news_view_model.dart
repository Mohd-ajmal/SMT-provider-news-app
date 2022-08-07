import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider1/models/all_news_model.dart';
import 'package:provider1/repository/entertainment_news_repo.dart';

class EntertainmentViewModel extends ChangeNotifier {
  List<Article> get values => _entertainmentNews;
  String get error => _error;
  bool get isProgress => _isProgress;

  List<Article> _entertainmentNews = [];
  String _error = '';
  bool _isProgress = true;

  Future getEntertainmentNews() async {
    try {
      var response = await EntertainmentNewsRepo.getEntertainmentNews();
      // print(response.toString());
      if (response == null) {
        _error = 'Something went wrong';
        notifyListeners();
      } else {
        _isProgress = false;
        _entertainmentNews = response;

        notifyListeners();
      }
    } catch (e) {
      if (e is SocketException) {
        _error = 'Please check your Internet connction';
        _isProgress = false;
        notifyListeners();
      } else if (e is HttpException) {
        _error = 'Something went wrong while calling http';
        _isProgress = false;
        notifyListeners();
      } else if (e is FormatException) {
        _error = 'Please check URL formate and try again';
        _isProgress = false;
        notifyListeners();
      }
    }
  }
}
