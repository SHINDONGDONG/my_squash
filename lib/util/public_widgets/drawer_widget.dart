import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:my_squash/screens/home/home.dart';
import 'package:my_squash/screens/navigation.dart';
import 'package:my_squash/screens/settings/settings.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {

  String name='';
  late SharedPreferences preferences;

  @override
  void initState(){
    // TODO: implement initState
    super.initState();
    init();
    // remove();
  }

  Future remove() async{
    preferences = await SharedPreferences.getInstance();
    await preferences.remove('name');
  }

  Future init() async {
    preferences = await SharedPreferences.getInstance();
    String? name = preferences.getString('name');
    if(name == null) {
      final uuid = Uuid().v1();
      preferences.setString('name', 'GUEST_${uuid.substring(0,6)}');
      name = preferences.getString('name');
    };
      setState(()=>this.name = name!);

  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(
              name,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            accountEmail: const Text(
              "",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: ClipOval(
                child: Image.asset(
                  'assets/image/splash.png',
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
              Icons.settings,
            ),
            title: const Text("設定"),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SettingsPage(),
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.logout,
              color: Colors.red.shade400,
            ),
            title: Text(
              "ログアウト",
              style: TextStyle(
                color: Colors.red.shade400,
              ),
            ),
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
