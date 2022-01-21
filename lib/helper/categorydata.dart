
// api_key = 14bb71d08e7943ddaa08c4cd725cca99
// ignore_for_file: deprecated_member_use

import 'package:news_app/constants.dart';
import 'package:news_app/models/categorymodel.dart';


List<CategoryModel> getCategories(){
  //news list
  List<CategoryModel> categories = List<CategoryModel>.empty(growable: true); //to create empty list of fixed size 0, and to make it growable true, for variable length
  
  for(int i=0;i<categoryNames.length;i++){
    CategoryModel categor = CategoryModel(categoryName: categoryNames[i],imageUrl: imageUrls[i]);
    // categor.categoryName = categoryNames[i];
    // categor.imageUrl = imageUrls[i];
    categories.add(categor);
  }

  return categories;

  // CategoryModel category = CategoryModel();
  // category.categoryName = "Entertainment";
  // category.imageUrl = 'https://images.unsplash.com/photo-1522869635100-9f4c5e86aa37?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80';
  // categories.add(category);


  // category = CategoryModel();
  // category.categoryName = "Business";
  // category.imageUrl = "https://images.unsplash.com/39/lIZrwvbeRuuzqOoWJUEn_Photoaday_CSD%20(1%20of%201)-5.jpg?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80";
  // categories.add(category);


  // category = new CategoryModel();
  // category.categoryName = "Sports";
  // category.imageUrl =  "https://images.unsplash.com/photo-1495563923587-bdc4282494d0?ixlib=rb-1.2.1&auto=format&fit=crop&w=1500&q=80";
  // categories.add(category);


  // category = new CategoryModel();
  // category.categoryName = "General";
  // category.imageUrl = 'https://images.unsplash.com/photo-1495020689067-958852a7765e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60';
  // categories.add(category);


  // category = new CategoryModel();
  // category.categoryName = "Health";
  // category.imageUrl = "https://images.unsplash.com/photo-1494390248081-4e521a5940db?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1595&q=80";
  // categories.add(category);


  // category = new CategoryModel();
  // category.categoryName = "Science";
  // category.imageUrl =  "https://images.unsplash.com/photo-1554475901-4538ddfbccc2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1504&q=80";
  // categories.add(category);


}

