import 'package:flutter/material.dart';
import 'package:food_delivery_app/controllers/recommended_product_controller.dart';
import 'package:food_delivery_app/pages/cart/cart_page.dart';
import 'package:food_delivery_app/pages/food/popular_food_detail.dart';
import 'package:food_delivery_app/pages/food/recommended_food_details.dart';
import 'package:food_delivery_app/pages/home/main_food_page.dart';
import 'package:food_delivery_app/pages/splash/splash_screen.dart';
import 'package:food_delivery_app/routes/route_helper.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'controllers/populer_product_controller.dart';
import 'helper/dependencies.dart' as dep;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //Get.find<PopularProductController>().getPopularProductList();
    //Get.find<RecommendedProductController>().getRecommendedProductList();
    return GetBuilder<PopularProductController>(builder:(_){
      return GetBuilder<RecommendedProductController>(builder: (_){
        return GetMaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          //home: SplashScreen(),
          initialRoute: RouteHelper.getSplashScreen(),
          getPages:RouteHelper.routes,
        );
      });
    });
  }
}

