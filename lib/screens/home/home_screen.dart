import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider1/screens/home/pages/all_news.dart';
import 'package:provider1/view_models/all_news_view_model.dart';

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
            'News Today',
            style: TextStyle(color: Colors.yellow[700]), // FFFBC02D
          ),
          centerTitle: false,
          elevation: 0,
          bottom: TabBar(
            isScrollable: true,
            labelColor: Theme.of(context).tabBarTheme.labelColor,
            indicatorColor: Colors.yellow[700],
            tabs: const [
              Tab(
                text: "All News",
              ),
              Tab(
                text: "Business",
              ),
              Tab(
                text: "Technology",
              ),
              Tab(
                text: "Sports",
              ),
              Tab(
                text: "Entertainment",
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
            const Text('data'),
            const Text('data'),
            const Text('data'),
            const Text('data'),
          ],
        ),
      ),
    );
  }
}
