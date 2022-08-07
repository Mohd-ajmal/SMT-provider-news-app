import 'package:flutter/material.dart';
import 'package:provider1/constants/constants.dart';
import 'package:provider1/hooks/shimmer_effect.dart';
import 'package:provider1/screens/specific_news/specific_news.dart';

@immutable
class PageUiHook extends StatelessWidget {
  final dynamic provider;
  const PageUiHook(this.provider, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return provider.isProgress == false
        ? provider.error.isEmpty
            ? Container(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(0.0),
                        child: ListView.builder(itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      SpecificNews(provider.values[index])),
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
                                        provider.values[index].urlToImage ??
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
                                          provider.values[index].title,
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
                                              'Published At : ${provider.values[index].publishedAt.day}/${provider.values[index].publishedAt.month}/${provider.values[index].publishedAt.year}',
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
                    )
                  ],
                ),
              )
            : Center(
                child: Text(provider.error),
              )
        : ListView.builder(
            itemBuilder: (context, index) {
              return ListTile(
                leading: ShimmerEffect.circular(
                  width: 64,
                  height: 64,
                  shapeBorder: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                title: Align(
                  alignment: Alignment.centerLeft,
                  child: ShimmerEffect.rectangle(
                    height: 16,
                    width: MediaQuery.of(context).size.width * 0.3,
                  ),
                ),
                subtitle: const ShimmerEffect.rectangle(height: 16),
              );
            },
            itemCount: 15,
          );
  }
}
