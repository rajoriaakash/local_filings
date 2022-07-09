import 'package:flutter/material.dart';
import 'package:local_filings/dimensions.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  //components in app bar
  final String title;
  final bool isBackButtonExist;
  final bool isNotificationButtonExist;
  final bool centredTitle;
  final bool isSearchBarExist;

  CustomAppBar({
    Key? key,
    this.title = "",
    this.isBackButtonExist = true,
    this.isNotificationButtonExist = true,
    this.centredTitle = false,
    this.isSearchBarExist = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: isSearchBarExist ? 120 : 80,
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.getWidth(context, 20),
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: const BorderRadius.vertical(
          bottom: Radius.circular(10),
        ),
      ),
      child: Column(
        children: [
          AppBar(
            elevation: 0,
            //Title of app bar
            title: Padding(
              padding: const EdgeInsets.only(top: 35),
              //Title of app bar
              child: Align(
                alignment:
                    centredTitle ? Alignment.center : Alignment.bottomLeft,
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            //Back button
            leading: isBackButtonExist
                ? Padding(
                    padding: const EdgeInsets.only(top: 27),
                    child: IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.arrow_back)),
                  )
                : Container(),
            //Notification button
            actions: isNotificationButtonExist
                ? [
                    Padding(
                      padding: const EdgeInsets.only(top: 26),
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.notifications_none_rounded)),
                    )
                  ]
                : [],
          ),
          //Search Bar
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: Dimensions.getHeight(context, 16)),
            child: TextField(
              textInputAction: TextInputAction.search,
              decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.search,
                    size: 27,
                    color: Color(0xFF000000),
                  ),
                  hintText: "Search",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none),
                  fillColor: Theme.of(context).colorScheme.secondary,
                  filled: true,
                  suffixIcon: IconButton(
                    icon: const Icon(
                      Icons.mic,
                      size: 27,
                      color: Color(0xFF000000),
                    ),
                    onPressed: () {},
                  ),
                  isDense: true,
                  contentPadding: const EdgeInsets.all(0)),
            ),
          ),
        ],
      ),
    );
  }

  //App bar size
  @override
  Size get preferredSize => Size(double.maxFinite, isSearchBarExist ? 140 : 80);
}
