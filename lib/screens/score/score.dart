import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:my_squash/util/public_widgets/appbar_widget.dart';
import 'package:my_squash/util/public_widgets/drawer_widget.dart';
import 'package:my_squash/widgets/score/score_text_input_widget.dart';
import 'package:numberpicker/numberpicker.dart';

class ScorePage extends StatefulWidget {
  const ScorePage({Key? key}) : super(key: key);

  @override
  State<ScorePage> createState() => _ScorePageState();
}



class _ScorePageState extends State<ScorePage> with AutomaticKeepAliveClientMixin{
  late bool isSetting = false;
  int _defaultSet = 3;
  int _defaultScore = 11;
  final TextEditingController _homeName = TextEditingController();
  final TextEditingController _awayName = TextEditingController();
  int _homeScore = 0;
  int _awayScore = 0;
  int _homeSetScore = 0;
  int _awaySetScore = 0;
  bool _isTie_break = false;

  @override
  Widget build(BuildContext context) {

    void SetScore({required bool isHome}) {
      setState(() {
        if (isHome) {
          //homeの時
          _homeScore = _homeScore + 1;
          //たい宣言
          if (_isTie_break && (_homeScore - _awayScore).abs() == 2) {
            _homeScore = 0;
            _awayScore = 0;
            _homeSetScore = _homeSetScore + 1;
            _isTie_break = false;

          } else if(_isTie_break && (_homeScore - _awayScore).abs() < 1){

          } else if (!_isTie_break && _homeScore >= _defaultScore) {
            _homeScore = 0;
            _awayScore = 0;
            _homeSetScore = _homeSetScore + 1;
            _isTie_break = false;
          }
        }
        //awayの時
        else {
          _awayScore = _awayScore + 1;
          if (_isTie_break && (_awayScore - _homeScore).abs() == 2) {
            _homeScore = 0;
            _awayScore = 0;
            _awaySetScore = _awaySetScore + 1;
            _isTie_break = false;
          } else if(_isTie_break && (_homeScore - _awayScore).abs() < 1){

          } else if (!_isTie_break && _awayScore >= _defaultScore) {
            _homeScore = 0;
            _awayScore = 0;
            _awaySetScore = _awaySetScore + 1;
            _isTie_break = false;
          }
        }
      });
      if (_homeScore == _awayScore && _defaultScore - 1 == _homeScore && _defaultScore - 1 == _awayScore) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Tie Break'),
            content: Text('タイブレークを実施しますか？'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  setState(() {
                    _isTie_break = false;
                  });

                },
                child: Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  setState(() {
                    _isTie_break = true;
                  });
                },
                child: Text('OK'),
              ),
            ],
          ),
        );
      }
    }

    return Scaffold(
      appBar: CustomAppBarWidget(
        title: isSetting ? '${_homeSetScore} : ${_awaySetScore}'
            :'スコア',
      ),
      drawer: CustomDrawer(),
      body: isSetting ? Container(
        padding: EdgeInsets.all(10.w),
        color: Colors.white,
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    child: Text(
                      _homeName.text,
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
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    onPressed: () {},
                    shape: CircleBorder(),
                    child: Text(
                      '${_homeScore}',
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
                        onPressed: () {
                          SetScore(isHome: true);
                        },
                        child: Text("L"),
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: Colors.lightBlue.shade300,
                          shape: RoundedRectangleBorder(),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          SetScore(isHome: true);
                        },
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
                      onPressed: () {
                        SetScore(isHome: true);
                      },
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
                      onPressed: () {
                        SetScore(isHome: !true);
                      },
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
                      _awayName.text,
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
                    onPressed: (){},
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    shape: CircleBorder(),
                    child: Text(
                      '${_awayScore}',
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
                        onPressed: () {
                          SetScore(isHome: false);
                        },
                        child: Text("L"),
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: Colors.lightGreen.shade300,
                          shape: RoundedRectangleBorder(),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          SetScore(isHome: false);
                        },
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
                      onPressed: () {
                        SetScore(isHome: false);
                      },
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
                      onPressed: () {
                        SetScore(isHome: !false);
                      },
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
      ) : Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
        child: Column(
                children: [
                  ScoreTextInputWidget(HomeandAway: 'Home', color: Colors.blue, controller: _homeName,),
                  Gap(20.h),
                  ScoreTextInputWidget(HomeandAway: 'Away', color: Colors.green, controller: _awayName,),
                  Align(child: Text('セット'),alignment: Alignment.center,),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 15.w,vertical: 15.h),
                        padding: EdgeInsets.symmetric(horizontal: 15.w),
                        alignment: Alignment.center,
                        height: 40.h,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.w),
                          border: Border.all(color: Colors.grey.shade300),
                        ),
                      ),
                      Positioned(
                        child: Container(
                          height: 50.w,
                          width: 50.w,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade300,
                                blurRadius: 15.0.w,
                                spreadRadius: 1.w,
                              ),
                            ]
                          ),
                        ),
                      ),
                      Align(child: NumberPicker(
                        axis: Axis.horizontal,itemHeight: 45.h,itemWidth: 45.w,
                        value: _defaultSet,
                        itemCount: 5,
                        minValue: 1,
                        maxValue: 5,
                        onChanged: (v) => setState(() =>_defaultSet = v),
                      ),alignment: Alignment.center,),
                    ],
                  ),
                  Align(child: Text('点まで'),alignment: Alignment.center,),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 15.w,vertical: 15.h),
                        padding: EdgeInsets.symmetric(horizontal: 15.w),
                        alignment: Alignment.center,
                        height: 40.h,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.w),
                          border: Border.all(color: Colors.grey.shade300),
                        ),
                      ),
                      Positioned(
                        child: Container(
                          height: 50.w,
                          width: 50.w,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.shade300,
                                  blurRadius: 15.0.w,
                                  spreadRadius: 1.w,
                                ),
                              ]
                          ),
                        ),
                      ),
                      Align(child: NumberPicker(
                        axis: Axis.horizontal,itemHeight: 45.h,itemWidth: 45.w,
                        value: _defaultScore,
                        itemCount: 7,
                        minValue: 1,
                        maxValue: 30,
                        onChanged: (v) => setState(() =>_defaultScore = v),
                      ),alignment: Alignment.center,),
                    ],
                  ),
                  Spacer(),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          isSetting = !isSetting;
                        });
                        print(_homeName.text);
                        print(_awayName.text);
                      },
                      child: Text("True"),
                    ),
                  )
                ],
              ),
      ),
    );
  }


  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
