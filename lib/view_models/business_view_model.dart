import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider1/models/all_news_model.dart';
import 'package:provider1/repository/business_news_repo.dart';

class BusinessViewModel extends ChangeNotifier {
  List<Article> get values => _businessNews;
  String get error => _error;
  bool get isProgress => _isProgress;

  List<Article> _businessNews = [];
  String _error = '';
  bool _isProgress = true;

  Future getBusinessNews() async {
    try {
      var response = await BusinessNewsRepo.getBusinessNews();
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
      e is SocketException
          ? _error = 'Please check your internet connection'
          : e is HttpException
              ? _error = 'Error occured while http call'
              : _error = 'Something went wrong';
      notifyListeners();
    }
  }
}
