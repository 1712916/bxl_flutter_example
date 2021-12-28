import 'package:flutter/material.dart';
import 'dissmiss_card/dissmiss_card.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: DissmissCard(
              removeMode: false,
               child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                child: GestureDetector(
                  onTap: () {
                    print('LOL');
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Title',
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        Text(
                          'Lorem ipsum dolor sit amet',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        Text(
                          'Lorem ipsum dolor sit amet',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        Text(
                          'Lorem ipsum dolor sit amet',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        Text(
                          'Lorem ipsum dolor sit amet',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        Text(
                          'Lorem ipsum dolor sit amet',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 16),
                  child: Icon(Icons.eighteen_mp),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Icon(Icons.eighteen_mp),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: DissmissCard(
                child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                child: GestureDetector(
                  onTap: () {
                    print('LOL');
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Title',
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        Text(
                          'Lorem ipsum dolor sit amet',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        Text(
                          'Lorem ipsum dolor sit amet',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        Text(
                          'Lorem ipsum dolor sit amet',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        Text(
                          'Lorem ipsum dolor sit amet',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        Text(
                          'Lorem ipsum dolor sit amet',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 16),
                  child: Icon(Icons.eighteen_mp),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Icon(Icons.eighteen_mp),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: DissmissCard(
              removeMode: true,
               child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                child: GestureDetector(
                  onTap: () {
                    print('LOL');
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Title',
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        Text(
                          'Lorem ipsum dolor sit amet',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        Text(
                          'Lorem ipsum dolor sit amet',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        Text(
                          'Lorem ipsum dolor sit amet',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        Text(
                          'Lorem ipsum dolor sit amet',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        Text(
                          'Lorem ipsum dolor sit amet',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 16),
                  child: Icon(Icons.eighteen_mp),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Icon(Icons.eighteen_mp),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: DissmissCard(
              removeMode: true,
               child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                child: GestureDetector(
                  onTap: () {
                    print('LOL');
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Title',
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        Text(
                          'Lorem ipsum dolor sit amet',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        Text(
                          'Lorem ipsum dolor sit amet',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        Text(
                          'Lorem ipsum dolor sit amet',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        Text(
                          'Lorem ipsum dolor sit amet',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        Text(
                          'Lorem ipsum dolor sit amet',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 16),
                  child: Icon(Icons.eighteen_mp),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Icon(Icons.eighteen_mp),
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
