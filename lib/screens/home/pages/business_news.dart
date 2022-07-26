import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider1/constants/constants.dart';
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
                            // onTap: () => Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) =>
                            //           SpecificNews(snapshot.data![index].url)),
                            // ),
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
                                    child: Text(
                                      provider.values[index].title,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17.0),
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
                ),
              )
            : const Center(
                child: CircularProgressIndicator(),
              )
        : Center(
            child: Text(provider.error),
          );
  }
}
