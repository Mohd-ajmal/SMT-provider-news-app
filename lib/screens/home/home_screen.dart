import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider1/screens/home/pages/all_news.dart';
import 'package:provider1/screens/home/pages/business_news.dart';
import 'package:provider1/screens/home/pages/entertainment_news.dart';
import 'package:provider1/screens/home/pages/sports_news.dart';
import 'package:provider1/screens/home/pages/technology_news.dart';
import 'package:provider1/view_models/all_news_view_model.dart';
import 'package:provider1/view_models/business_view_model.dart';
import 'package:provider1/view_models/entertainment_news_view_model.dart';
import 'package:provider1/view_models/sports_news_view_model.dart';
import 'package:provider1/view_models/technology_view_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'News tomorrow',
            style: TextStyle(color: Colors.yellow[800]), // FFFBC02D
          ),
          centerTitle: false,
          elevation: 0,
          bottom: TabBar(
            isScrollable: true,
            labelColor: Theme.of(context).tabBarTheme.labelColor,
            indicatorColor: Colors.yellow[700],
            tabs: const [
              Tab(
                text: "All Newses",
              ),
              Tab(
                text: "Businesses",
              ),
              Tab(
                text: "Technologies",
              ),
              Tab(
                text: "Sportses",
              ),
              Tab(
                text: "Entertainments",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ChangeNotifierProvider(
              create: (BuildContext context) => AllNewsViewModel(),
              child: const AllNews(),
            ),
            ChangeNotifierProvider(
              create: (BuildContext context) => BusinessViewModel(),
              child: const BusinessNews(),
            ),
            ChangeNotifierProvider(
              create: (BuildContext context) => TechnologyViewModel(),
              child: const TechnologyNews(),
            ),
            ChangeNotifierProvider(
              create: (BuildContext context) => SportsNewsViewModel(),
              child: const SportsNews(),
            ),
            ChangeNotifierProvider(
              create: (BuildContext context) => EntertainmentViewModel(),
              child: const EntertainmentNews(),
            ),
          ],
        ),
      ),
    );
  }
}
