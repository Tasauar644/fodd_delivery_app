import 'package:flutter/material.dart';
import 'package:food_delivery_app/controllers/cart_controller.dart';
import 'package:food_delivery_app/controllers/populer_product_controller.dart';
import 'package:food_delivery_app/models/cart_model.dart';
import 'package:food_delivery_app/routes/route_helper.dart';
import 'package:food_delivery_app/utils/app_constants.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/widgets/BigText.dart';
import 'package:food_delivery_app/widgets/app_column.dart';
import 'package:food_delivery_app/widgets/app_icon.dart';
import 'package:food_delivery_app/widgets/expandable_text_widget.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../cart/cart_page.dart';

class PopularFoodDetails extends StatelessWidget {
  int pageId;
  final String page;
   PopularFoodDetails({super.key,
    required this.pageId,
   required this.page}
      );

  @override
  Widget build(BuildContext context) {
    var product=Get.find<PopularProductController>().popularProductList[pageId];
    Get.find<PopularProductController>().clearInIt(product,Get.find<CartController>());
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
                    image: NetworkImage(
                      AppConstants.APP_URL+"/uploads/"+product.img!
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
                  GestureDetector(
                  onTap: (){
                   if(page=="cartpage"){
                     Get.toNamed(RouteHelper.getCartPage());
                   }
                   else{
                     Get.toNamed(RouteHelper.getInitial());
                   }
                  }
                  ,child: AppIconWidget(icon: Icons.arrow_back_ios,size: Dimensions.widgetSize50,backGroundColor: Colors.white,)
              ),
                  GetBuilder<PopularProductController>(builder:(controllerObject){
                    return Stack(
                      children: [
                         GestureDetector(
                           onTap: (){
                             if(controllerObject.totalItems>=1){
                               Get.toNamed(RouteHelper.getCartPage());
                             }
                             else{

                             }
                           }
                           ,child: AppIconWidget(icon: Icons.shopping_cart_outlined,size: Dimensions.widgetSize50,backGroundColor: Colors.white,)),
                        controllerObject.totalItems>=1?
                            Positioned(
                              top: 0,right: 0
                                ,child: AppIconWidget(icon: Icons.circle,size: 20,iconColor: Colors.transparent,backGroundColor: Appcolors.maincolor,)):
                            Container(),
                        controllerObject.totalItems>=1?
                        Positioned(
                            top: 3,right: 3,
                            child: BigText(text: controllerObject.totalItems.toString(),size: 12,color: Colors.white,)):
                        Container(),

                      ],
                    );
                  }

                  ),

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
                    AppIcon(text: product.name!),
                    SizedBox(height: Dimensions.height12,),
                    BigText(text: "Introduce"),
                    SizedBox(height: Dimensions.height12,),
                    Expanded(
                      child: SingleChildScrollView(
                          child: ExpandableTextWidget(text: product.description!)),
                    )
                  ],
                ),
              ) ),


        ],
      ),
      bottomNavigationBar: GetBuilder<PopularProductController>(builder: (popularProductControllerObject){
       return Container(
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
                    GestureDetector(
                        onTap: (){
                          Get.find<PopularProductController>().setQuantity(false);

                        },
                        child: Icon(Icons.remove,color: Appcolors.signcolor,)),
                    SizedBox(width: Dimensions.width5,),
                    BigText(text: popularProductControllerObject.intCartItems.toString()),
                    SizedBox(width: Dimensions.width5,),
                    GestureDetector(
                        onTap: (){
                          Get.find<PopularProductController>().setQuantity(true);
                        },
                        child: Icon(Icons.add,color: Appcolors.signcolor,)),
                  ],
                ),


              ),
              Container(
                padding: EdgeInsets.only(top: Dimensions.height15,bottom: Dimensions.height15,right: Dimensions.width10,left: Dimensions.width10),
                child: GestureDetector(
                    onTap: (){
                      popularProductControllerObject.addItem(product);
                    }, child: BigText(text: "\$ ${product.price!} "+"Add to cart",color: Colors.white,)),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  color: Appcolors.maincolor,
                ),
              )
            ],
          ),
        );
      })
      
    );
  }
}
