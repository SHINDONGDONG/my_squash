import 'package:flutter/material.dart';
import 'package:my_squash/util/public_widgets/appbar_widget.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Players extends StatefulWidget {
  const Players({Key? key}) : super(key: key);

  @override
  State<Players> createState() => _PlayersState();
}

class _PlayersState extends State<Players> {

  late final WebViewController controller;
  var loading = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = WebViewController()
      ..setNavigationDelegate(NavigationDelegate(onPageStarted: (url) {
        setState(() {
          loading = 0;
        });
      }, onProgress: (progress) {
        setState(() {
          loading = progress;
        });
      }, onPageFinished: (url) {
        setState(() {
          loading = 100;
        });
      }))
      ..loadRequest(
        Uri.parse('https://squash.or.jp/national/top4/'),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarWidget(title: 'スカッシュ選手',),
      body: Stack(
        children: [
          WebViewWidget(
            controller: controller,
          ),
          if(loading < 100)
            LinearProgressIndicator(
              color: Colors.red,
              backgroundColor: Colors.black,
              value: loading / 100.0,
            ),
        ],
      ),
    );
  }
}
