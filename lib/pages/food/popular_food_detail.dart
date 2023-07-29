import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/widgets/BigText.dart';
import 'package:food_delivery_app/widgets/app_column.dart';
import 'package:food_delivery_app/widgets/app_icon.dart';
import 'package:food_delivery_app/widgets/expandable_text_widget.dart';

class PopularFoodDetails extends StatelessWidget {
  const PopularFoodDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //picture
          Positioned(
            left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: Dimensions.popularFoodImageHeight350,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      "assets/images/food.jpg",
                    )
                  )
                ),
              )),
          // icon widgets
          Positioned(
            top: Dimensions.height30,
            left: Dimensions.width10,
              right:Dimensions.width10 ,
              child:Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppIconWidget(icon: Icons.arrow_back_ios,size: Dimensions.widgetSize50,),
                  AppIconWidget(icon: Icons.shopping_cart_outlined,size: Dimensions.widgetSize50,)
                  

                ],
              ) ),
          //introduction to food and Expandable text
          Positioned(
            left: 0,
              right: 0,
              bottom: 0,
              top: Dimensions.popularFoodImageHeight350-20,
              child:Container(
                padding: EdgeInsets.only(left: Dimensions.width20,right: Dimensions.width20,top: Dimensions.height30-10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(Dimensions.width20),
                    topLeft:  Radius.circular(Dimensions.width20),
                  ),
                  color: Colors.white,
                ),
                child:Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppIcon(text: "Biriyani site"),
                    SizedBox(height: Dimensions.height12,),
                    BigText(text: "Introduce"),
                    SizedBox(height: Dimensions.height12,),
                    Expanded(
                      child: SingleChildScrollView(
                          child: ExpandableTextWidget(text: "orem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.")),
                    )
                  ],
                ),
              ) ),


        ],
      ),
      bottomNavigationBar: Container(
        height: Dimensions.navigatorHeight120,
        padding: EdgeInsets.only(top: Dimensions.height30,bottom: Dimensions.height30,left: Dimensions.width20,right: Dimensions.width20),
        decoration: BoxDecoration(
          color: Appcolors.buttonbackgroundcolor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Dimensions.radius20),
            topRight: Radius.circular(Dimensions.radius20)
          )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //first -0+ container
            Container(
              padding: EdgeInsets.only(top: Dimensions.height15,bottom: Dimensions.height15,right: Dimensions.width10,left: Dimensions.width10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: Colors.white
              ),
              child: Row(
                children: [
                  Icon(Icons.remove,color: Appcolors.signcolor,),
                  SizedBox(width: Dimensions.width5,),
                  BigText(text: "0"),
                  SizedBox(width: Dimensions.width5,),
                  Icon(Icons.add,color: Appcolors.signcolor,),
                ],
              ),


            ),
            Container(
              padding: EdgeInsets.only(top: Dimensions.height15,bottom: Dimensions.height15,right: Dimensions.width10,left: Dimensions.width10),

              child: BigText(text: "100tk add to cart",color: Colors.white,),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: Appcolors.maincolor,
              ),
            )
          ],
        ),
      ),
      
    );
  }
}
