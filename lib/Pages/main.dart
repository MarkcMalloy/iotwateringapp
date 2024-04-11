import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:iotwateringapp/Pages/MyPlants/my_plants_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  /// Controller to handle PageView and also handles initial page
  final _pageController = PageController(initialPage: 0);

  /// Controller to handle bottom nav bar and also handles initial page
  final _controller = NotchBottomBarController(index: 0);

  int maxCount = 5;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  /// widget list
  final List<Widget> bottomBarPages = [
    MyPlantsPage(),
    Container(),
    Container(),
    Container(),
    Container(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: PageView(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: List.generate(
              bottomBarPages.length, (index) => bottomBarPages[index]),
        ),
        bottomNavigationBar: AnimatedNotchBottomBar(
          notchBottomBarController: _controller,
          bottomBarItems: const [
            BottomBarItem(
              inActiveItem: Icon(Icons.home),
              activeItem: Icon(Icons.home),
              itemLabel: 'Dashboard',
            ),
            BottomBarItem(
              inActiveItem: Icon(Icons.home),
              activeItem: Icon(Icons.home),
              itemLabel: 'Irrigation',
            ),
            BottomBarItem(
              inActiveItem: Icon(Icons.home),
              activeItem: Icon(Icons.home),
              itemLabel: 'Solar',
            ),
            BottomBarItem(
              inActiveItem: Icon(Icons.home),
              activeItem: Icon(Icons.home),
              itemLabel: 'Profile',
            ),
          ],
          onTap: (index) {
            /// perform action on tab change and to update pages you can update pages without pages
            print('current selected index $index');
            _pageController.jumpToPage(index);
          }, kIconSize: 20, kBottomRadius: 12.0,
        ),
      ),
    );
  }
}
