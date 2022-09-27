import 'dart:async';

import 'package:flutter/material.dart';
import 'package:news_flight/pages/intro/components/empty_appbar.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleView extends StatefulWidget {
  final String blogUrl;

  const ArticleView({
    super.key,
    required this.blogUrl,
  });

  @override
  State<ArticleView> createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {
  // final Completer<WebViewController> _completer = Completer<WebViewController>();
  final Completer<WebViewController> _completer = Completer<WebViewController>();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EmptyAppBar(),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: WebView(
          initialUrl: widget.blogUrl,
          onWebViewCreated: (WebViewController webViewController){
            _completer.complete(webViewController);
          },
        ),
      ),
    );
  }
}
