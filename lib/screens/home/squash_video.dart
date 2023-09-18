import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_squash/util/public_widgets/appbar_widget.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SquashVideo extends StatefulWidget {
  const SquashVideo({Key? key}) : super(key: key);

  @override
  State<SquashVideo> createState() => _SquashVideoState();
}

class _SquashVideoState extends State<SquashVideo> {

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
        Uri.parse('https://www.youtube.com/@squashtv/videos'),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarWidget(title: 'スカッシュ動画',),
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
