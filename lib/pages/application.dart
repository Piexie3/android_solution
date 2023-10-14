import 'package:android_solution/pages/home_screen.dart';
import 'package:android_solution/utils/global.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Application extends StatefulWidget {
  const Application({super.key});

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  int _page = 0;
  late PageController controller;

  @override
  void initState() {
    super.initState();
    controller = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  void navigationTapped(int page) {
    controller.jumpToPage(page);
  }

  void onpageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedLabelStyle: TextStyle(color: Colors.green),
        unselectedLabelStyle: TextStyle(color: Colors.grey),
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: _page == 0 ? Colors.green : Colors.grey,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              color: _page == 1 ? Colors.green : Colors.grey,
            ),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.camera,
              color: _page == 2 ? Colors.green : Colors.grey,
            ),
            label: "Predict",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.chart_bar_alt_fill,
              color: _page == 3 ? Colors.green : Colors.grey,
            ),
            label: "Statistics",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: _page == 4 ? Colors.green : Colors.grey,
            ),
            label: "Account",
          ),
        ],
        onTap: navigationTapped,
      ),
      body: PageView(
        controller: controller,
        onPageChanged: onpageChanged,
        physics: NeverScrollableScrollPhysics(),
        children: navScreens,
      ),
    );
  }
}
