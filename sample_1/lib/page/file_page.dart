import 'package:flutter/material.dart';

import '../ui_helper/ui_helper.dart';
import '../model/models.dart';

class FilePage extends StatelessWidget {
  final List<Category> categories = [
    Category('Nature', 'https://cdn2.thecatapi.com/images/MTkxODQzNA.png',
        '6.2K files'),
    Category('Nature', 'https://cdn2.thecatapi.com/images/MTkxODQzNA.png',
        '6.2K files'),
    Category('Nature', 'https://cdn2.thecatapi.com/images/MTkxODQzNA.png',
        '6.2K files'),
    Category('Nature', 'https://cdn2.thecatapi.com/images/MTkxODQzNA.png',
        '6.2K files'),
    Category('Nature', 'https://cdn2.thecatapi.com/images/MTkxODQzNA.png',
        '6.2K files'),
    Category('Nature', 'https://cdn2.thecatapi.com/images/MTkxODQzNA.png',
        '6.2K files'),
    Category('Nature', 'https://cdn2.thecatapi.com/images/MTkxODQzNA.png',
        '6.2K files'),
    Category('Nature', 'https://cdn2.thecatapi.com/images/MTkxODQzNA.png',
        '6.2K files'),
    Category('Nature', 'https://cdn2.thecatapi.com/images/MTkxODQzNA.png',
        '6.2K files'),
    Category('Nature', 'https://cdn2.thecatapi.com/images/MTkxODQzNA.png',
        '6.2K files'),
    Category('Nature', 'https://cdn2.thecatapi.com/images/MTkxODQzNA.png',
        '6.2K files'),
    Category('Nature', 'https://cdn2.thecatapi.com/images/MTkxODQzNA.png',
        '6.2K files'),
    Category('Nature', 'https://cdn2.thecatapi.com/images/MTkxODQzNA.png',
        '6.2K files'),
    Category('Nature', 'https://cdn2.thecatapi.com/images/MTkxODQzNA.png',
        '6.2K files'),
    Category('Nature', 'https://cdn2.thecatapi.com/images/MTkxODQzNA.png',
        '6.2K files'),
    Category('Nature', 'https://cdn2.thecatapi.com/images/MTkxODQzNA.png',
        '6.2K files'),
    Category('Nature', 'https://cdn2.thecatapi.com/images/MTkxODQzNA.png',
        '6.2K files'),
    Category('Nature', 'https://cdn2.thecatapi.com/images/MTkxODQzNA.png',
        '6.2K files'),
    Category('Nature', 'https://cdn2.thecatapi.com/images/MTkxODQzNA.png',
        '6.2K files'),
    Category('Nature', 'https://cdn2.thecatapi.com/images/MTkxODQzNA.png',
        '6.2K files'),
    Category('Nature', 'https://cdn2.thecatapi.com/images/MTkxODQzNA.png',
        '6.2K files'),
    Category('Nature', 'https://cdn2.thecatapi.com/images/MTkxODQzNA.png',
        '6.2K files'),
  ];

  @override
  Widget build(BuildContext context) {
    final widthOfGridItem = (MediaQuery.of(context).size.width -
        2 * Dimens.size16 -
        2 * Dimens.size20) /
        3;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: Dimens.size40, vertical: Dimens.size60),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'All files',
                        style: TextStyle(
                          fontSize: Dimens.size32,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          CircleAvatar(
                            radius: Dimens.size20,
                            backgroundImage: NetworkImage(
                                'https://cdn2.thecatapi.com/images/PR2ZRQtL0.jpg'),
                          ),
                          Positioned(
                              top: -6,
                              right: -6,
                              child: CircleAvatar(
                                radius: Dimens.size12,
                                backgroundColor: Colors.redAccent,
                                child: Text('6'),
                              )),
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: Dimens.size40),
                  padding: const EdgeInsets.symmetric(
                      vertical: Dimens.size16, horizontal: Dimens.size16),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(Dimens.size32),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.search),
                      const SizedBox(
                        width: Dimens.size16,
                      ),
                      Text('Search your file'),
                    ],
                  ),
                ),
                const SizedBox(height: Dimens.size20),
                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: Dimens.size40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Date modified',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Icon(Icons.keyboard_arrow_down_outlined)
                        ],
                      ),
                      Stack(
                        alignment: Alignment.centerRight,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(
                                left: Dimens.size8,
                                top: Dimens.size8,
                                bottom: Dimens.size8,
                                right: Dimens.size60),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius:
                              BorderRadius.circular(Dimens.size32),
                            ),
                            child: Icon(Icons.image),
                          ),
                          CircleAvatar(
                            radius: Dimens.size22,
                            backgroundColor: Colors.black,
                            child: Icon(Icons.apps),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Column(
                  children: [
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
                              semanticChildCount: categories.length,
                              physics: NeverScrollableScrollPhysics(),
                              crossAxisSpacing: Dimens.size16,
                              mainAxisSpacing: Dimens.size16,
                              childAspectRatio: 3 / 5,
                              children: categories
                                  .map((category) => Container(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Stack(
                                      alignment: Alignment.bottomCenter,
                                      children: [
                                        Container(
                                          clipBehavior: Clip.antiAlias,
                                          height: widthOfGridItem,
                                          width: widthOfGridItem,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(
                                                Dimens.size16),
                                          ),
                                          child: Image.network(
                                            category.imageUrl,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Container(
                                          margin: const EdgeInsets.symmetric(vertical: Dimens.size8),
                                          padding:
                                          const EdgeInsets.symmetric(
                                              horizontal: Dimens.size16,
                                              vertical: Dimens.size8),
                                          decoration: BoxDecoration(
                                            color: Colors.grey.shade200
                                                .withOpacity(0.5),
                                            borderRadius:
                                            BorderRadius.circular(
                                                Dimens.size20),
                                          ),
                                          child: Text(category.contains),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: Dimens.size8,
                                    ),
                                    Container(
                                      padding:
                                      const EdgeInsets.symmetric(
                                          horizontal: Dimens.size16,
                                          vertical: Dimens.size8),
                                      child: Text(category.name),
                                    ),
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
                const SizedBox(height: Dimens.size160,)
              ],
            ),
          ),
        ],
      ),
    );
  }
}