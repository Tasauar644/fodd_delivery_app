import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/controllers/recommended_product_controller.dart';
import 'package:food_delivery_app/routes/route_helper.dart';
import 'package:food_delivery_app/utils/app_constants.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/widgets/BigText.dart';
import 'package:food_delivery_app/widgets/app_column.dart';
import 'package:food_delivery_app/widgets/app_icon.dart';
import 'package:food_delivery_app/widgets/expandable_text_widget.dart';
import 'package:get/get.dart';

import '../../controllers/cart_controller.dart';
import '../../controllers/populer_product_controller.dart';

class RecommendedFoodDetails extends StatelessWidget {
  var pageId;
   RecommendedFoodDetails(
      {
        super.key,required this.pageId
      }
      );

  @override
  Widget build(BuildContext context) {
    var product=Get.find<RecommendedProductController>().recommendedProductList[pageId];
    Get.find<PopularProductController>().clearInIt(product,Get.find<CartController>());
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 100,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
               GestureDetector(
                onTap: (){
                  Get.toNamed(RouteHelper.getInitial());
                }
                   ,child: AppIconWidget(icon: Icons.clear)),
                GetBuilder<PopularProductController>(builder:(controllerObject){
                  return Stack(
                    children: [
                      AppIconWidget(icon: Icons.shopping_cart_outlined,size: Dimensions.widgetSize50,backGroundColor: Colors.white,),
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
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(0),
            child: Container(
              width: double.maxFinite,
              padding: EdgeInsets.only(top: Dimensions.height15/3,bottom: Dimensions.height15/3),
              child: Center(
                  child: BigText(text: product.name!)),
              decoration: BoxDecoration(
                  color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Dimensions.radius20),
                  topRight: Radius.circular(Dimensions.radius20)
                )
              ),
            ),
              
            ),
            pinned: true,
            backgroundColor: Colors.deepOrange,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                  AppConstants.APP_URL+"/uploads/"+product.img!,
              width: double.maxFinite,
              fit: BoxFit.cover,
              ),

            ),
          ),
          SliverToBoxAdapter(
            child: Container(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: Dimensions.width20,right: Dimensions.width20),
                      child: ExpandableTextWidget(text:product.description!),
                    )
                  ],
                )
          )
          )
        ],
      ),
      bottomNavigationBar: GetBuilder<PopularProductController>(builder: (recommendedObject){
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.only(
                  left: Dimensions.width20,
                  right: Dimensions.width20,
                  top: Dimensions.height15,
                  bottom: Dimensions.width10
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap:(){
                      recommendedObject.setQuantity(false);

                    },
                child: AppIconWidget(icon: Icons.remove)),
                  BigText(text: "\$ ${product.price!}"+" X "+"${recommendedObject.intCartItems}",color: Appcolors.mainblackcolor,),
                  GestureDetector(
                    onTap: (){
                      recommendedObject.setQuantity(true);
                    },
                      child: AppIconWidget(icon: Icons.add))

                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //first -0+ container
                Container(
                    padding: EdgeInsets.only(top: Dimensions.height15,bottom: Dimensions.height15,right: Dimensions.width10,left: Dimensions.width10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimensions.radius20),
                        color: Colors.white
                    ),
                    child:Container(
                      margin: EdgeInsets.only(left: Dimensions.width10),
                      child: Icon(Icons.favorite,
                        color: Appcolors.maincolor,
                        size: 50,),
                    )


                ),
                GestureDetector(
                  onTap: (){
                    recommendedObject.addItem(product);
                  },
                  child: Container(
                    padding: EdgeInsets.only(top: Dimensions.height15,bottom: Dimensions.height15,right: Dimensions.width10,left: Dimensions.width10),
                    margin: EdgeInsets.only(right: Dimensions.width10,bottom: Dimensions.height15),
                    child: BigText(text: "\$ ${product.price!} add to cart",color: Colors.white,),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius20/2),
                      color: Appcolors.maincolor,
                    ),
                  ),
                )
              ],
            ),

          ],
        );
      }),
    );
  }
}
