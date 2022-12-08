import 'dart:io';

import 'package:flutter/material.dart';

import 'package:provider1/constants/constants.dart';
import 'package:provider1/models/all_news_model.dart';
import 'package:provider1/repository/all_news_repo.dart';

class AllNewsViewModel extends ChangeNotifier {
  int get indicatorIndex => _indicatorIndex;
  String get error => _error;
  List get images => _images;
  List get strings => _strings;
  List<Article> get values => _value;

  int _indicatorIndex = 0;
  String _error = '';
  bool isProgress = false;
  final List _images = [];
  final List _strings = [];
  late List<Article> _value;

  Future onGetAllNews() async {
    try {
      var response = await AllNewsRepository.getAllNewsResponse();
      if (response == null) {
        _error = 'Something went wrong';
        notifyListeners();
      } else {
        _value = response;

        for (int i = 0; i <= 5; i++) {
          _images.add(response[i].urlToImage ?? Constants.dummyImage);
          _strings.add(response[i].title);
          print(_images[i] ?? Constants.dummyImage);
          print(_strings[i] ?? "Not specified");
        }
        isProgress = false;
        notifyListeners();
      }
      return response;
    } on Exception catch (e) {
      if (e is SocketException) {
        _error = 'Please check your Internet connction';
        isProgress = false;
        notifyListeners();
      } else if (e is HttpException) {
        _error = 'Something went wrong while calling http';
        isProgress = false;
        notifyListeners();
      } else if (e is FormatException) {
        _error = 'Please check URL formate and try again';
        isProgress = false;
        notifyListeners();
      }
    }
  }

  void onSliderChange({required carouselIndex}) {
    _indicatorIndex = carouselIndex;
    notifyListeners();
  }
}
