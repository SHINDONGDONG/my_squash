import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class ScoreTextInputWidget extends StatelessWidget {
  const ScoreTextInputWidget(
      {Key? key, required this.HomeandAway,  required this.color, required this.controller})
      : super(key: key);

  final String HomeandAway;
  final Color color;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // borderRadius: BorderRadius.circular(10.w),
        // border: Border.all(color: color),
        // color: color.withOpacity(0.3),
      ),
      padding: EdgeInsets.symmetric(horizontal: 8.w,vertical: 8.h),
      child: Column(
        children: [
          // Align(
          //   child: Text(
          //     HomeandAway,
          //     style: TextStyle(color: Colors.black, fontSize: 20.sp),
          //   ),
          //   alignment: Alignment.center,
          // ),
          Gap(20.h),
          Align(
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.sports_tennis),
                prefixIconColor: Colors.grey.shade600,
                hintText: 'ホーム選手名前',
                hintStyle: TextStyle(color: Colors.grey.shade600,),
                labelText: HomeandAway,
                labelStyle: TextStyle(
                  color: Colors.grey.shade600,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20),),
                  borderSide: BorderSide(color: color),
                ),
                focusedBorder:OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20),),
                  borderSide: BorderSide(color: color),
                ),
              ),
            ),
            alignment: Alignment.center,
          )
        ],
      ),
    );
  }
}
