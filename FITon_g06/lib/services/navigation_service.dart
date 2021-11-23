import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

import '../core.dart';

class NavigationService {
  List<BottomBarItem> getNavigationItemList() {
    return <BottomBarItem>[
      BottomBarItem(isCustomWidget: true),
      BottomBarItem(
          backgroundColor: kFirstColor,
          icon: Icon(
            LineIcons.userAlt,
            color: Colors.black54,
          ),
          activeIcon: Icon(LineIcons.user),
          title: "Map"),
      BottomBarItem(
          backgroundColor: kFirstColor,
          icon: Icon(
            LineIcons.userAlt,
            color: Colors.black54,
          ),
          activeIcon: Icon(LineIcons.user),
          title: "Friends"),
      BottomBarItem(
          backgroundColor: kFirstColor,
          icon: Icon(
            LineIcons.home,
            color: Colors.black54,
          ),
          activeIcon: Icon(LineIcons.home),
          title: "Pics"),
      BottomBarItem(
          backgroundColor: kFirstColor,
          icon: Icon(
            LineIcons.userAlt,
            color: Colors.black54,
          ),
          activeIcon: Icon(LineIcons.user),
          title: "Profiles")
    ];
  }
}
