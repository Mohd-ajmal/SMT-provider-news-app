import 'package:flutter/material.dart';
import 'package:provider1/models/all_news_model.dart';

@immutable
class SpecificNews extends StatelessWidget {
  final Article value;

  const SpecificNews(this.value, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          centerTitle: false,
          elevation: 0,
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.share)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.bookmark))
          ],
          leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              )),
          backgroundColor: Colors.transparent,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 300.0,
                width: double.infinity,
                child: Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: double.infinity,
                      child: Image.network(
                        value.urlToImage!,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(color: Colors.black26),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Published At : ${value.publishedAt.day}/${value.publishedAt.month}/${value.publishedAt.year}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.chat),
                                color: Colors.white,
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.visibility),
                                color: Colors.white,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        value.title,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 30),
                      const Text(
                        "Description",
                        style: TextStyle(color: Colors.yellow),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        value.description,
                        style: const TextStyle(fontSize: 15),
                      ),
                      const SizedBox(height: 30),
                      const Text(
                        "Content",
                        style: TextStyle(color: Colors.yellow),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        value.content,
                        style: const TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
