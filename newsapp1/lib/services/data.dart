import 'package:newsapp1/models/category_model.dart';

List<CategoryModel> getCategories() {
  List<CategoryModel> categories = [];

  CategoryModel categoryModel = new CategoryModel();

  // Business category
  categoryModel.categoryName = "Business";
  categoryModel.image = "images/business.jpg";
  categories.add(categoryModel);
  categoryModel = new CategoryModel(); 


  // Entertainment category
  categoryModel.categoryName = "Entertainment";
  categoryModel.image = "images/entertainment.jpg";
  categories.add(categoryModel);
  categoryModel = new CategoryModel(); 


  // General category
  categoryModel.categoryName = "General";
  categoryModel.image = "images/general.jpeg";
  categories.add(categoryModel);
  categoryModel = new CategoryModel(); 


  // Health category
  categoryModel.categoryName = "Health";
  categoryModel.image = "images/health.jpg";
  categories.add(categoryModel);
  categoryModel = new CategoryModel(); 

  // Science category
  categoryModel.categoryName = "Science";
  categoryModel.image = "images/science.jpeg";
  categories.add(categoryModel);
  categoryModel = new CategoryModel(); 

  // Sports category
  categoryModel.categoryName = "Sports";
  categoryModel.image = "images/sports.jpg";
  categories.add(categoryModel);
  categoryModel = new CategoryModel(); 


  return categories;
}

class CategoryModel {
  late String _image;
  late String _categoryName;

  String get categoryName => _categoryName;

  set categoryName(String categoryName) {
    _categoryName = categoryName;
  }

  String get image => _image;

  set image(String image) {
    _image = image;
  }
}
