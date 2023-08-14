import 'package:flutter/widgets.dart';
import 'package:food_delivery_app/pages/cart/cart_page.dart';
import 'package:get/get.dart';

import '../pages/food/popular_food_detail.dart';
import '../pages/food/recommended_food_details.dart';
import '../pages/home/main_food_page.dart';

class RouteHelper {
  static const String initial = "/";
  static const String popularFood = "/popular-food";
  static const String recommendedFood = "/recommended-food";
  static const String cartPage = "/cart-page";

  static String getRecommendedFood(int pageId,String page) => '$recommendedFood?pageId=$pageId&page=$page';
  static String getInitial() => '$initial';
  static String getPopularFood(int pageId,String page) => '$popularFood?pageId=$pageId&page=$page';
  static String getCartPage() => '$cartPage';

  static List<GetPage> routes = [
    GetPage(name: initial, page: () => MainFoodPage()),

    GetPage(
      name: popularFood,
      page: () {
        var pageId = Get.parameters['pageId'];
        var page=Get.parameters['page'];

        //print(pageId);
        return PopularFoodDetails(pageId: int.parse(pageId!),page:page!);
      },
      transition: Transition.fadeIn,
    ),

    GetPage(
      name: recommendedFood,
      page: () {
        var pageId = Get.parameters['pageId'];
        var page= Get.parameters['page'];
        //print(pageId);
        return RecommendedFoodDetails(pageId: int.parse(pageId!),page:page!);
      },
      transition: Transition.fade,
    ),

    GetPage(name: cartPage, page: () {
      return CartPage();
    }
    ),
  ];
}
