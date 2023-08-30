import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:my_squash/util/public_widgets/appbar_widget.dart';
import 'package:my_squash/util/public_widgets/drawer_widget.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(title: 'プロファイル',),
      drawer: CustomDrawer(),
      body: Center(
        child: SizedBox(
          width: double.infinity,
          child: Lottie.network(
            'https://lottie.host/de1ce28f-70c6-4316-8dc8-ef217fb9d92e/LvILkJ5I5o.json',
          ),
        ),
      ),
    );
  }
}
