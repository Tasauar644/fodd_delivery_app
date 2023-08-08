import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/widgets/BigText.dart';
import 'package:food_delivery_app/widgets/SmallText.dart';
import 'package:food_delivery_app/widgets/app_icon.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              top: Dimensions.height15*3,left: Dimensions.width20,right: Dimensions.width20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppIconWidget(icon: Icons.arrow_back_ios,iconColor:Colors.white,backGroundColor: Appcolors.maincolor,),
              SizedBox(width: Dimensions.width20*4),
              AppIconWidget(icon: Icons.home_outlined,iconColor:Colors.white,backGroundColor: Appcolors.maincolor,),
              AppIconWidget(icon: Icons.shopping_cart_outlined,iconColor:Colors.white,backGroundColor: Appcolors.maincolor,),

            ],
          )),
          Positioned(
              top: Dimensions.height30*3,
              left: Dimensions.width20,
              right: Dimensions.width20,
              bottom: 0,
              child: Container(
              //  color: Colors.red,
                child: MediaQuery.removePadding(
                  context: context,
                   removeTop: true,
                  child: ListView.builder(
                      itemCount: 10,
                      itemBuilder: (context,index){

                        return Container(
                          margin: EdgeInsets.only(top: Dimensions.height15),
                          width: double.maxFinite,
                          height: 100,
                          child: Row(
                            children: [
                                 Container(
                                   margin: EdgeInsets.only(bottom: Dimensions.height12),
                                   width: Dimensions.height30*4,
                                   height: Dimensions.height30*4,
                                   decoration: BoxDecoration(
                                     image: DecorationImage(
                                       fit: BoxFit.cover,
                                       image: AssetImage(
                                         "assets/images/food.jpg"
                                       )
                                     ),
                                     borderRadius: BorderRadius.circular(Dimensions.radius20),
                                     color: Colors.white
                                   ),
                                 ),
                              SizedBox(width: Dimensions.width10,),
                              Expanded(child: Container(
                                height: Dimensions.height30*4,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    BigText(text: "Birynai is a delicious",color: Colors.black54,),
                                    SmallText(text: "Spicy"),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        BigText(text: "25",color: Colors.red,),
                                        Container(
                                          padding: EdgeInsets.only(top: Dimensions.height15,bottom: Dimensions.height15,right: Dimensions.width10,left: Dimensions.width10),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(Dimensions.radius20),
                                              color: Colors.white
                                          ),
                                          child: Row(

                                            children: [
                                              GestureDetector(
                                                  onTap: (){

                                                  },
                                                  child: Icon(Icons.remove,color: Appcolors.signcolor,)),
                                              SizedBox(width: Dimensions.width5,),
                                              BigText(text: "0"),
                                              SizedBox(width: Dimensions.width5,),
                                              GestureDetector(
                                                  onTap: (){

                                                  },
                                                  child: Icon(Icons.add,color: Appcolors.signcolor,)),
                                            ],
                                          ),


                                        )
                                        
                                      ],
                                    )

                                  


                                  ],
                                ),
                              ))

                            ],
                          ),
                        );

                  }),
                ),
              ))
        ],

      ),

    );
  }
}
