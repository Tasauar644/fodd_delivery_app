import 'package:food_delivery_app/data/api/api_class.dart';
import 'package:food_delivery_app/utils/app_constants.dart';
import 'package:get/get.dart';

class RecommendedProductRepo extends GetxService{

  final ApiClient apiClient;

  RecommendedProductRepo({required this.apiClient});


  Future<Response> getRecommendedProductListRepo() async{

    return await apiClient.getData(AppConstants.RECOMMENDED_PRODUCT_URL);

  }
}