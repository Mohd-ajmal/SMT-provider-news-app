import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider1/models/all_news_model.dart';
import 'package:provider1/repository/technology_news_repo.dart';

class TechnologyViewModel extends ChangeNotifier {
  List<Article> get values => _businessNews;
  String get error => _error;
  bool get isProgress => _isProgress;

  List<Article> _businessNews = [];
  String _error = '';
  bool _isProgress = true;

  Future getTechnologyNews() async {
    try {
      var response = await TechnologyNewsRepository.getAllTechnologyNews();
      // print(response.toString());
      if (response == null) {
        _error = 'Something went wrong';
        notifyListeners();
      } else {
        _isProgress = false;
        _businessNews = response;
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
