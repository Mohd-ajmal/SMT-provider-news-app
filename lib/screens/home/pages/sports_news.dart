import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider1/hooks/page_ui.dart';
import 'package:provider1/view_models/sports_news_view_model.dart';

class SportsNews extends StatefulWidget {
  const SportsNews({Key? key}) : super(key: key);

  @override
  State<SportsNews> createState() => _SportsNewsState();
}

class _SportsNewsState extends State<SportsNews> {
  @override
  void initState() {
    super.initState();
    Provider.of<SportsNewsViewModel>(context, listen: false).getSportsNews();
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SportsNewsViewModel>(context, listen: true);
    return PageUiHook(provider);
  }
}
