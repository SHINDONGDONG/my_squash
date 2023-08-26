import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h,horizontal: 20.w),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("bacd"),
              Spacer(),
              Text("bascd"),
            ],
          ),

        ),
      ),
    );
  }
}
