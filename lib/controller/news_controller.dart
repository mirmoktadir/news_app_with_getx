import 'package:get/get.dart';
import 'package:news_x_test/models/news_model.dart';
import 'package:news_x_test/services/api_services.dart';

class NewsController extends GetxController {
  var articles = <Article>[].obs;
  var isLoading = true.obs;
  @override
  void onInit() {
    super.onInit();
    fetchNews();
  }

  void fetchNews() async {
    try {
      var news = await ApiServices.fetchNews();
      if (news != null) {
        articles.value = news.articles;
      }
    } finally {
      isLoading(false);
    }
  }
}
