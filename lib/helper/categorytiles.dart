

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/views/categorypage.dart';

class CategoryTiles extends StatelessWidget {
  final String myCategoryName, imageUrl;
  CategoryTiles({required this.myCategoryName, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => CategoryFragment(category: myCategoryName,),
        ));
      },
      child: Container(
        margin: const EdgeInsets.only(right: 10.0),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                width: 170,
                height: 90,
                fit: BoxFit.cover,
              ),
            ),
            Container(
                alignment: Alignment.center,
                width: 170,
                height: 90,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: Colors.black38,
                ),
                child: Text(
                  myCategoryName,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      fontFamily: 'Poppins'),
                )),
          ],
        ),
      ),
    );
  }
}
