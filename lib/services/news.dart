import 'dart:convert';
import 'package:news_flight/model/article.dart';
import 'package:http/http.dart' as http;

class News {
  List<ArticleModel> news = [];
  String countryCode = 'ph';

  Future<void> getNews() async {
    Uri url = Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=$countryCode&category=business&apiKey=780c7b6a7e924552a16df98fafd48718");

    var response = await http.get(url);

    Map jsonData = jsonDecode(response.body);

    if (jsonData['status'] == 'ok') {
      print("PASSSSED");
      jsonData['articles'].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          ArticleModel articleModel = ArticleModel(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            url: element['url'],
            urlToImage: element['urlToImage'],
            // publishedAt: element['publishedAt'],
            content: element['context'],
          );
          
          news.add(articleModel);
        }
      });
    }
  }
}
