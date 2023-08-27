import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:my_squash/screens/home/home.dart';
import 'package:my_squash/screens/navigation.dart';
import 'package:my_squash/screens/search/search.dart';
import 'package:my_squash/screens/settings/settings.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text(
              "Shin mincheol",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            accountEmail: const Text(
              "shinmame0129@gmail.com",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: ClipOval(
                child: Image.network(
                  'https://img.chelseafc.com/image/upload/f_auto,h_390,q_90/editorial/people/academy/2023-24/Maatsen_profile_headshot_23-24-removebg.png',
                ),
              ),
            ),
            decoration: const BoxDecoration(
              color: Colors.teal,
              image: DecorationImage(
                image: AssetImage(
                  'assets/image/main_spuash.png',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.home,
            ),
            title: const Text("ホーム"),
            onTap: () => Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const Navigation(),
                ),
                (route) => false),
          ),
          ListTile(
            leading: const Icon(
              Icons.account_circle,
            ),
            title: const Text("プロファイル"),
            onTap: () => Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomePage(),
                ),
                    (route) => false),
          ),
          ListTile(
            leading: const Icon(
              Icons.message,
            ),
            title: const Text("メッセージ"),
            onTap: () => Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomePage(),
                ),
                    (route) => false),
          ),
          const Spacer(),
          const Divider(),
          ListTile(
            leading: const Icon(
              Icons.logout,
            ),
            title: const Text("ログアウト"),
            onTap: () => Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomePage(),
                ),
                    (route) => false),
          ),
          Gap(20.h),
        ],
      ),
    );
  }
}
