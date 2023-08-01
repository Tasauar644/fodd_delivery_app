import 'package:food_delivery_app/models/products_model.dart';
import 'package:get/get.dart';

import '../data/repository/popular_food_repo.dart';

class PopularProductController extends GetxController{

  final PopularProductRepo popularProductRepo;
  List<dynamic> _popularProductList=[];
  List<dynamic> get popularProductList=>_popularProductList;

  PopularProductController({required this.popularProductRepo});

  Future<void> getPopularProductList() async{

     Response response= await popularProductRepo.getProductList();
     if(response.statusCode==200){
       print("got products");
       _popularProductList=[];
       _popularProductList.addAll(Product.fromJson(response.body).products);
       update();
     }
     else{
       print("Did not get products");

     }
  }



}