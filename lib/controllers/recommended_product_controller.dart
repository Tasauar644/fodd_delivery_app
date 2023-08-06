import 'package:food_delivery_app/models/products_model.dart';
import 'package:get/get.dart';
import '../data/repository/recommended_product_repo.dart';

class RecommendedProductController extends GetxController{

  final RecommendedProductRepo recommendedProductRepo;
  List<dynamic> _recommendedProductList=[];
  List<dynamic> get recommendedProductList=>_recommendedProductList;

      RecommendedProductController({required this.recommendedProductRepo });

  Future<void> getRecommendedProductList() async{

    Response response= await recommendedProductRepo.getRecommendedProductListRepo();
    if(response.statusCode==200){
     // print("got products recommended");
      _recommendedProductList=[];
      _recommendedProductList.addAll(Product.fromJson(response.body).products);
      update();
    }
    else{
    //  print("Did not get recommended products");

    }
  }



}