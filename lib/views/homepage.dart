import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/constants.dart';
import 'package:news_app/helper/categorydata.dart';
import 'package:news_app/helper/categorytiles.dart';
import 'package:news_app/helper/newsdata.dart';
import 'package:news_app/helper/newstemplate.dart';
import 'package:news_app/models/categorymodel.dart';
import 'package:news_app/models/newsmodel.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //get our categoris list
  List<CategoryModel> categories = List<CategoryModel>.empty(growable: true);

  //get our newslist first
  List<ArticleModel> articles = List<ArticleModel>.empty(growable: true);
  int artLength = 0;
  bool _loading = true;

  getMyNews() async {
    News newsData = News();
    await newsData.getNews();
    
    setState(() {
      articles = List.from(newsData.datatobesavedin);
      artLength = articles.length;
      _loading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    categories = getCategories();
    getMyNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'Yonz  ',
              style: TextStyle(color: Colors.black),
            ),
            Text(
              'News',
              style: TextStyle(color: Colors.blueAccent),
            ),
          ],
        ),
      ),

      //category widgets
      body: _loading ? Center(
              child: CircularProgressIndicator(

              ),
            )
            : 
            SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              Container(
                height: 70.0,
                padding: const EdgeInsets.symmetric(
                  horizontal: 12.0,
                ),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    //here we have list of categories.
                    //print("length of category: ${categories.length}");
                    return CategoryTiles(
                      imageUrl: categories[index].imageUrl,
                      myCategoryName: categories[index].categoryName,
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                padding: const EdgeInsets.symmetric(
                  vertical: 12.0,
                ),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  itemCount: artLength,
                  itemBuilder: (context, index) {
                    //here we have list of categories.
                    //print("length of category: ${categories.length}");
                    
                    return NewsTemplate(
                      title: articles[index].title,
                      description: articles[index].description,
                      url: articles[index].url,
                      urlToImage: articles[index].urlToImage,
                      author: articles[index].author,
                      publishedAt: articles[index].publishedAt,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



