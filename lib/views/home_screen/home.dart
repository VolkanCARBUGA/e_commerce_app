import 'package:e_commerce_app/consts/consts.dart';
import 'package:e_commerce_app/controllers/home_controller.dart';
import 'package:e_commerce_app/views/cart_screen/cart_screen.dart';
import 'package:e_commerce_app/views/category_screen/category_screen.dart';
import 'package:e_commerce_app/views/home_screen/home_screen.dart';
import 'package:e_commerce_app/views/profile_screen/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(HomeController());
    var navBarItem = [
      BottomNavigationBarItem(
          icon: Image.asset(
            icHome,
            width: 30,
          ),
          label: home),
      BottomNavigationBarItem(
          icon: Image.asset(
            icCategories,
            width: 30,
          ),
          label: categories),
      BottomNavigationBarItem(
          icon: Image.asset(
            icCart,
            width: 30,
          ),
          label: cart),
      BottomNavigationBarItem(
          icon: Image.asset(
            icProfile,
            width: 30,
          ),
          label: account),
    ];
    var navBody = [
      HomeScreen(),
      CategoryScreen(),
      CartScreen(),
      ProfileScreen()
    ];
    return Scaffold(
      body: Column(children: [
        Obx(() =>
            Expanded(child: navBody.elementAt(controller.currentIndex.value)))
      ]),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.currentIndex.value,
          items: navBarItem,
          selectedItemColor: redColor,
          backgroundColor: whiteColor,
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle: TextStyle(fontFamily: semibold),
          onTap: (value) {
            controller.currentIndex.value = value;
          },
        ),
      ),
    );
  }
}
