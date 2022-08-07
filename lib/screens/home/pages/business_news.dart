import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:provider1/hooks/page_ui.dart';
import 'package:provider1/view_models/business_view_model.dart';

class BusinessNews extends StatefulWidget {
  const BusinessNews({Key? key}) : super(key: key);

  @override
  State<BusinessNews> createState() => _BusinessNewsState();
}

class _BusinessNewsState extends State<BusinessNews> {
  @override
  void initState() {
    super.initState();
    Provider.of<BusinessViewModel>(context, listen: false).getBusinessNews();
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<BusinessViewModel>(context, listen: true);
    return PageUiHook(provider);
  }
}
