import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:my_squash/util/public_widgets/appbar_widget.dart';
import 'package:my_squash/widgets/home/squash_info_widget.dart';

class RulePage extends StatelessWidget {
  const RulePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(title: "ルール説明"),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Gap(20.h),
              Text("初心者向け　スカッシュ・ルール",style: TextStyle(
                color: Colors.blue.shade600,
                fontWeight: FontWeight.bold,
                fontSize: 25.sp
              ),),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * .35),
                child: Divider(
                  thickness: 5.h,
                  color: Colors.blue.shade600,
                ),
              ),
              Gap(30.h),
              SquashInfoWidget(title: '初心者向け　スカッシュ・ルール', desc: 'スカッシュを楽しむための簡単なルールをご紹介します。\n＊競技としてスカッシュをする方は、ルールブックを読んでより細かい規則を把握してください。\n\nスカッシュの試合はサービスの権利に関係無くポイントが入るラリーポイント制の11 点先取を1 ゲームとします。試合は、3ゲームスや5ゲームスマッチで行います。',),
              Gap(30.h),
              SquashInfoWidget(title: 'ウォームアップ', desc: '試合ではボールと体を温める為、選手がボールを打ち合うことをノックアップと言います。ノックアップの半分の時間でコートサイドを交替します。2分で交代しますが、大会により1分30秒の場合もあります。',),
              Gap(30.h),
              SquashInfoWidget(title: 'サーブ権を決める。', desc: 'ウォームアップの終了時間になるとレフリーが「タイム」というコールをします。それにより主にどちらかの選手がラケットスピンをしてラケットの裏表(アップかダウン）できめます',),
              Gap(30.h),
              SquashInfoWidget(title: 'サーブまたはサービス', desc: 'サービスボックスに片足か両足を入れ、フロントウォールのサービスラインとフロントウォールアウトラインの間に打ちます。ボールは床に落ちる前にサイドウォールやバックウォールに当たっても良い。そのボールを自分と反対側のコート4分の１、ハーフコートラインとショートラインの間に囲まれたエリアにバウンドするように入れます。\n\n注意）サーブをするときはラケットにボールが当たる瞬間まで、少なくとも片足がサービスボックス内のラインに触れない床面に付いていないとフットフォルトでアウトになります。サービスは一度のみです。',),
              Gap(30.h),
              SquashInfoWidget(title: 'リターン', desc: 'ノーバウンドかワンバウンドでフロントウォールに返します。この際、サイドウォールやバックウォールに当ててフロントウォールに返したボールも有効で、床だけをバウンド数に数えます。以降、ラリーが続きます。',),
              Gap(30.h),
              SquashInfoWidget(title: '得点・失点', desc: 'ツーバウンド以上だったり、フロントウォールに当たらなかったり、フロント、サイド、バックのアウトラインより上やティンに当たった場合はアウトです。オンラインは全てアウトです。\n\n＊スカッシュはオンライン（線上）はアウト(失点）です',),
              Gap(30.h),
              SquashInfoWidget(title: 'ゲーム', desc: '1ゲームは11点先取。10オールになるとタイブレークといい、2点差がついた時点でゲームオーバーとなります。\n\n1試合は通常5ゲームマッチの3ゲーム先取ですが、3ゲームマッチの２ゲーム先取で行われる時も有ります。ゲーム間の休憩は90秒。',),
              Gap(30.h),
              SquashInfoWidget(title: 'レットプリーズ', desc: 'スカッシュは同じエリアで2人以上のプレーヤーが動きまわるので、安全なプレーの為のルールがあります。無理をするとお互いを危険にさらしてしまいます。\n\n相手が邪魔になってボールが打ち返せない場合は、プレーを止めてレフリーに「レット　プリーズ」とアピールします。レフリーは邪魔(妨害）になった程度や、ボールの状況等を判断して次の判定をします。\n\n適切なプレイのやむを得ない動きの中で生じた妨害「レット」＝やり直し\n\n相手の不適当な動きの為に生じた妨害「ストローク」＝得点を与える\n\n返球出来なかったが相手の動きは適切で妨害ではなかった「ノーレット」＝失点する',),



              Gap(20.h),
              Text("スカッシュとは",style: TextStyle(
                color: Colors.blue.shade600,
                fontWeight: FontWeight.bold,
                fontSize: 30.sp,
              ),),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * .35),
                child: Divider(
                  thickness: 5.h,
                  color: Colors.blue.shade600,
                ),
              ),
              Gap(30.h),
              SquashInfoWidget(title: 'スカッシュはイギリス生まれのスタイリッシュなスポーツ', desc: 'スカッシュはロンドンで生まれたインドアラケットスポーツです。'
                  '2名（ダブルスは4名）で４面を壁で囲まれたコートの中で、小さい、中が空洞のゴムボールを交互に打ち合います。',),
              Gap(30.h),
              SquashInfoWidget(title: 'ラケットを持ったその日から楽しめます！', desc: 'スカッシュは185の国で約2000万人がプレーしています。（世界スカッシュ連盟発表）それは年齢や性別を問わず、用具も少なくて安く、コートが有ればすぐに楽しめるスポーツだからです。コートは9.75ｍの長さと6.40ｍの幅の約18坪と広すぎず、ボールがどこに行っても返す事が可能な範囲です。プレーヤーそれぞれの力量に合ったスピードで楽しめるので、子供から年配者まで、生涯スポーツとして続けられます。',),
              Gap(30.h),
              SquashInfoWidget(title: '楽しく、スピーディーに、健康的に', desc: '世界的に著名な雑誌が様々なスポーツを対象した研究の結果、スカッシュは“ 世界一健康的なスポーツ” と書いています。1時間の消費エネルギーは、通常のプレーヤーで700kcal前後、プロ選手で1500kcalと、他のスポーツに比べて短時間で充分な運動効果が得られます。忙しい現代人に適しているスポーツです。',),
              Gap(30.h),
              SquashInfoWidget(title: 'コート周りのエチケット', desc: '日本では、コートのほとんどが民間のスポーツクラブの中にあり、予約制になっています。予約の時間を守って、気持ちよく使いましょう。',),
              Gap(30.h),
              SquashInfoWidget(title: 'マナーを守って楽しいスカッシュを', desc: '一人一人が気をつけて安全なプレーを心がけましょう。\nアイガードをしましょう\n人や壁にあたりそうな時はラケットを止める\nプレーの前後にはストレッチを\n体調がすぐれない時は休みましょう\n危険なプレーはマナー違反です！',),
              Gap(30.h),
            ],
          ),
        ),
      ),
    );
  }
}
