import 'dart:ui';

import 'package:flutter/material.dart';

import '../ui_helper/ui_helper.dart';

class ImageModel {
  final String imageUrl;
  final String imageName;

  ImageModel(this.imageUrl, this.imageName);
}

class GalleryCategoryPage extends StatelessWidget {
  GalleryCategoryPage({Key key}) : super(key: key);

  final List<ImageModel> images = [
    ImageModel('https://cdn2.thecatapi.com/images/6jk.jpg', 'nature 1'),
    ImageModel('https://cdn2.thecatapi.com/images/6jk.jpg', 'nature 2'),
    ImageModel('https://cdn2.thecatapi.com/images/6jk.jpg', 'nature 3'),
    ImageModel('https://cdn2.thecatapi.com/images/6jk.jpg', 'nature 4'),
    ImageModel('https://cdn2.thecatapi.com/images/6jk.jpg', 'nature 5'),
    ImageModel('https://cdn2.thecatapi.com/images/6jk.jpg', 'nature 1'),
    ImageModel('https://cdn2.thecatapi.com/images/6jk.jpg', 'nature 2'),
    ImageModel('https://cdn2.thecatapi.com/images/6jk.jpg', 'nature 3'),
    ImageModel('https://cdn2.thecatapi.com/images/6jk.jpg', 'nature 4'),
    ImageModel('https://cdn2.thecatapi.com/images/6jk.jpg', 'nature 5'),
    ImageModel('https://cdn2.thecatapi.com/images/6jk.jpg', 'nature 1'),
    ImageModel('https://cdn2.thecatapi.com/images/6jk.jpg', 'nature 2'),
    ImageModel('https://cdn2.thecatapi.com/images/6jk.jpg', 'nature 3'),
    ImageModel('https://cdn2.thecatapi.com/images/6jk.jpg', 'nature 4'),
    ImageModel('https://cdn2.thecatapi.com/images/6jk.jpg', 'nature 5'),
  ];

  @override
  Widget build(BuildContext context) {
    final widthOfGridItem = (MediaQuery.of(context).size.width- 2*Dimens.size16 - 2*Dimens.size20)/3 ;
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            height: 400,
            alignment: Alignment.topCenter,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        'https://cdn2.thecatapi.com/images/bq5.jpg'),
                    fit: BoxFit.cover)),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: Dimens.size20),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: Dimens.size40, vertical: Dimens.size60),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                          ),
                          Column(
                            children: [
                              Text(
                                'Modified by Tyler 2m agp',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: Dimens.size16,
                                ),
                              ),
                              Text(
                                'Nature',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: Dimens.size32,
                                ),
                              )
                            ],
                          ),
                          Icon(
                            Icons.menu,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: Dimens.size20),
                    ClipRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: Dimens.size16,
                              horizontal: Dimens.size32),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(Dimens.size32),
                          ),
                          child: Text(
                            '68 pictures',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: Dimens.size28,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: Dimens.size20),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(Dimens.size32),
                            topRight: Radius.circular(Dimens.size32),
                          )),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: Dimens.size40, vertical: Dimens.size16),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: Dimens.size16,
                            ),
                            GridView.count(
                              crossAxisCount: 3,
                              shrinkWrap: true,
                              semanticChildCount: images.length,
                              physics: NeverScrollableScrollPhysics(),
                              crossAxisSpacing: Dimens.size16,
                              mainAxisSpacing: Dimens.size16,
                              childAspectRatio: 3/6,
                              children: images
                                  .map((image) => Container(
                                         child: Column(
                                           mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Container(
                                              clipBehavior: Clip.antiAlias,
                                              height: widthOfGridItem,
                                              width: widthOfGridItem,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(Dimens.size16),
                                              ),
                                              child: Image.network(image.imageUrl, fit: BoxFit.cover,),
                                            ),
                                            const SizedBox(height: Dimens.size8,),
                                            Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal:
                                                            Dimens.size16,
                                                        vertical: Dimens.size8),
                                                decoration: BoxDecoration(
                                                  color: Colors.grey.shade200
                                                      .withOpacity(0.5),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          Dimens.size20),
                                                ),
                                                child: Text(image.imageName, textAlign: TextAlign.center, overflow: TextOverflow.ellipsis, maxLines: 2,)),
                                          ],
                                        ),
                                      ))
                                  .toList(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
