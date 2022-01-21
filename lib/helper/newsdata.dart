import 'dart:convert';

import 'package:news_app/constants.dart';
import 'package:news_app/models/newsmodel.dart';
import 'package:http/http.dart' as http;


class News {
  String baseUrl = 'https://newsapi.org/v2/everything?q=bitcoin&apiKey=14bb71d08e7943ddaa08c4cd725cca99';//'https://newsapi.org/v2/top-headlines/sources?apiKey=14bb71d08e7943ddaa08c4cd725cca99';

  List<ArticleModel> datatobesavedin = List<ArticleModel>.empty(growable: true);


  Future<void> getNews() async{
    var response = await http.get(baseUrl);
    var jsonData = jsonDecode(response.body);

    if(jsonData['status'] == 'ok' && jsonData !=null){
      jsonData['articles'].forEach((element) {
        if(element['urlToImage']!=null && element['description']!=null){
          //initialize our model class
          ArticleModel articleModel = ArticleModel(
            title: element['title'],
            urlToImage: element['urlToImage'],
            description: element['description'],
            url: element['url'],
            author: element['author'],
            publishedAt: element['publishedAt'],
            );

            datatobesavedin.add(articleModel);
            
        }
        

      });
    }else {
      //print("json data null aayo");
    }
    
  }

}

//fetching by category
class CategoryNews {
  //String baseUrl = 'https://newsapi.org/v2/top-headlines/sources?category=businessapiKey=$myApiKey';

  List<ArticleModel> catatobesavedin = [];


  Future<void> getNewsByCategory(String category) async{
    //https://newsapi.org/v2/top-headlines?category=business&apiKey=14bb71d08e7943ddaa08c4cd725cca99
    String baseUrl = 'https://newsapi.org/v2/top-headlines?category=${category}&apiKey=14bb71d08e7943ddaa08c4cd725cca99';
    var response = await http.get(baseUrl);
    var jsonData = jsonDecode(response.body);

    if(jsonData['status'] == 'ok'){
      
      jsonData['articles'].forEach((element) {
        if(element['urlToImage']!=null && element['description']!=null){
          //initialize our model class
          ArticleModel articleModel = ArticleModel(
            title: element['title'],
            urlToImage: element['urlToImage'],
            description: element['description'],
            url: element['url'],
            author: element['author'],
            publishedAt: element['publishedAt'],
            );

            catatobesavedin.add(articleModel);

        } 

      });
    }else {
      //print("status not ok");
    }
  }
}


