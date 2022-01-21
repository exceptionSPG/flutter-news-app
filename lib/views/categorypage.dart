import 'package:flutter/material.dart';
import 'package:news_app/helper/categorytiles.dart';
import 'package:news_app/helper/newsdata.dart';
import 'package:news_app/helper/newstemplate.dart';
import 'package:news_app/models/newsmodel.dart';

class CategoryFragment extends StatefulWidget {
  String category;
  CategoryFragment({required this.category});

  @override
  _CategoryFragmentState createState() => _CategoryFragmentState();
}

class _CategoryFragmentState extends State<CategoryFragment> {
  //list of articles.
  List<ArticleModel> cArticles = List<ArticleModel>.empty(growable: true);
  bool _loading = true;

  getCategoryNews() async {
    CategoryNews newsData = CategoryNews();
    await newsData.getNewsByCategory(widget.category.toLowerCase());
    cArticles = List.from(newsData.catatobesavedin);
    setState(() {
      
      _loading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getCategoryNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "${widget.category}  ",
              style: const TextStyle(color: Colors.blueAccent),
            ),
          ],
        ),
      ),
      body: _loading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Container(
                child: ListView.builder(
                  physics: const ClampingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: cArticles.length,
                  itemBuilder: (context, index) {
                    //here we have list of categories.
              String ur = cArticles[index].urlToImage;

              bool startsWit = ur.startsWith("http:");
              if (ur.startsWith("http:") || ur.startsWith("https:")) {
                ur = ur;
              } else {
                ur = "http:" + ur;
              }
              return NewsTemplate(
                title: cArticles[index].title,
                description: cArticles[index].description,
                url: cArticles[index].url,
                urlToImage: ur,
                author: cArticles[index].author,
                publishedAt: cArticles[index].publishedAt,
              );
            },
          ),
        ),
      ),
    );
  }
}
