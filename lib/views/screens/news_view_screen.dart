import 'package:flutter/material.dart';
import 'package:news_x_test/models/news_model.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsViewScreen extends StatelessWidget {
  final DateTime date;
  final String imageUrl;
  final String title;
  final String description;
  final String author;
  final Id id;
  final String url;
  NewsViewScreen(
      {this.date,
      this.imageUrl,
      this.title,
      this.description,
      this.author,
      this.id,
      this.url});

  @override
  Widget build(BuildContext context) {
    Future<void> customLaunch(String url) async {
      if (!url.contains('http')) url = 'https://$url';
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        print('could not lunch $url');
      }
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('News Articles'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    'Date: $date',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey[800],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 220,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.red[400],
                    height: 1.2,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  description,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    color: Colors.grey[800],
                    height: 1.2,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Author: $author',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[800],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Center(
                  child: SizedBox(
                    height: 50,
                    width: 160,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red[400],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Original Post',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      onPressed: () {
                        customLaunch(url);
                        //_lunchUrl();
                      },
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  // _lunchUrl() async {
  //   if (await canLaunch(url)) {
  //     await launch(url);
  //   } else {
  //     throw 'Could not launch $url';
  //   }
  // }
}
