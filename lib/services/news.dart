import 'dart:collection';
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:news_flight/model/article.dart';
import 'package:http/http.dart' as http;

class News {
  List<ArticleModel> news = [];
  String countryCode = 'ph';

  Future<void> getNews() async {
    Uri url = Uri.parse("https://newsapi.org/v2/top-headlines?country=${countryCode}&category=general&apiKey=780c7b6a7e924552a16df98fafd48718");

    var response = await http.get(url);

    Map jsonData = jsonDecode(response.body);

    if (jsonData['status'] == 'ok') {
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
            bookmark: false,
          );
          
          news.add(articleModel);
        }
      });
    }
  }

  

  Future<void> getNews1() async {
    Uri url = Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=${countryCode}&category=general&apiKey=780c7b6a7e924552a16df98fafd48718");

    var response = await http.get(url);

    Map jsonData = jsonDecode(response.body);

    Map<String, dynamic> validNews = {};

    final articles = FirebaseFirestore.instance
        .collection('articles')
        .doc('categories')
        .get()
        .then((value) => {
              value.data()?.forEach((key, value) {
                validNews.forEach((key, value) {
                  // if(key == )

                  // ArticleModel articleModel = ArticleModel(
                  //   title: key,
                  //   author: value['author'],
                  //   description: value['description'],
                  //   url: value['url'],
                  //   urlToImage: value['urlToImage'],
                  //   // publishedAt: element['publishedAt'],
                  //   content: value['context'],
                  //   bookmark: false,
                  // );

                  if (jsonData['status'] == 'ok') {
                    jsonData['articles'].forEach((element) {
                      if (element['urlToImage'] != null &&
                          element['description'] != null) {
                        // validNews.forEach((key, value) {});

                        if (key != element['title']) {
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
                        // ++count;
                        // news.add(articleModel);
                      }
                    });
                  }
                });
              })
            });

    final user =
        FirebaseFirestore.instance.collection('users').doc('categories');

    int count = 0;

    if (jsonData['status'] == 'ok') {
      jsonData['articles'].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          // validNews.forEach((key, value) {});

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

    // await articles.set({
    //   'general': validNews,
    //   'total': count,
    // });
  }
}
