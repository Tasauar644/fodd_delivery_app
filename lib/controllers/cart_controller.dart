import 'package:flutter/material.dart';
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
    var totalQuantity=0;
    if(_items.containsKey(productModel.id)){
      _items.update(productModel.id!, (value) {
     //   print("update "+value.id.toString()+" to quantity "+quantity.toString());
        totalQuantity=value.quantity!+quantity;
        print("totalQuantity is "+totalQuantity.toString());
        return CartModel(
          id:value.id,
          name:value.name,
          price: value.price,
          img : value.img,
          quantity:value.quantity!+quantity,
          isExist:true,
          time:DateTime.now().toString(),
        );
      });
    }
      if(quantity<=0){
        _items.remove(productModel.id);
      }


    else{
      if(quantity>0){
        _items.putIfAbsent(productModel.id!, () {
         // print("adding to the cart "+productModel.id.toString()+" quantity "+quantity.toString());
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
      else{
        Get.snackbar("Warning","You have to add at least one item",
          backgroundColor:Colors.white,
          colorText: Colors.black87,);
      }
    }

    
  }

  bool existInCart(ProductModel productModel){
    if(_items.containsKey(productModel.id)){

      return true;
    }
    return false;

  }

  int getQuantity(ProductModel productModel){
    var quantity=0;
    if(_items.containsKey(productModel.id)){
      _items.forEach((key, value) {
        if(key==productModel.id){
          quantity= value.quantity!;
        }
      });
      return quantity;
    }
    return 0;

  }

  int get totalitems{
    var totalQuantity=0;

    _items.forEach((key, value) {
      totalQuantity+=value.quantity!;
    });

    return totalQuantity;

  }

}