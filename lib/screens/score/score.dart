import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:my_squash/util/public_widgets/appbar_widget.dart';
import 'package:my_squash/util/public_widgets/drawer_widget.dart';
import 'package:my_squash/widgets/score/score_text_input_widget.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  List<Map<String,dynamic>> scoreMap = [];
  List<Map<String,dynamic>> scoreMapReversed = [];

  @override
  Widget build(BuildContext context) {

    void SetScore({required String position,required bool isHome}) {
      setState(() {
        if (isHome) {
          //homeの時
          position == "LET" ? null : _homeScore = _homeScore + 1;
          scoreMap.add({'position': position, 'isHome': isHome});
          //たい宣言
          if (_isTie_break && (_homeScore - _awayScore).abs() == 2) {
            _homeScore = 0;
            _awayScore = 0;
            _homeSetScore = _homeSetScore + 1;
            _isTie_break = false;
            scoreMap.clear();
            if (_homeSetScore >= _defaultSet ||
                _awaySetScore >= _defaultSet) {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('ゲーム終了'),
                  content: Text('${_homeName.text}さん、おめでとうございます。'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        setState(() {
                          _homeName.text = "";
                          _awayName.text = "";
                          scoreMap.clear();
                          isSetting = false;
                          _defaultSet = 3;
                          _defaultScore = 11;
                          _homeScore = 0;
                          _awayScore = 0;
                          _homeSetScore = 0;
                          _awaySetScore = 0;
                          _isTie_break = false;
                        });
                      },
                      child: Text('OK'),
                    ),
                  ],
                ),
              );
            }
          } else if(_isTie_break && (_homeScore - _awayScore).abs() < 1){

          } else if (!_isTie_break && _homeScore >= _defaultScore) {
            _homeScore = 0;
            _awayScore = 0;
            _homeSetScore = _homeSetScore + 1;
            _isTie_break = false;
            scoreMap.clear();
            if (_homeSetScore >= _defaultSet ||
                _awaySetScore >= _defaultSet) {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('ゲーム終了'),
                  content: Text('${_homeName.text}さん、おめでとうございます。'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        setState(() {
                          _homeName.text = "";
                          _awayName.text = "";
                          scoreMap.clear();
                          isSetting = false;
                          _defaultSet = 3;
                          _defaultScore = 11;
                          _homeScore = 0;
                          _awayScore = 0;
                          _homeSetScore = 0;
                          _awaySetScore = 0;
                          _isTie_break = false;
                        });
                      },
                      child: Text('OK'),
                    ),
                  ],
                ),
              );
            }
          }
        }
        //awayの時
        else {
          position == "LET" ? null : _awayScore = _awayScore + 1;
          scoreMap.add({'position': position, 'isHome': isHome});
          if (_isTie_break && (_awayScore - _homeScore).abs() == 2) {
            _homeScore = 0;
            _awayScore = 0;
            _awaySetScore = _awaySetScore + 1;
            _isTie_break = false;
            scoreMap.clear();
            if (_homeSetScore >= _defaultSet ||
                _awaySetScore >= _defaultSet) {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('ゲーム終了'),
                  content: Text('${_awayName.text}さん、おめでとうございます。'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        setState(() {
                          _homeName.text = "";
                          _awayName.text = "";
                          scoreMap.clear();
                          isSetting = false;
                          _defaultSet = 3;
                          _defaultScore = 11;
                          _homeScore = 0;
                          _awayScore = 0;
                          _homeSetScore = 0;
                          _awaySetScore = 0;
                          _isTie_break = false;
                        });
                      },
                      child: Text('OK'),
                    ),
                  ],
                ),
              );
            }

          } else if(_isTie_break && (_homeScore - _awayScore).abs() < 1){

          } else if (!_isTie_break && _awayScore >= _defaultScore) {
            _homeScore = 0;
            _awayScore = 0;
            _awaySetScore = _awaySetScore + 1;
            _isTie_break = false;
            scoreMap.clear();
            if (_homeSetScore >= _defaultSet ||
                _awaySetScore >= _defaultSet) {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('ゲーム終了'),
                  content: Text('${_awayName.text}さん、おめでとうございます。'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        setState(() {
                          _homeName.text = "";
                          _awayName.text = "";
                          scoreMap.clear();
                          isSetting = false;
                          _defaultSet = 3;
                          _defaultScore = 11;
                          _homeScore = 0;
                          _awayScore = 0;
                          _homeSetScore = 0;
                          _awaySetScore = 0;
                          _isTie_break = false;
                        });
                      },
                      child: Text('OK'),
                    ),
                  ],
                ),
              );
            }

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
        child: Column(
          children: [
            Expanded(
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
                                _defaultSet <= _homeSetScore ? null : SetScore(isHome: true, position: 'L');
                              },
                              child: Text("L"),
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                backgroundColor: _defaultSet <= _homeSetScore ? Colors.grey : Colors.lightBlue.shade300,
                                shape: RoundedRectangleBorder(),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                SetScore(isHome: true, position: 'R');
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
                            onPressed: () {
                              SetScore(position: "LET", isHome: true);
                            },
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
                              SetScore(isHome: true, position: 'ST');
                            },
                            child: Text("STROKE"),
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
                              SetScore(isHome: !true, position: 'NO');
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
                      // shrinkWrap: true,
                      reverse: true,
                      itemCount: scoreMap.length,
                      itemBuilder: (context, index) {
                        final reversedMap = scoreMap.reversed;
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          child: Align(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.w),
                                  color: reversedMap.toList()[index]['isHome'] ?Colors.blue:Colors.green,
                                ),
                                padding: EdgeInsets.symmetric(vertical: 5.h,horizontal: 5.w),
                                margin: EdgeInsets.only(bottom: 2.h),
                                child: Container(
                                  child: Row(
                                    mainAxisAlignment: reversedMap.toList()[index]['isHome'] ? MainAxisAlignment.start : MainAxisAlignment.end,
                                    children: [
                                      Icon(reversedMap.toList()[index]['isHome'] ? Icons.check:null, color: Colors.white,),
                                      Gap(10.w),
                                      Container(
                                            child: Text(
                                              reversedMap.toList()[index]
                                                  ['position'],
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                      Gap(10.w),

                                      Icon(reversedMap.toList()[index]['isHome'] ? null:Icons.check,color: Colors.white,),
                                    ],
                                  ),
                                ),
                              ),


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
                                SetScore(isHome: false, position: 'L');
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
                                SetScore(isHome: false, position: 'R');
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
                            onPressed: () {
                              SetScore(position: "LET", isHome: false);
                            },
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
                              SetScore(isHome: false, position: 'ST');
                            },
                            child: Text("STROKE"),
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
                              SetScore(isHome: !false, position: 'NO');
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
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: Colors.orange.shade400,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.w),),
                ),
                onPressed: () {
                  setState(() {
                    _homeName.text = "";
                    _awayName.text = "";
                    scoreMap.clear();
                  isSetting = false;
                  _defaultSet = 3;
                  _defaultScore = 11;
                  _homeScore = 0;
                  _awayScore = 0;
                  _homeSetScore = 0;
                  _awaySetScore = 0;
                  _isTie_break = false;
                  });
                      },
                child: Padding(
                  padding: EdgeInsets.all(10.w),
                  child: Text(
                    "リセット",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.sp),
                  ),
                ),
              ),
            ),
          ],
        ),
      ) : Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
        child: Column(
                children: [
                  Text("選手情報入力",style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.w500),),
                  Divider(),
                  ScoreTextInputWidget(HomeandAway: 'ホーム', color: Colors.blue, controller: _homeName,),
                  ScoreTextInputWidget(HomeandAway: 'アウェー', color: Colors.green, controller: _awayName,),
                  Gap(20.h),
                  Divider(),
                  Gap(20.h),
                  Align(child: Text('セット'),alignment: Alignment.center,),
                  Gap(10.h),
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
                  Gap(20.h),
                  Align(child: Text('点まで'),alignment: Alignment.center,),
                  Gap(10.h),
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
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: Colors.orange.shade400,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.w),),
                      ),
                      onPressed: () {
                        setState(() {
                          if(_homeName.text.isEmpty || _awayName.text.isEmpty){
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text('エラー'),
                                content: Text('選手の名前を入力してください。'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text('確認'),
                                  ),
                                ],
                              ),
                            );
                          }else{
                            isSetting = !isSetting;
                          }
                        });
                      },
                      child: Padding(
                        padding: EdgeInsets.all(10.w),
                        child: Text(
                          "決定",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.sp),
                        ),
                      ),
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
