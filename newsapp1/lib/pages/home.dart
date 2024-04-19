// ignore_for_file: unused_import, unnecessary_import, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, avoid_unnecessary_containers, prefer_const_constructors

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:newsapp1/models/category_model.dart';
import 'package:newsapp1/models/slider_model.dart';
import 'package:newsapp1/services/data.dart';
import 'package:newsapp1/services/slider_data.dart';

class Home extends StatefulWidget {
  const Home({Key? key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categories = [];
  List<sliderModel> sliders=[];

  @override
  void initState() {
    categories = getCategories();
    sliders= getSliders();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var Sliders;
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Flutter"),
            Text(
              "News",
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(left: 10.0),
              height: 70,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return CategoryTile(
                      image: categories[index].image,
                      categoryName: categories[index].categoryName,
                    );
                  },
              ),
            ),
            CarouselSlider.builder(itemCount: Sliders.length, itemBuilder: (context, index, realIndex){
              String? res= sliders[index].image;
              String? res1= sliders[index].name;
              return buildImage(res!, index, res1!);
            }, options: CarouselOptions(height: 200, viewportFraction: 1,enlargeCenterPage: true, enlargeStrategy: CenterPageEnlargeStrategy.height)),
          ],
        ),
      ),
    );
  }
    Widget buildImage(String image, int index, String name)=>Container(
    child: Image.asset(image, fit: BoxFit.cover, width: MediaQuery.of(context).size.width,) , 
  );
}




class CategoryTile extends StatelessWidget {
  final String image;
  final String categoryName;

  CategoryTile({ required this.categoryName,  required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 16),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Image.asset(
              image,
              width: 120,
              height: 70,
              fit: BoxFit.cover,
            ),
          ), 
          Container(
              width: 120,
              height: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6), 
                color: Colors.black38,),
            
            child: Center(
                child: Text(
              categoryName, 
              style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold)
            ),)
          )
        ],
      ),
    );
  }
}
