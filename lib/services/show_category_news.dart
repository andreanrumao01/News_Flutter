import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:newsapp1/models/show_category.dart';
import 'package:newsapp1/models/slider_model.dart';

class ShowCategoryNews {
  List<ShowCategoryNews> categories = [];

  Future<void> getCategoriesNews(String category) async {
  String url = "https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=82e72bdc1a40483c9b9aca0821d9a0de";
  var response = await http.get(Uri.parse(url));

  var jsonData = jsonDecode(response.body);

  if (jsonData['status'] == 'ok') {
    List<sliderModel> fetchedSliders = []; // Create a temporary list to hold fetched sliders
    jsonData["articles"].forEach((element) {
      if (element["urlToImage"] != null && element['description'] != null) {
        ShowCategoryModel categoryModel = ShowCategoryModel(
          title: element["title"],
          description: element["description"],
          url: element["url"],
          urlToImage: element["urlToImage"],
          content: element["content"],
          author: element["author"],
        );
        categories.add(categoryModel as ShowCategoryNews); // Add fetched slider to temporary list
      }
    });
  }
}
}
