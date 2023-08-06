import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/cart_model.dart';
import 'package:food_delivery_app/models/products_model.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:get/get.dart';
import '../data/repository/popular_food_repo.dart';
import 'cart_controller.dart';

class PopularProductController extends GetxController {

  final PopularProductRepo popularProductRepo;
  List<dynamic> _popularProductList = [];

  List<dynamic> get popularProductList => _popularProductList;
  int _quantity = 0;

  int get quantity => _quantity;
  int _inCartItems = 0;

  int get intCartItems => _inCartItems + _quantity;

  late CartController _cart;

  PopularProductController({required this.popularProductRepo});

  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getProductList();
    if (response.statusCode == 200) {
      //print("got products");
      _popularProductList = [];
      _popularProductList.addAll(Product
          .fromJson(response.body)
          .products);
      update();
    }
    else {
      // print("Did not get products");

    }
  }


  void setQuantity(bool isIncrement) {
    if (isIncrement) {
      _quantity++;
      print("Increment" + _quantity.toString());
    }
    else {
      _quantity = checkIt(_quantity - 1);
      print("Decrement " + _quantity.toString());
    }
    update();
  }

  int checkIt(int number) {
    if ((_inCartItems + quantity) <= 0) {
      Get.snackbar("You can not reduce more!", "Order can not be negative",
        backgroundColor: Colors.white,
        colorText: Colors.black87,);
      return 0;
    }
    else {
      return number;
    }
  }

  void clearInIt(ProductModel productModel, CartController cart) {
    _quantity = 0;
    _inCartItems = 0;
    _cart = cart;
    var exist = false;
    exist = _cart.existInCart(productModel);

    //print("Exist or not: "+exist.toString());

    if (exist) {
      _inCartItems = _cart.getQuantity(productModel);
    }
    print("The total item in the cart is: " + _inCartItems.toString());
  }


  void addItem(ProductModel productModel) {
    _cart.addItem(productModel, _quantity);
    _quantity = 0;
    _inCartItems = _cart.getQuantity(productModel);

    _cart.items.forEach((key, value) {
      print("The id is "+value.id.toString()+" the quantity is "+value.quantity.toString());

    });
  }
}