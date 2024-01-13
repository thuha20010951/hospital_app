import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';
import 'package:hospital_app/controller/tab_index_controller.dart';
import 'package:hospital_app/screen/home_screen.dart';

void main() {
  runApp(GetMaterialApp(
    theme: ThemeData(scaffoldBackgroundColor: const Color(0XFFF6F6F6)),
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  final List _navbarIcons = [
    Icons.content_paste_outlined,
    Icons.single_bed,
    Icons.settings,
  ];
  @override
  Widget build(context) {
    final c = Get.put(TabIndexController());

    return Obx(() => Scaffold(
        bottomNavigationBar: Container(
          height: 68,
          decoration: BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(
              color: Colors.blueGrey.withOpacity(.3),
              blurRadius: 4,
              spreadRadius: 2,
              offset: Offset(0, 1),
            )
          ]),
          child: Wrap(
              alignment: WrapAlignment.spaceEvenly,
              runAlignment: WrapAlignment.center,
              children: List.generate(
                  _navbarIcons.length,
                  (index) => _bottomBarItem(
                      icon: _navbarIcons[index],
                      changeIndex: () => c.changeIndex(index: index),
                      isActive: index == c.currentIndex.value))),
        ),
        body: IndexedStack(
          index: c.currentIndex.value,
          children: [HomeScreen()],
        )));
  }
}

Widget _bottomBarItem(
    {required IconData icon,
    required VoidCallback changeIndex,
    required bool isActive}) {
  return GestureDetector(
    onTap: changeIndex,
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 52,
          width: 52,
          decoration: BoxDecoration(
            color: isActive ? Color(0xFF0D124C) : Colors.white,
            borderRadius: BorderRadius.circular(50),
            boxShadow: [
              if (isActive)
                BoxShadow(
                  color: Colors.black87.withOpacity(.3),
                  blurRadius: 4,
                  spreadRadius: 1,
                  offset: Offset(0, 1),
                )
            ],
          ),
          child: Icon(
            icon,
            size: 28,
            color: isActive ? Colors.white : Colors.grey[400],
          ),
        ),
      ],
    ),
  );
}
