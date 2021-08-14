import 'package:flutter/material.dart';

import '../ui_helper/ui_helper.dart';
import 'bottom_item.dart';

class BottomNav extends StatelessWidget {
  final Function(int) callBack;
  final int selectedIndex;

  const BottomNav({Key key, this.callBack, this.selectedIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: Dimens.size16),
      padding: const EdgeInsets.symmetric(horizontal: Dimens.size32),
      height: Dimens.size100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(Dimens.size60),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: () {
              callBack(0);
            },
            child: BottomItem(
              icon: Icon(Icons.home),
              iconSelected: Icon(
                Icons.home_outlined,
                color: Colors.white,
              ),
              title: 'Home',
              isSelected: selectedIndex == 0,
            ),
          ),
          GestureDetector(
            onTap: () {
              callBack(1);
            },
            child: BottomItem(
              icon: Icon(Icons.folder),
              iconSelected: Icon(
                Icons.folder_open,
                color: Colors.white,
              ),
              title: 'Files',
              isSelected: selectedIndex == 1,
            ),
          ),
          GestureDetector(
            onTap: () {
              callBack(2);
            },
            child: BottomItem(
              icon: Icon(Icons.supervisor_account_rounded),
              iconSelected: Icon(
                Icons.supervisor_account_outlined,
                color: Colors.white,
              ),
              title: 'Friends',
            ),
          ),
          GestureDetector(
            onTap: () {
              callBack(4);
            },
            child: CircleAvatar(
              backgroundColor: Colors.black,
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}