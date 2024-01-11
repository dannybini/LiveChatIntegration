import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:matcher/matcher.dart';
import 'package:webview_flutter_plus/webview_flutter_plus.dart';

class TestHtmlReaderPage extends StatefulWidget {
  @override
  _HtmlReaderPageState createState() => _HtmlReaderPageState();
}

class _HtmlReaderPageState extends State<TestHtmlReaderPage> {
  String htmlContent = '';

  @override
  void initState() {
    super.initState();
    loadHtmlContent();
  }

  Future<void> loadHtmlContent() async {
    String content =
    await rootBundle.loadString('assets/web_page/genesyschat.html');
    var sdf = content.length;
    setState(() {
      htmlContent = content;
    });
  }

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  Future<void> connectToLiveChat() async {
// Read the HTML file from assets
    String htmlContent = await rootBundle.loadString('assets/genesyschat.html');

    // Replace placeholders in the HTML with user-provided names
    htmlContent =
        htmlContent.replaceAll('{{firstName}}', firstNameController.text);
    htmlContent =
        htmlContent.replaceAll('{{lastName}}', lastNameController.text);
    htmlContent = htmlContent.replaceAll('{{email}}', emailController.text);

    // Open WebView with the updated HTML content
    //  Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => WebViewPlus(
    //       initialUrl: Uri.dataFromString(htmlContent, mimeType: 'text/html').toString(),
    //       javascriptMode: JavascriptMode.unrestricted,
    //     ),
    //   ),
    // );
    const WebViewPlus(
         initialUrl: 'assets/genesyschat.html',
         javascriptMode: JavascriptMode.unrestricted,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Live Chat'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: firstNameController,
                decoration: InputDecoration(labelText: 'First Name'),
              ),
              SizedBox(height: 10),
              TextField(
                controller: lastNameController,
                decoration: InputDecoration(labelText: 'Last Name'),
              ),
              SizedBox(height: 10),
              TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(labelText: 'Email'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: connectToLiveChat,
                child: Text('Connect to Live Chat'),
              ),
            ],
          ),
        ),
        // body: Container(
        //   child: const WebViewPlus(
        //     initialUrl: 'assets/genesyschat.html',
        //     javascriptMode: JavascriptMode.unrestricted,
        //   ),
      ),
    );
  }
}
