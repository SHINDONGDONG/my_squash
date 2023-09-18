import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBarWidget({
    super.key, required this.title,
  });

  final String title;

  @override
  Size get preferredSize => Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.2,
      centerTitle: true,
      title: Text(
        title,
        style: GoogleFonts.acme(
          textStyle: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600
          ),
        ),
      ),
      // actions: [
      //   Padding(
      //     padding: EdgeInsets.only(right: 10.w),
      //     child: const Icon(Icons.notifications_outlined),
      //   ),
      // ],
    );
  }
}