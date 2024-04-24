import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:newsapp1/models/slider_model.dart';

class Slider {
  List<sliderModel> sliders = [];

  Future<void> getSlider() async {
  String url = "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=82e72bdc1a40483c9b9aca0821d9a0de";
  var response = await http.get(Uri.parse(url));

  var jsonData = jsonDecode(response.body);

  if (jsonData['status'] == 'ok') {
    List<sliderModel> fetchedSliders = []; // Create a temporary list to hold fetched sliders
    jsonData["articles"].forEach((element) {
      if (element["urlToImage"] != null && element['description'] != null) {
        sliderModel slidermodel = sliderModel(
          title: element["title"],
          description: element["description"],
          url: element["url"],
          urlToImage: element["urlToImage"],
          content: element["content"],
          author: element["author"],
        );
        fetchedSliders.add(slidermodel); // Add fetched slider to temporary list
      }
    });
    sliders = fetchedSliders; // Assign fetched sliders to the sliders list
  }
}

}
