import 'package:flutter/material.dart';

import '../ui_helper/ui_helper.dart';

class Avatar extends StatelessWidget {
  final String image;

  const Avatar(
      {Key key, this.image = 'https://cdn2.thecatapi.com/images/bn9.jpg'})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      widthFactor: 0.7,
      alignment: Alignment.centerLeft,
      child: CircleAvatar(
        radius: Dimens.size20,
        backgroundImage: NetworkImage(image),
      ),
    );
  }
}