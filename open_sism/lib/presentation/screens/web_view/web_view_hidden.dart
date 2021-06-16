import 'dart:io';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewHidden extends StatefulWidget {
  static const String routeName = "/webViewHidden";
  final String url;
  WebViewHidden({@required this.url});

  @override
  WebViewHiddenState createState() => WebViewHiddenState();
}

class WebViewHiddenState extends State<WebViewHidden> {
  WebViewController webViewController;

  @override
  void initState() {
    super.initState();
    // Enable hybrid composition.
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WebView(
        initialUrl: widget.url,
        javascriptMode: JavascriptMode.unrestricted,
        allowsInlineMediaPlayback: true,
        debuggingEnabled: true,
        userAgent: "",
        onWebViewCreated: (controller) {
          webViewController = controller;
        },
        onPageFinished: (_) {
          readJS();
          //widget.hideProgress();
        },
        initialMediaPlaybackPolicy: AutoMediaPlaybackPolicy.always_allow,
      ),
    );
  }

  void readJS() async {
    String html = await webViewController.evaluateJavascript(
        "window.document.getElementsByTagName('html')[0].outerHTML;");
    print("html");
    print(html);
  }
}
