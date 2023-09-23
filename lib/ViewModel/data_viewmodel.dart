import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model/model.dart';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import 'dart:convert';


class DataViewModel extends ChangeNotifier {
  List<NewsData> newsDataList = []; // Change to a list
  bool isLoading = true;

  Future getData() async {
    try {
      var url =
          'https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline';

      var urlUri = Uri.parse(url);
      Response response = await http.get(urlUri);

      if (response.statusCode == 200) {
        final List<dynamic> dataList = json.decode(response.body);

        newsDataList.clear();

        for (var item in dataList) {
          newsDataList.add(NewsData.fromJson(item));
        }
      } else {
      }
    } catch (e) {
      // print(e.toString());
    }
    isLoading = false;
    notifyListeners();
  }
}
// Future getNewsData() async {
  //   try {
  //     notifyListeners();

  //     List result = await Repository().getNewsData();
  //     usersData.clear();
  //     usersData.addAll(result);

  //     notifyListeners();
  //   } catch (e) {
  //     //printDebug(e.toString());
  //   }
  // }