import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';
import 'package:provider1/constants/constants.dart';
import 'package:provider1/screens/specific_news/specific_news.dart';
import 'package:provider1/view_models/all_news_view_model.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class AllNews extends StatefulWidget {
  const AllNews({Key? key}) : super(key: key);

  @override
  State<AllNews> createState() => _AllNewsState();
}

class _AllNewsState extends State<AllNews> {
  @override
  void initState() {
    super.initState();
    Provider.of<AllNewsViewModel>(context, listen: false).onGetAllNews();
  }

  @override
  Widget build(BuildContext context) {
    final response = Provider.of<AllNewsViewModel>(context);
    return response.isProgress == false
        ? response.error.isEmpty
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  Column(
                    children: [
                      CarouselSlider(
                        items: Provider.of<AllNewsViewModel>(context)
                            .images
                            .map(
                              (e) => ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Stack(
                                  alignment: Alignment.bottomLeft,
                                  fit: StackFit.expand,
                                  children: [
                                    Image.network(
                                      e,
                                      fit: BoxFit.cover,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(stops: const [
                                          0.3,
                                          0.9
                                        ], colors: [
                                          Colors.black.withOpacity(0.8),
                                          Colors.black.withOpacity(0.3),
                                        ], begin: Alignment.bottomRight),
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.fromLTRB(
                                          10.0, 0, 0, 10.0),
                                      alignment: Alignment.bottomLeft,
                                      child: Text(
                                        response.strings[
                                            Provider.of<AllNewsViewModel>(
                                                    context)
                                                .indicatorIndex],
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                            .toList(),
                        options: CarouselOptions(
                            initialPage: 0,
                            enlargeCenterPage: true,
                            enableInfiniteScroll: false,
                            autoPlay: true,
                            aspectRatio: 3 / 1.4,
                            onPageChanged: (index, reason) {
                              response.onSliderChange(carouselIndex: index);
                            }),
                      ),
                      const SizedBox(height: 20.0),
                      AnimatedSmoothIndicator(
                        activeIndex: response.indicatorIndex,
                        count: 11,
                        effect: const ScrollingDotsEffect(
                          dotHeight: 8.0,
                          dotWidth: 8.0,
                          activeDotColor: Color(0xFFFBC02D),
                          dotColor: Colors.grey,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text(
                      "Latest News",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(0.0),
                      child: ListView.builder(itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    SpecificNews(response.values[index])),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: SizedBox(
                                    height: 80.0,
                                    width: 80.0,
                                    child: Image.network(
                                      response.values[index].urlToImage ??
                                          Constants.dummyImage,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 15.0),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        response.values[index].title,
                                        maxLines: 2,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17.0),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Published At : ${response.values[index].publishedAt.day}/${response.values[index].publishedAt.month}/${response.values[index].publishedAt.year}',
                                            style: TextStyle(
                                                color: Colors.yellow[700],
                                                fontSize: 12.0),
                                          ),
                                          IconButton(
                                              onPressed: () {},
                                              icon: const Icon(
                                                Icons.bookmark_add_outlined,
                                                color: Colors.grey,
                                              ))
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              )
            : const Center(
                child: CircularProgressIndicator(color: Colors.yellow),
              )
        : Center(child: Text(response.error));
  }
}
