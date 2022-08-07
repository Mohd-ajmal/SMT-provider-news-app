import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider1/hooks/page_ui.dart';
import 'package:provider1/view_models/entertainment_news_view_model.dart';

class EntertainmentNews extends StatefulWidget {
  const EntertainmentNews({Key? key}) : super(key: key);

  @override
  State<EntertainmentNews> createState() => _EntertainmentNewsState();
}

class _EntertainmentNewsState extends State<EntertainmentNews> {
  @override
  void initState() {
    super.initState();
    Provider.of<EntertainmentViewModel>(context, listen: false)
        .getEntertainmentNews();
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<EntertainmentViewModel>(context, listen: true);
    return PageUiHook(provider);
  }
}
