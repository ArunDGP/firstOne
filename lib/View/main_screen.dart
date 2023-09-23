import 'package:flutter/material.dart';
import 'package:flutter_application_1/ViewModel/data_viewmodel.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({
    super.key,
  });

  @override
  State<MainScreen> createState() => _MainScreenState();
}

// Future gettingData() async {
//   await DataViewModel().getNewsData();
// }

class _MainScreenState extends State<MainScreen> {
  
  DataViewModel dataVM = DataViewModel();
  @override
  void initState() {
    Provider.of<DataViewModel>(context, listen: false).getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    
    bool showFullDescription = false;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: const Icon(Icons.menu),
          title: const Text(
            'MWS',
            style: TextStyle(color: Colors.white),
          ),
          actions: const [Icon(Icons.search)],
        ),
        body: Consumer<DataViewModel>(builder: (context, dataVM, child) {
          if (dataVM.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            // Render your list of data here using dataVM.newsDataList
            return ListView.builder(
                itemCount: dataVM.newsDataList.length,
                itemBuilder: (BuildContext context, int index) {
                  final newsData = dataVM.newsDataList[index];

                  return Padding(
                    padding: const EdgeInsets.all(10),
                    child: Stack(children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 600,
                        decoration: const BoxDecoration(boxShadow: [
                          BoxShadow(
                            color: Colors.black,
                            offset: Offset(
                              2.0,
                              2.0,
                            ),
                            blurRadius: 8.0,
                            spreadRadius: 1.0,
                          ), //BoxShadow
                          BoxShadow(
                            color: Colors.white,
                            offset: Offset(0.0, 0.0),
                            blurRadius: 0.0,
                            spreadRadius: 0.0,
                          ),
                        ]),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 408,
                          ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 70),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    newsData.brand.toString(),
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    newsData.name,
                                    style: const TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    newsData.price,
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  RatingBar.builder(
                                    itemSize: 20,
                                    initialRating: 3,
                                    minRating: 1,
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    itemCount: 5,
                                    itemPadding: const EdgeInsets.symmetric(
                                        horizontal: 4.0),
                                    itemBuilder: (context, _) => const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    onRatingUpdate: (double value) {},
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Center(
                                    child: Row(
                                      children: [
                                        const Text(
                                          'Maybelline Face Studio...',
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15),
                                        ),
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              showFullDescription =
                                                  !showFullDescription;
                                            });
                                          },
                                          child: Container(
                                            height: 20,
                                            width: 50,
                                            decoration: const BoxDecoration(
                                              color: Colors.grey,
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(10),
                                              ),
                                            ),
                                            child: const Center(
                                              child: Text(
                                                'More',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 400,
                        color: Colors.black,
                        child: Image.network(newsData.imageLink),
                      )
                    ]),
                  );
                });
          }
        }));
  }
}
