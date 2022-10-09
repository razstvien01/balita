import 'dart:collection';
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:news_flight/constant.dart';
import 'package:news_flight/model/article.dart';
import 'package:http/http.dart' as http;
import 'package:news_flight/pages/bookmark/bookmark.dart';

class News {
  List<ArticleModel> news = [];
  String countryCode = 'ph';
  

  Future<void> getNews() async {
    Uri url = Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=${countryCode}&category=general&apiKey=780c7b6a7e924552a16df98fafd48718");

    var response = await http.get(url);

    Map jsonData = jsonDecode(response.body);

    final articles =
        FirebaseFirestore.instance.collection('articles').doc('categories');

    final user =
        FirebaseFirestore.instance.collection('users').doc('categories');

    Map<String, dynamic> validNews = {};

    int count = 0;

    if (jsonData['status'] == 'ok') {
      jsonData['articles'].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          validNews.forEach((key, value) {});

          if (!validNews.containsKey(element['title'])) {
            validNews[element['title']] = {
              'author': element['author'],
              'description': element['description'],
              'url': element['url'],
              'urlToImage': element['urlToImage'],
              // publishedAt: element['publishedAt'],
              'content': element['context'],
              'bookmark': false,
            };
          }

          // ArticleModel articleModel = ArticleModel(
          //   title: element['title'],
          //   author: element['author'],
          //   description: element['description'],
          //   url: element['url'],
          //   urlToImage: element['urlToImage'],
          //   // publishedAt: element['publishedAt'],
          //   content: element['context'],
          //   bookmark: false,
          // );
          ++count;
          // news.add(articleModel);
        }
      });
    }

    validNews.forEach((key, value) {
      ArticleModel articleModel = ArticleModel(
        title: key,
        author: value['author'],
        description: value['description'],
        url: value['url'],
        urlToImage: value['urlToImage'],
        // publishedAt: element['publishedAt'],
        content: value['context'],
        bookmark: false,
      );

      news.add(articleModel);
    });

    await articles.set({
      'general': validNews,
      'total': count,
    });
  }
}
