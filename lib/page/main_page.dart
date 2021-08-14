import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../widgets/widgets.dart';
import '../page/pages.dart';

class MainApp extends StatefulWidget {
  const MainApp({Key key}) : super(key: key);

  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int currentPage = 0;

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    super.initState();
  }

  void switchPage(int pageIndex) {
    if (pageIndex < pages.length) {
      setState(() {
        currentPage = pageIndex ?? 0;
      });
    }
  }

  List<Widget> pages = [
    HomePage(),
    FilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          pages[currentPage],
           BottomNav(
            selectedIndex: currentPage,
            callBack: (index) {
              switchPage(index);
            },
          ),
        ],
      ),
     );
  }
}