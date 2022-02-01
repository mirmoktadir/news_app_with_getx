import 'dart:async';

import 'package:flutter/material.dart';
import 'package:news_x_test/controller/news_controller.dart';
import 'package:get/get.dart';
import 'package:news_x_test/views/widgets/news_card.dart';

class HomeScreen extends StatelessWidget {
  final NewsController newsController = Get.put(NewsController());
  @override
  Widget build(BuildContext context) {
    Future<bool> showExitPopup() async {
      return await (showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('Exit App'),
              content: Text('Do you want to exit an App?'),
              actions: [
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: Text('No'),
                ),
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  child: Text('Yes'),
                ),
              ],
            ),
          ) as FutureOr<bool>?) ??
          false;
    }

    return WillPopScope(
      onWillPop: showExitPopup,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('NewsX in GetX'),
          elevation: 6,
        ),
        body: RefreshIndicator(
          onRefresh: _onRefresh,
          child: Obx(() {
            return ListView.builder(
                itemCount: newsController.articles.length,
                itemBuilder: (context, index) {
                  var article = newsController.articles[index];
                  return NewsCard(
                    article: article,
                  );
                });
          }),
        ),
      ),
    );
  }

  Future<Null> _onRefresh() {
    Completer<Null> completer = new Completer<Null>();
     Timer(new Duration(seconds: 3), () {
      completer.complete();
    });
    return completer.future;
  }
}
