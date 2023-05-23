import 'package:app_tourism/config/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../config/app_asset.dart';
import '../controller/c_home.dart';
import 'wisata_page.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final cHome = Get.put(CHome());
  final List<Map> listNav = [
    {'icon': AppAsset.iconWisata, 'label': 'Wisata'},
    {'icon': AppAsset.iconHistory, 'label': 'History'},
    {'icon': AppAsset.iconPayment, 'label': 'Payment'},
    {'icon': AppAsset.iconSetting, 'label': 'Setting'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (cHome.indexPage == 1) {
          return const Center(child: Text('History'));
        }
        return WisatabyPage();
      }), 
      bottomNavigationBar: Obx(() {
          return Material(
            elevation: 8,
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.only(top: 8, bottom: 6),
              child: BottomNavigationBar(
                currentIndex: cHome.indexPage,
                onTap: (value)=>cHome.indexPage=value,
                elevation: 0,
                backgroundColor: Colors.transparent,
              type: BottomNavigationBarType.fixed,
              unselectedItemColor: Colors.grey,
              selectedItemColor: Colors.blue,
              selectedIconTheme: const IconThemeData(
                color: AppColor.primary,
              ),
              selectedLabelStyle: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
              selectedFontSize: 12,
                items: listNav.map((e) {
                return BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage(e['icon'])),
                  label: e['label'],
                  );
              }).toList(),
              ),
            ),
          );
        }
      ),
    );
  }
}