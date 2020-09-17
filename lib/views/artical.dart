import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticalViews extends StatefulWidget {

  final String articalUrl;

  const ArticalViews({Key key, this.articalUrl}) : super(key: key);

  @override
  _ArticalViewsState createState() => _ArticalViewsState();
}

class _ArticalViewsState extends State<ArticalViews> {

  final Completer<WebViewController> _completer=new Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "e",
                style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold,fontSize: 24),
              ),
              Text(
                " Learning",
                style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 24),
              )
            ],
          ),
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Container(
        color: Colors.red,
        child: WebView(
          initialUrl: widget.articalUrl,
          onWebViewCreated: ((WebViewController webviewcontroller){
            _completer.complete(webviewcontroller);
          }),
        ),

      ),

    );
  }
}
