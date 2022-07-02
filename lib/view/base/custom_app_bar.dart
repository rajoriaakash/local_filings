import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
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
      title: Padding(
        padding: EdgeInsets.only(top: 40),
        child: Text(
          title,
          style: const TextStyle(

          ),
        ),
      ),
      leading: isBackButtonExist? Padding(
        padding: EdgeInsets.only(top: 28),
        child: IconButton(
            onPressed: ()=> Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back
            )
        ),
      ) : Container(),
      actions: isNotificationButtonExist? [
        Padding(
          padding: EdgeInsets.only(top: 26),
          child: IconButton(
              onPressed: (){
                print(MediaQuery.of(context).size.width);
                print(MediaQuery.of(context).size.height);
              },
              icon: const Icon(
                Icons.notifications_none_rounded
              )),
        )
      ] : [],
    );
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFFF832A),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10)
        )
      ),
      child: Row(
        children: [

        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size(double.maxFinite, 80);
}
