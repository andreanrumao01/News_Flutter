import 'package:flutter/material.dart';
import 'package:newsapp1/models/show_category.dart';
import 'package:newsapp1/services/show_category_news.dart';

class CategoryNews extends StatefulWidget {
  final String name;
  CategoryNews({required this.name});
  @override
  State<CategoryNews> createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {
  List<ShowCategoryModel> categories = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    getNews();
  }

  getNews() async {
    ShowCategoryNews showCategoryNews = ShowCategoryNews();
    await showCategoryNews.getCategoriesNews(widget.name.toLowerCase());
    setState(() {
      categories = showCategoryNews.categories.cast<ShowCategoryModel>();
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.name,
          style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: _loading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return ShowCategory(
                  image: categories[index].urlToImage,
                  desc: categories[index].description,
                  title: categories[index].title,
                );
              },
            ),
    );
  }
}

class ShowCategory extends StatelessWidget {
  final String? image;
  final String? desc;
  final String? title;

  ShowCategory({this.image, this.desc, this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(image ?? ''),
          SizedBox(height: 8),
          Text(title ?? '', style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 4),
          Text(desc ?? ''),
        ],
      ),
    );
  }
}
