import 'package:flutter/material.dart';
import 'package:my_squash/util/public_widgets/appbar_widget.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CourtList extends StatefulWidget {
  const CourtList({Key? key}) : super(key: key);

  @override
  State<CourtList> createState() => _CourtListState();
}

class _CourtListState extends State<CourtList> {

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
        Uri.parse('https://squash.or.jp/court/'),
      );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarWidget(title: 'コートリスト',),
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
