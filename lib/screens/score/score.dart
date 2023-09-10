import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:my_squash/util/public_widgets/appbar_widget.dart';
import 'package:my_squash/util/public_widgets/drawer_widget.dart';

class ScorePage extends StatefulWidget {
  const ScorePage({Key? key}) : super(key: key);

  @override
  State<ScorePage> createState() => _ScorePageState();
}

class _ScorePageState extends State<ScorePage> {
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: CustomAppBarWidget(
        title: 'スコア',
      ),
      drawer: CustomDrawer(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    child: Text(
                      'Mincheol',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16.sp),
                    ),
                  ),
                  Container(
                    child: Text(
                      'Home',
                      style: TextStyle(color: Colors.grey.shade600),
                    ),
                  ),
                  Gap(20.h),
                  MaterialButton(
                    height: 130.h,
                    minWidth: 130.w,
                    color: Colors.blue,
                    onPressed: () {},
                    shape: CircleBorder(),
                    child: Text(
                      "1",
                      style: TextStyle(
                          fontSize: 24.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Gap(20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        child: Text("L"),
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: Colors.lightBlue.shade300,
                          shape: RoundedRectangleBorder(),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text("R"),
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: Colors.lightBlue.shade300,
                          shape: RoundedRectangleBorder(),
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text("YES LET"),
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: Colors.lightBlue.shade300,
                        shape: RoundedRectangleBorder(),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text("STORKE"),
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: Colors.lightBlue.shade300,
                        shape: RoundedRectangleBorder(),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text("NO LET"),
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: Colors.lightBlue.shade300,
                        shape: RoundedRectangleBorder(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 100,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Align(
                      alignment: index.isOdd ? Alignment.centerLeft : Alignment.centerRight,
                      child: Text('Item $index'),
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    child: Text(
                      'Dongho',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16.sp),
                    ),
                  ),
                  Container(
                    child: Text(
                      'Away',
                      style: TextStyle(color: Colors.grey.shade600),
                    ),
                  ),
                  Gap(20.h),
                  MaterialButton(
                    height: 130.h,
                    minWidth: 130.w,
                    color: Colors.green,
                    onPressed: () {},
                    shape: CircleBorder(),
                    child: Text(
                      "12",
                      style: TextStyle(
                          fontSize: 24.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Gap(20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        child: Text("L"),
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: Colors.lightGreen.shade300,
                          shape: RoundedRectangleBorder(),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text("R"),
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: Colors.lightGreen.shade300,
                          shape: RoundedRectangleBorder(),
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text("YES LET"),
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: Colors.lightGreen.shade300,
                        shape: RoundedRectangleBorder(),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text("STORKE"),
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: Colors.lightGreen.shade300,
                        shape: RoundedRectangleBorder(),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text("NO LET"),
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: Colors.lightGreen.shade300,
                        shape: RoundedRectangleBorder(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
