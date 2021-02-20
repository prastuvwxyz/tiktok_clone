import 'package:flutter/material.dart';
import 'package:tiktok_clone/pages/home_page.dart';
import 'package:tiktok_clone/theme/colors.dart';
import 'package:tiktok_clone/widgets/tiktok_icons.dart';
import 'package:tiktok_clone/widgets/upload_icon.dart';

class RootApp extends StatefulWidget {
  @override
  _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
      bottomNavigationBar: getFooter(),
    );
  }

  Widget getBody() {
    return IndexedStack(
      index: pageIndex,
      children: [
        HomePage(),
        Center(
          child: Text(
            "Discover",
            style: TextStyle(
                color: black, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Center(
          child: Text(
            "Upload",
            style: TextStyle(
                color: black, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Center(
          child: Text(
            "All Activity",
            style: TextStyle(
                color: black, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Center(
          child: Text(
            "Profile",
            style: TextStyle(
                color: black, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }

  Widget getFooter() {
    List bottomItems = [
      {"icon": TiktokIcons.home, "label": "Home", "is_icon": true},
      {"icon": TiktokIcons.search, "label": "Discover", "is_icon": true},
      {"icon": "", "label": "", "is_icon": false},
      {"icon": TiktokIcons.chatBubble, "label": "Inbox", "is_icon": true},
      {"icon": TiktokIcons.profile, "label": "Me", "is_icon": true}
    ];
    return Container(
      width: double.infinity,
      height: 40,
      decoration: BoxDecoration(
        color: appBgColor,
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 8),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(bottomItems.length, (index) {
              return bottomItems[index]["is_icon"]
                  ? InkWell(
                      onTap: () {
                        selectedTab(index);
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            bottomItems[index]["icon"],
                            color: white,
                            size: 15,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Center(
                            child: Text(
                              bottomItems[index]["label"],
                              style: TextStyle(color: white, fontSize: 10),
                            ),
                          )
                        ],
                      ),
                    )
                  : InkWell(
                      onTap: () {
                        selectedTab(index);
                      },
                      child: UploadIcon());
            })),
      ),
    );
  }

  selectedTab(index) {
    setState(() {
      pageIndex = index;
    });
  }
}
