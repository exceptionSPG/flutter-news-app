

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class NewsTemplate extends StatelessWidget {
  String title, description, url, urlToImage,author,publishedAt;
  // ignore: use_key_in_widget_constructors
  NewsTemplate(
      {required this.title,
      required this.description,
      required this.url,
      required this.urlToImage,
      required this.author,
      required this.publishedAt});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      child: Column(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: CachedNetworkImage(
                imageUrl: urlToImage,
                width: 380,
                height: 200,
                fit: BoxFit.cover,
              ),),
              const SizedBox(height: 8,),
              Text(title,style: const TextStyle(fontFamily: "Poppins",fontSize: 18,fontWeight: FontWeight.bold),),
              const SizedBox(height: 8,),
               Text(description,style: const TextStyle(fontFamily: "Sans-serif",fontSize: 14,fontWeight: FontWeight.w500, color: Colors.grey),),
              const SizedBox(height: 8,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  
                  //Text(author),
                  Text(publishedAt),
                ],
              )


        ],
      ),
    );
  }
}
