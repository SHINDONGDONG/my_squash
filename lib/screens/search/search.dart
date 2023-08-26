import 'package:flutter/material.dart';
import 'package:my_squash/util/public_widgets/appbar_widget.dart';
import 'package:my_squash/util/public_widgets/drawer_widget.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBarWidget(title: '検索',),
      drawer: CustomDrawer(),
      body: Center(
        child: SizedBox(
          child: FlutterLogo(
            size: double.infinity,
          ),
        ),
      ),
    );
  }
}
