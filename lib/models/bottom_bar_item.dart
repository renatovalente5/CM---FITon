import 'package:flutter/material.dart';

class BottomBarItem {
  Color backgroundColor;
  Icon icon;
  Icon activeIcon;
  String title;
  bool isCustomWidget;

  BottomBarItem({
    this.backgroundColor,
    this.icon,
    this.activeIcon,
    this.title,
    this.isCustomWidget,
  });
}
