import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_x_test/models/news_model.dart';
import 'package:news_x_test/views/screens/news_view_screen.dart';

class NewsCard extends StatelessWidget {
  final Article article;
  NewsCard({this.article});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: GestureDetector(
        onTap: () async {
          await Get.to(NewsViewScreen(
            date: article.publishedAt,
            imageUrl: article.urlToImage,
            title: article.title,
            description: article.description,
            author: article.author,
            id: article.source.id,
            url: article.url,
          ));
        },
        child: Container(
          color: Colors.grey[100],
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 130,
                width: 110,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(article.urlToImage),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Flexible(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 130,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        article.title,
                        maxLines: 3,
                        style: TextStyle(
                          color: Colors.red[400],
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Expanded(
                        child: Text(
                          article.description,
                          maxLines: 2,
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.grey[800],
                            fontWeight: FontWeight.w500,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
