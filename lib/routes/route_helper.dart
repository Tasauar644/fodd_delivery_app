import 'package:get/get.dart';

import '../pages/food/popular_food_detail.dart';
import '../pages/food/recommended_food_details.dart';
import '../pages/home/main_food_page.dart';

class RouteHelper{
  static const String initial="/";
  static const String PopularFood="/popular-food";
  static const String RecommendedFood="/Recommended-food";


  static String getRecommendedFood(int pageId)=>'$RecommendedFood?pageId=$pageId';
  static String getInitial()=>'$initial';
  static String getPopularFood(int pageId)=>'$PopularFood?pageId=$pageId';



  static List<GetPage> routes=[
    //Main page
      GetPage(name: "/", page: ()=>MainFoodPage()),

    //Popular page
    GetPage(name: PopularFood, page: (){
      var pageId=Get.parameters['pageId'];
     print(pageId);
      return PopularFoodDetails(pageId:int.parse(pageId!));
    },transition: Transition.fadeIn),

    // RecommendedPage
    GetPage(name: RecommendedFood, page: (){
      var pageId= Get.parameters['pageId'];
      print(pageId);

      return RecommendedFoodDetails(pageId:int.parse(pageId!));
    },transition: Transition.fade),



  ];




}