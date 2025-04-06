import 'package:flutter/material.dart';
import 'package:flutter_application_2/tabs/hadeth/hadethTab.dart';
import 'package:flutter_application_2/tabs/quran/quranTab.dart';
import 'package:flutter_application_2/tabs/radio/radioTab.dart';
import 'package:flutter_application_2/tabs/sebha/sebhaTab.dart';
import 'package:flutter_application_2/tabs/time/timeTab.dart';
import 'package:flutter_application_2/utils/app_assets.dart';
import 'package:flutter_application_2/utils/app_colors.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});
  static const String routeName = 'homee';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List <String> backgroundImages = [
    AppAssets.quranBg,
    AppAssets.hadethBg,
    AppAssets.sebhaBg,
    AppAssets.radioBg,
    AppAssets.timeBg,
  ];
  List <Widget> tabsList = [
    Qurantab() ,Hadethtab() ,Sebhatab(), Radiotab(),Timetab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          backgroundImages[selectedIndex],
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: AppColors.whitecolor,
            unselectedItemColor: AppColors.blackcolor,
            showUnselectedLabels: false,
            type: BottomNavigationBarType.fixed,
            backgroundColor: AppColors.primarycolor,
            currentIndex: selectedIndex,
            onTap: (value) {
              selectedIndex = value;
              setState(() {});
            },
            items: [
              BottomNavigationBarItem(
                label: 'Quran',
                icon:
                    builtItemsInBottomNavBar(imageName: 'firsticon', index: 0),
              ),
              BottomNavigationBarItem(
                label: 'Hadeth',
                icon:
                    builtItemsInBottomNavBar(imageName: 'secondicon', index: 1),
              ),
              BottomNavigationBarItem(
                label: 'Sebha',
                icon:
                    builtItemsInBottomNavBar(imageName: 'thirdicon', index: 2),
              ),
              BottomNavigationBarItem(
                label: 'Radio',
                icon:
                    builtItemsInBottomNavBar(imageName: 'fourthicon', index: 3),
              ),
              BottomNavigationBarItem(
                label: 'Time',
                icon:
                    builtItemsInBottomNavBar(imageName: 'fifthicon', index: 4),
              ),
            ],
          ),
          body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(AppAssets.logo),
              Expanded(child: tabsList[selectedIndex]),
            ],
          )
        ),
      ],
    );
  }

  Widget builtItemsInBottomNavBar(
      {required int index, required String imageName}) {
    return selectedIndex == index
        ? Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(66),
              color: AppColors.blackBgColor,
            ),
            child: ImageIcon(
              AssetImage('assets/$imageName.png'),
            ),
          )
        : ImageIcon(
            AssetImage('assets/$imageName.png'),
          );
  }
}
