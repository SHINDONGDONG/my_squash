import 'package:flutter/material.dart';
import 'package:my_squash/util/public_widgets/appbar_widget.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CourtList extends StatefulWidget {
  const CourtList({Key? key}) : super(key: key);

  @override
  State<CourtList> createState() => _CourtListState();
}

class _CourtListState extends State<CourtList> {
  WebViewController controller = WebViewController()
    ..loadRequest(Uri.parse('https://squash.or.jp/court/'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarWidget(title: 'コートリスト',),
      body: WebViewWidget(controller: controller,),
    );
  }
}
