import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:food_delivery_app/widgets/BigText.dart';
import 'package:food_delivery_app/widgets/SmallText.dart';

import 'food_page_body.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({super.key});

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {


  @override
  Widget build(BuildContext context) {
    //print("curernt value is "+MediaQuery.of(context).size.height.toString());
    
    return Scaffold(
      body: Column(
        children: [
          //showing the header
          Container(
            child: Container(
              margin: EdgeInsets.only(top: 45,bottom: 15),
              padding: EdgeInsets.only(left: 20,right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                     BigText(text: "Bangladesh",color: Appcolors.maincolor,),
                      Row(
                        children: [
                          SmallText(text: "Dhaka",color: Colors.black54,),
                          Icon(Icons.arrow_drop_down)
                        ],
                      )

                    ],
                  ),
                  Center(
                    child: Container(
                      width: 45,
                      height: 45,
                      child: Icon(Icons.search,color: Colors.white,),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Appcolors.maincolor,
                      ),

                    ),
                  )
                ],
              ),
            ),
          ),
          //showing the body
         Expanded(child: SingleChildScrollView(
           child:FoodPageBody(),
         ))
        ],
      ),
    );
  }
}
