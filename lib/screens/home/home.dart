import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_squash/util/public_widgets/appbar_widget.dart';
import 'package:my_squash/util/public_widgets/drawer_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarWidget(title: "ホーム"),
      drawer: const CustomDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Wiweifiesfjddsfasdfsdfdsfsddfasdfdsfdsfadsfadsfdsfsdfdsfdsfdsfad",style: TextStyle(fontSize: 13.sp),),
            const Text("Wiweifiesfjddsfasdfsdfdsfsddfasdfdsfdsfadsfadsfdsfsdfdsfdsfdsfad"),
            ElevatedButton(
              onPressed: () {},
              child: Text("abcd"),
            ),
          ],
        ),
      ),
    );
  }
}
