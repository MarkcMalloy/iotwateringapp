import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:iotwateringapp/Pages/MyPlants/my_plants_page.dart';
import 'package:iotwateringapp/Pages/connect_to_device_page.dart';
import 'package:iotwateringapp/Utils/colors.dart';

class TabbarPage extends StatefulWidget {
  const TabbarPage({Key? key}) : super(key: key);

  @override
  State<TabbarPage> createState() => _TabbarPageState();
}

class _TabbarPageState extends State<TabbarPage> {
  /// Controller to handle PageView and also handles initial page
  final _pageController = PageController(initialPage: 0);

  /// Controller to handle bottom nav bar and also handles initial page
  final _controller = NotchBottomBarController(index: 0);

  int maxCount = 3;

  static String address = "";

  void setIpAddress(String adr) {
    setState(() {
      address = adr;
    });
    print("Address set to $address");
  }

  String getIpAddress(){
    return address;
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }


  /// widget list
  @override
  Widget build(BuildContext context) {
    final List<Widget> bottomBarPages = [
      ConnectToDevicePage(function: setIpAddress,),
      MyPlantsPage(),
      Container(),
    ];

    return Scaffold(
      backgroundColor: ThemeColors.oliveDune,
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
            inActiveItem: Icon(Icons.settings),
            activeItem: Icon(Icons.settings),
            itemLabel: 'Connect',
          ),
          BottomBarItem(
            inActiveItem: Icon(Icons.water_drop),
            activeItem: Icon(Icons.water_drop_outlined),
            itemLabel: 'Irrigation',
          ),
          BottomBarItem(
            inActiveItem: Icon(Icons.solar_power),
            activeItem: Icon(Icons.solar_power),
            itemLabel: 'Solar',
          ),
        ],
        onTap: (index) {
          /// perform action on tab change and to update pages you can update pages without pages
          print('current selected index $index');
          _pageController.jumpToPage(index);
        }, kIconSize: 20, kBottomRadius: 12.0,
      ),
    );
  }
}
