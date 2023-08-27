import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:my_squash/screens/navigation.dart';
import 'package:my_squash/util/public_widgets/appbar_widget.dart';
import 'package:my_squash/util/public_widgets/drawer_widget.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(
        title: '設定',
      ),
      drawer: CustomDrawer(),
      body: Center(
        child: SizedBox(
          height: 400,
          width: 200,
          child: Lottie.network(
            'https://lottie.host/3394b81d-2065-4ee3-ba10-780e06e78ddc/1CYYxtwDxg.json',
          ),
        ),
      ),
    );
  }
}
