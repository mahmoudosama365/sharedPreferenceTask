import 'package:flutter/material.dart';
import 'package:flutter_application_2/ui/home/tabs/favorite/favorite_tab.dart';
import 'package:flutter_application_2/ui/home/tabs/home_tab/add_event.dart';
import 'package:flutter_application_2/ui/home/tabs/home_tab/home_tab.dart';
import 'package:flutter_application_2/ui/home/tabs/map/map_tab.dart';
import 'package:flutter_application_2/ui/home/tabs/profile/profile_tab.dart';
import 'package:flutter_application_2/utils/appColors.dart';
import 'package:flutter_application_2/utils/assets_manager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class HomeScreen extends StatefulWidget {
   HomeScreen({super.key});
  static const String routeName = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0 ;
  List<Widget> tabs = [
    HomeTab() , MapTab() , FavoriteTab(), ProfileTab()
  ];

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Appcolors.primaryLight,
      ),

      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Appcolors.transparentColor ,
          
        ),
        child: BottomAppBar(
          padding: EdgeInsets.zero,
          color: Theme.of(context).primaryColor,
          shape: CircularNotchedRectangle(),
          notchMargin: 4,
          child: BottomNavigationBar(
            
            currentIndex: selectedIndex,
            onTap: (index){
                selectedIndex = index ;
                setState(() {
                  
                });
            },
            items: [
            builtBottomNavBarItems(
              unSelectesIconName: AssetsManager.iconHome,
              iconSelectedName: AssetsManager.selectesHome,
              index:  0,
              label: AppLocalizations.of(context)!.home),
          
             builtBottomNavBarItems(
              unSelectesIconName: AssetsManager.icomMap,
              iconSelectedName: AssetsManager.selectedMap,
              index:  1,
              label: AppLocalizations.of(context)!.map),
          
             builtBottomNavBarItems(
              unSelectesIconName: AssetsManager.iconFavorite,
              iconSelectedName: AssetsManager.selectedFavorite,
              index:  2,
              label: AppLocalizations.of(context)!.favorite),
          
             builtBottomNavBarItems(
              unSelectesIconName: AssetsManager.iconProfile,
              iconSelectedName: AssetsManager.selectedProfile,
               index:  3,
            label: AppLocalizations.of(context)!.profile),
          
          ]),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.of(context).pushNamed(AddEvent.routeName);
        },
        child: Icon(Icons.add,color: Appcolors.whiteColor,size: 30,),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: tabs[selectedIndex],
    );
  }

  BottomNavigationBarItem builtBottomNavBarItems(
      {required String unSelectesIconName, required String label,
      required int index,required String iconSelectedName,}) {
    return BottomNavigationBarItem(
      icon: ImageIcon(AssetImage(selectedIndex == index ?
       iconSelectedName : unSelectesIconName),),
      label: label
    );
  }
}
