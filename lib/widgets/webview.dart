import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

const CATCH_URLS = ['m.ctrip.com/', 'm.ctrip.com/html5/', 'm.ctrip.com/html5'];

class Webview extends StatefulWidget {
  final String url;
  final String? statusBarColor;
  final String? title;
  final bool hideAppBar;
  final bool backForbid;

  Webview(
      {required url,
      this.statusBarColor,
      this.title,
      this.hideAppBar = false,
      this.backForbid = false})
      : url = (url.contains('ctrip.com')
            ? url.replaceAll("http://", "https://")
            : url);

  @override
  _WebviewState createState() => _WebviewState();
}

class _WebviewState extends State<Webview> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  bool exiting = false;

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  bool _isToMain(String url) {
    for (final value in CATCH_URLS) {
      if (url.endsWith(value)) {
        return true;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    String statusBarColorStr = widget.statusBarColor ?? "ffffff";
    Color backButtonColor =
        (statusBarColorStr == 'ffffff') ? Colors.black : Colors.white;

    return Scaffold(
      body: Column(
        children: [
          _appBar(
            Color(int.parse('0xff' + statusBarColorStr)),
            backButtonColor,
          ),
          Expanded(
            child: WebView(
              initialUrl: widget.url,
              JavaScriptMode: JavaScriptMode.unrestricted,
              gestureNavigationEnabled: true,
              onWebViewCreated: (WebViewController webViewController) {
                _controller.complete(webViewController);
              },
              onProgress: (int progress) {
                print("WebView is loading (progress : $progress%)");
              },
              navigationDelegate: (NavigationRequest request) {
                return NavigationDecision.navigate;
              },
              onPageStarted: (String url) {
                print('Page started loading: $url');
              },
              onPageFinished: (String url) {
                print('Page finished loading: $url');
              },
            ),
          ),
        ],
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   String statusBarColorStr = widget.statusBarColor ?? 'ffffff';

  //   Color backButtonColor =
  //       (statusBarColorStr == 'ffffff') ? Colors.black : Colors.white;

  //   return Scaffold(
  //     body: Column(
  //       children: <Widget>[
  //         _appBar(
  //           Color(int.parse('0xff' + statusBarColorStr)),
  //           WebviewScaffold(
  //             userAgent: 'null',
  //             url: widget.url,
  //             withLocalStorage: true,
  //             hidden: true,
  //             initialChild: Container(
  //               color: Colors.white,
  //               child: Center(
  //                 child: Text("waiting..."),
  //               ),
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  _appBar(Color backgroundColor, Color backButtonColor) {
    String statusBarColorStr = widget.statusBarColor ?? 'ffffff';
    Color backButtonColor =
        (statusBarColorStr == 'ffffff' ? Colors.black : Colors.white);
    return Container(
        color: backgroundColor,
        padding: EdgeInsets.fromLTRB(0, 40, 0, 10),
        child: FractionallySizedBox(
          widthFactor: 1,
          child: Stack(
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Icon(
                    Icons.close,
                    color: backButtonColor,
                    size: 26,
                  ),
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                child: Center(
                    child: Text(
                  widget.title ?? '',
                  style: TextStyle(color: backgroundColor, fontSize: 20),
                )),
              )
            ],
          ),
        ));
  }

  @override
  void dispose() {
    super.dispose();
  }
}
