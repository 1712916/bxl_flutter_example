import 'package:flutter/material.dart';

import '../ui_helper/ui_helper.dart';
import '../widgets/widgets.dart';
import '../page/pages.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: Dimens.size40, vertical: Dimens.size60),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Today\nactivity',
                      style: TextStyle(
                        fontSize: Dimens.size32,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Row(
                      children: [
                        Avatar(
                          image: 'https://cdn2.thecatapi.com/images/efq.jpg',
                        ),
                        Avatar(
                          image: 'https://cdn2.thecatapi.com/images/bhg.jpg',
                        ),
                        Avatar(
                          image: 'https://cdn2.thecatapi.com/images/3t6.jpg',
                        ),
                        Align(
                          widthFactor: 0.7,
                          alignment: Alignment.centerLeft,
                          child: CircleAvatar(
                            radius: Dimens.size20,
                            backgroundColor: Colors.grey.shade200,
                            child: Text(
                              '+6',
                              style: TextStyle(
                                color: Colors.black38,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(height: Dimens.size20),
                Text(
                  'The photographer team',
                  style: TextStyle(
                    fontWeight: FontWeight.w200,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: Dimens.size20),
          Column(
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => GalleryCategoryPage()));
                },
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Container(
                        height: Dimens.size60,
                        width: Dimens.size60,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(Dimens.size16),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          'N',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: Dimens.size20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      const SizedBox(width: Dimens.size16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Nature',
                            style: TextStyle(
                              fontSize: Dimens.size16,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                '6 images added by Tyler',
                                style: TextStyle(
                                  fontWeight: FontWeight.w200,
                                ),
                              ),
                              const SizedBox(width: Dimens.size8),
                              CircleAvatar(
                                radius: Dimens.size4,
                                backgroundColor: Colors.black38,
                              ),
                              const SizedBox(width: Dimens.size8),
                              Text(
                                '2m ago',
                                style: TextStyle(
                                  fontWeight: FontWeight.w200,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: Dimens.size20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  padding: const EdgeInsets.only(bottom: Dimens.size20),
                  child: Row(
                    children: [
                      const SizedBox(width: Dimens.size40),
                      ImageCard(),
                      const SizedBox(width: Dimens.size20),
                      ImageCard(),
                      const SizedBox(width: Dimens.size20),
                      ImageCard(),
                      const SizedBox(width: Dimens.size20),
                    ],
                  ),
                ),
              ),
              Row(
                children: [
                  const SizedBox(width: Dimens.size40),
                  CircleAvatar(
                    radius: Dimens.size8,
                    backgroundColor: Colors.redAccent,
                  ),
                  const SizedBox(width: Dimens.size8),
                  Text(
                    '6 new comments',
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: Dimens.size32),

            ],
          ),
          const SizedBox(height: Dimens.size160,)
        ],
      ),
    );
  }
}