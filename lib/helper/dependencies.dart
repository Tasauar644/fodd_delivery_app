import 'package:food_delivery_app/utils/app_constants.dart';
import 'package:get/get.dart';

import '../controllers/populer_product_controller.dart';
import '../data/api/api_class.dart';
import '../data/repository/popular_food_repo.dart';

Future<void> init() async{

    //Api Client
Get.lazyPut(() => ApiClient(appBaseUrl:AppConstants.APP_URL));


    //Repos
Get.lazyPut(() =>PopularProductRepo(apiClient:Get.find()));

    //controller
Get.lazyPut(() =>PopularProductController(popularProductRepo:Get.find()));




}