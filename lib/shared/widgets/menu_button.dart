import 'package:postos_locais/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MenuBottomNavBarWidget extends StatelessWidget {
  const MenuBottomNavBarWidget({
    this.currentIndex = 0,
    @required this.items,
    this.onTap,
    Key key,
  }) : super(key: key);

  final int currentIndex;
  final Function(int) onTap;
  final List<BottomBarItem> items;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      width: Get.size.width,
      color: Color(0xFF242538),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: items.map((item) {
            if (item.isCustomWidget ?? false)
              return GestureDetector(
                onTap: () => onTap(items.indexOf(item)),
                child: CustomIcon(
                    color: currentIndex == items.indexOf(item)
                        ? kFirstColor
                        : Color(0xFF707070)),
              );
            else
              return InkWell(
                onTap: () => onTap(items.indexOf(item)),
                child: Text(
                  item.title,
                  style: TextStyle(
                    color: currentIndex == items.indexOf(item)
                        ? kFirstColor
                        : Color(0xFF707070),
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              );
          }).toList(),
        ),
      ),
    );
  }
}
