import 'dart:ui';

import 'package:flutter/material.dart';

import '../ui_helper/ui_helper.dart';

class ImageCard extends StatelessWidget {
  final String image;

  const ImageCard(
      {Key key, this.image = 'https://cdn2.thecatapi.com/images/bq5.jpg'})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final imageWidth = MediaQuery.of(context).size.width * 2 / 3;
    return Material(
      borderRadius: BorderRadius.circular(Dimens.size16),
      elevation: Dimens.size8,
      child: Container(
        clipBehavior: Clip.antiAlias,
        width: imageWidth,
        height: imageWidth * 3 / 4,
        alignment: Alignment.bottomRight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimens.size16),
          image: DecorationImage(
            image: NetworkImage(image),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          margin: const EdgeInsets.all(Dimens.size16),
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimens.size16),
            color: Colors.grey.shade200.withOpacity(0.5),
          ),
          child: ClipRRect(
              child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                  child: Padding(
                    padding: const EdgeInsets.all(Dimens.size16),
                    child: Text('3.2 MB'),
                  ))),
        ),
      ),
    );
  }
}