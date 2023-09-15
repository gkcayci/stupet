import 'package:flutter/material.dart';
import '../color/color_theme.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  // final String title;
  final VoidCallback onBackButtonPressed;

  CustomAppBar({
    // required this.title,
    required this.onBackButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white.withOpacity(0.75),
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios_new_outlined),
        color: ColorTheme().blackbean,
        onPressed: onBackButtonPressed,
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // Padding(
          //   padding: const EdgeInsets.only(right: 80.0),
          //   child: Text(
          //     // title,
          //     style: TextStyle(
          //       fontSize: 20,
          //       fontWeight: FontWeight.w400,
          //       color: ColorTheme().blackbean,
          //     ),
          //   ),
          // ),
          // SizedBox(width: 5),
          Image.asset(
            'assets/logo.png',
            height: 100,
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
