import 'dart:convert';

import 'package:get/get.dart';
import 'package:getx_api_demo/models/product.dart';

class ProductController extends GetxController {
  var isLoading = true.obs;
  var productList = <Product>[];

  /// fungsi onInit() adalah fungsi yang pertama kali dijalankan ketika memanggil class controller
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchProduct();
  }

  void fetchProduct() async {
    isLoading(true);
    await RemoteService().fetchData().then((value) {
      productList.assignAll(value);
      isLoading(false);

      /// jalankan perintah update() agar widget yang mengimplementasikan state management mengupdate perubahan datanya
      /// Data berubah namun tampilan tidak akan berubah tanpa perintah update()
      update();
    }).catchError((e) {});
  }
}

class RemoteService extends GetConnect {
  /// Api untuk Get Data
  Future<List<Product>> fetchData() async {
    return await get(
      'https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline',
      decoder: (data) =>
          List<Product>.from(data.map((e) => Product.fromJson(e))),
    ).then((value) => value.body).catchError((e) => throw e);
  }

  /// API untuk get data hanya dari salah satu element response
  Future<Product> fetchDataFromOneElement() async {
    // Jika return bertipe List, gunakan List<T>.from(data['(variable element)'].map((e)=>T.fromJson(e)))
    return await get(
      'https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline',
      decoder: (data) => Product.fromJson(data['provider']),
    ).then((value) => value.body).catchError((e) => throw e);
  }

  /// API post atau put data dengan menggunakan model
  Future<int> postDataWithModel(Product postData) async {
    return await post(
            'https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline',
            postData.toJson())
        .then((value) => value.statusCode)
        .catchError((e) => throw e);
  }

  /// API post atau put data dengan tanpa menggunakan model
  Future<int> postDataWithParameter(
      String productName, double productPrice) async {
    var jsonData =
        jsonEncode({'productName': productName, 'productPrice': productPrice});
    return await post(
            'https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline',
            jsonData)
        .then((value) => value.statusCode)
        .catchError((e) => throw e);
  }
}
