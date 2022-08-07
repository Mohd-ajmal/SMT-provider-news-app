import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:provider1/hooks/page_ui.dart';
import 'package:provider1/view_models/technology_view_model.dart';

class TechnologyNews extends StatefulWidget {
  const TechnologyNews({Key? key}) : super(key: key);

  @override
  State<TechnologyNews> createState() => _TechnologyNewsState();
}

class _TechnologyNewsState extends State<TechnologyNews> {
  @override
  void initState() {
    super.initState();
    Provider.of<TechnologyViewModel>(context, listen: false)
        .getTechnologyNews();
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<TechnologyViewModel>(context, listen: true);
    return PageUiHook(provider);
  }
}
