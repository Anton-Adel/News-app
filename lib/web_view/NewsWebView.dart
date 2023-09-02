
import 'package:flutter/material.dart';
import 'dart:io';

import 'package:webview_flutter/webview_flutter.dart';

class Webview extends StatelessWidget {


  final String url;
  Webview ( this.url);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: WebView(initialUrl:'$url'),


    );
  }
}
