import 'package:flutter/material.dart';
import 'package:provider1/models/all_news_model.dart';

class SpecificNews extends StatelessWidget {
  Article value;
  SpecificNews(this.value, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          centerTitle: false,
          elevation: 0,
          leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.grey,
              )),
          backgroundColor: Colors.transparent,
        ),
        body: Container(
          child: Image.network(value.urlToImage!),
        ));
  }
}
