import 'package:food_delivery_app/data/api/api_class.dart';
import 'package:food_delivery_app/utils/app_constants.dart';
import 'package:get/get.dart';

class PopularProductRepo extends GetxService{

  final ApiClient apiClient;

  PopularProductRepo({required this.apiClient});


  Future<Response> getProductList() async{

    return await apiClient.getData(AppConstants.POPULAR_PRODUCT_URL);

  }
}