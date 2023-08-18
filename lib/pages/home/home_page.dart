import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/pages/home/main_food_page.dart';
import 'package:food_delivery_app/utils/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedInsdex=0;
  List pages=[
    MainFoodPage(),
    Container(child: Center(child: Text("first page")),),
    Container(child: Center(child: Text("second page")),),
    Container(child: Center(child: Text("third page")),)
  ];
  void onTapnav(int index){
    setState(() {
      _selectedInsdex=index;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedInsdex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Appcolors.maincolor,
        unselectedItemColor: Colors.amber,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _selectedInsdex,
        onTap:onTapnav ,
        items:  [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
               label: "home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.archive),
              label: "history"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: "home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "home"),



        ],
      ),
    );
  }
}
