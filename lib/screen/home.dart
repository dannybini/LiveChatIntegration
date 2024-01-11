import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:matcher/matcher.dart';
import 'package:webview_flutter_plus/webview_flutter_plus.dart';
class HtmlReaderPage extends StatefulWidget {
  @override
  _HtmlReaderPageState createState() => _HtmlReaderPageState();
}

class _HtmlReaderPageState extends State<HtmlReaderPage> {
  String htmlContent = '';

  @override
  void initState() {
    super.initState();
    loadHtmlContent();
  }

  Future<void> loadHtmlContent() async {
    String content = await rootBundle.loadString('assets/web_page/genesyschat.html');
    var sdf=content.length;
    setState(() {
      htmlContent = content;
    });
  }

  @override
  Widget build(BuildContext context) {
    // return SafeArea(
    //   child: Scaffold(
    //
    //     body: Container(
    //       child: const WebViewPlus(
    //         initialUrl: 'assets/genesyschat.html',
    //         javascriptMode: JavascriptMode.unrestricted,
    //       ),
    //     ),
    //   ),
    // );

    return SafeArea(
      child: Scaffold(
        body: Container(
          child: InAppWebView(
            initialUrlRequest: URLRequest(
              url: Uri.parse('assets/genesyschat.html'),
            ),

          ),
        ),
      ),
    );
  }
}
