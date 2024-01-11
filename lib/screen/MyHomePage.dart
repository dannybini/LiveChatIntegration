import 'package:flutter/material.dart';
import 'package:webview_flutter_plus/webview_flutter_plus.dart';

/// Flutter code sample for [showModalBottomSheet].

class BottomSheetApp extends StatelessWidget {
  const BottomSheetApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Bottom Sheet Sample'),leading: BackButton(),),//
        body: const BottomSheetExample(),
      ),
    );
  }
}

class BottomSheetExample extends StatefulWidget {
  const BottomSheetExample({Key? key}) : super(key: key);

  @override
  _BottomSheetExampleState createState() => _BottomSheetExampleState();
}

class _BottomSheetExampleState extends State<BottomSheetExample>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance?.addPostFrameCallback((_) {
      AnimationController controller = AnimationController(
        duration: const Duration(milliseconds: 500),
        vsync: this,
      );

      showModalBottomSheet<void>(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (context) {
          return AnimatedBuilder(
            animation: controller,
            builder: (context, child) {
              return ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                child: Opacity(
                  opacity: controller.value,
                  child: FractionallySizedBox(
                    heightFactor: 0.8,
                    child: Container(
                      child: WebViewPlus(
                        initialUrl: 'assets/genesyschat.html',
                        javascriptMode: JavascriptMode.unrestricted,
                        zoomEnabled: false,
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ).whenComplete(() => controller.dispose());

      controller.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(); // Placeholder widget, you can customize this
  }
}

void main() => runApp(const BottomSheetApp());
