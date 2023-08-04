import 'package:food_delivery_app/data/repository/cart_controller_repo.dart';
import 'package:food_delivery_app/utils/app_constants.dart';
import 'package:get/get.dart';

import '../controllers/cart_controller.dart';
import '../controllers/populer_product_controller.dart';
import '../controllers/recommended_product_controller.dart';
import '../data/api/api_class.dart';
import '../data/repository/popular_food_repo.dart';
import '../data/repository/recommended_product_repo.dart';

Future<void> init() async{

    //Api Client
Get.lazyPut(() => ApiClient(appBaseUrl:AppConstants.APP_URL));


    //Repos
Get.lazyPut(() =>PopularProductRepo(apiClient:Get.find()));
Get.lazyPut(() =>RecommendedProductRepo(apiClient:Get.find()));
Get.lazyPut(()=>CartRepo());

    //controller
Get.lazyPut(() =>PopularProductController(popularProductRepo:Get.find()));
Get.lazyPut(() =>RecommendedProductController(recommendedProductRepo:Get.find()));
Get.lazyPut(() => CartController(cartRepo:Get.find()));




}