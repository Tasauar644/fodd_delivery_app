import 'package:food_delivery_app/data/repository/cart_controller_repo.dart';
import 'package:food_delivery_app/models/products_model.dart';
import 'package:get/get.dart';

import '../models/cart_model.dart';

class CartController extends GetxController{

  final CartRepo cartRepo;
  CartController({required this.cartRepo});

  Map<int,CartModel> _items={};
  Map<int,CartModel> get items=>_items;


  void addItem(ProductModel productModel,int quantity){

    if(_items.containsKey(productModel.id)){
      _items.update(productModel.id!, (value) {
        return CartModel(
          id:productModel.id,
          name:productModel.name,
          price: productModel.price,
          img : productModel.img,
          quantity:quantity,
          isExist:true,
          time:DateTime.now().toString(),
        );
      });
    }

    else{
    _items.putIfAbsent(productModel.id!, () {
    print("adding to the cart "+productModel.id.toString()+"quantity "+quantity.toString());
    return CartModel(
    id:productModel.id,
    name:productModel.name,
    price: productModel.price,
    img : productModel.img,
    quantity:quantity,
    isExist:true,
    time:DateTime.now().toString(),
    );});
    }

    
  }


}