import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_squash/screens/home/court_list.dart';
import 'package:my_squash/screens/home/players.dart';
import 'package:my_squash/screens/home/rule.dart';
import 'package:my_squash/screens/home/squash_video.dart';
import 'package:my_squash/screens/home/tournament.dart';
import 'package:my_squash/util/public_widgets/appbar_widget.dart';
import 'package:my_squash/util/public_widgets/drawer_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double Deviceheight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: const CustomAppBarWidget(title: "ホーム"),
      drawer: const CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Center(
                  child: SizedBox(
                    height: Deviceheight*.5,
                    width: double.maxFinite,
                    child: Image.asset("assets/image/main_spuash.png",fit: BoxFit.cover,),
                  ),
                ),
                Positioned(
                  bottom: Deviceheight *.02,
                  left: 10.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "スカッシュコート",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 30.sp
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                        ),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>const CourtList()));
                        },
                        child: Text(
                          "スカッシュコート確認",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Gap(20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('スカッシュ情報',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25.sp),),
                      Text('もっと見る'),
                    ],
                  ),
                  Text(
                    "スカッシュの情報を展開しております。",
                    style: TextStyle(color: Colors.grey.shade500),
                  ),
                  Gap(15.h),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              clipBehavior: Clip.antiAlias,
                              width: MediaQuery.of(context).size.width*.4,
                              height: Deviceheight*.2,
                              child: Image.asset(
                                "assets/image/main_spuash.png",
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              top: 5.h,
                              left: 5.w,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.zero
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const RulePage()));
                                },
                                child: Text('ルール'),
                              ),
                            ),
                          ],
                        ),
                        Gap(10.w),
                        Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              clipBehavior: Clip.antiAlias,
                              width: MediaQuery.of(context).size.width*.4,
                              height: Deviceheight*.2,
                              child: Image.asset(
                                "assets/image/player2.jpg",
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              top: 5.h,
                              left: 5.w,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.zero
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const Tournament(),
                                    ),
                                  );
                                },
                                child: Text('大会'),
                              ),
                            ),
                          ],
                        ),
                        Gap(10.w),
                        Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              clipBehavior: Clip.antiAlias,
                              width: MediaQuery.of(context).size.width*.4,
                              height: Deviceheight*.2,
                              child: Image.asset(
                                "assets/image/player2.jpg",
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              top: 5.h,
                              left: 5.w,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.zero
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const SquashVideo(),
                                    ),
                                  );
                                },
                                child: Text('動画'),
                              ),
                            ),
                          ],
                        ),
                        Gap(10.w),
                        Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              clipBehavior: Clip.antiAlias,
                              width: MediaQuery.of(context).size.width*.4,
                              height: Deviceheight*.2,
                              child: Image.asset(
                                "assets/image/player3.jpg",
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              top: 5.h,
                              left: 5.w,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.zero
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const Players(),
                                    ),
                                  );
                                },
                                child: Text('選手'),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
