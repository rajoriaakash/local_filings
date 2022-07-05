import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  //components in app bar
  final String title;
  final bool isBackButtonExist;
  final bool isNotificationButtonExist;

  CustomAppBar({
    Key? key,
    this.title = "",
    this.isBackButtonExist = true,
    this.isNotificationButtonExist = true,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFFFF832A),
      elevation: 0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(10),
        ),
      ),
      //Title of app bar
      title: Padding(
        padding: EdgeInsets.only(top: 35),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 18,
          ),
        ),
      ),
      //Back button
      leading: isBackButtonExist
          ? Padding(
              padding: EdgeInsets.only(top: 27),
              child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back)),
            )
          : Container(),
      //Notification button
      actions: isNotificationButtonExist
          ? [
              Padding(
                padding: EdgeInsets.only(top: 26),
                child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.notifications_none_rounded)),
              )
            ]
          : [],
    );
  }

  @override
  Size get preferredSize => Size(double.maxFinite, 80);
}
