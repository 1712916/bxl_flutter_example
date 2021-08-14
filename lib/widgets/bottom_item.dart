import 'package:flutter/material.dart';

import '../ui_helper/ui_helper.dart';

class BottomItem extends StatelessWidget {
  final Icon icon;
  final Icon iconSelected;
  final String title;
  final isSelected;

  const BottomItem(
      {Key key,
        @required this.icon,
        this.iconSelected,
        this.title,
        this.isSelected = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final body = !isSelected
        ? icon
        : Padding(
      padding: const EdgeInsets.all(Dimens.size16),
      child: Row(
        children: [
          iconSelected,
          const SizedBox(
            width: Dimens.size8,
          ),
          title != null && title.isNotEmpty
              ? Text(
            title,
            style: TextStyle(
              color: Colors.white,
            ),
          )
              : const SizedBox(),
        ],
      ),
    );
    return Container(
      decoration: isSelected
          ? BoxDecoration(
        borderRadius: BorderRadius.circular(Dimens.size32),
        color: Colors.black,
      )
          : null,
      child: body,
    );
  }
}