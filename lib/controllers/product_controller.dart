import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:getx_api_demo/models/product.dart';
import 'package:http/http.dart' as http;

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
    // RemoteService().getApiData();
    await RemoteService().fetchData().then((value) {
      productList.assignAll(value);
      isLoading(false);

      /// jalankan perintah update() agar widget yang mengimplementasikan state management mengupdate perubahan datanya
      /// Data berubah namun tampilan tidak akan berubah tanpa perintah update()
      update();
    }).catchError((e) {
      log("error $e");
    });
  }
}

class RemoteService extends GetConnect {
  static var client = http.Client();
  Future getApiData() async {
    final response = await http.get(
        Uri.parse(
            "https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline"),
        headers: {
          "Accept": "application/json",
          "Access-Control-Allow-Origin": "*"
        });

    print(response.statusCode);
    print(response.body);
  }

  /// Api untuk Get Data
  Future<List<Product>> fetchData() async {
    Map<String, String> headers = {
      'Access-Control-Allow-Headers':
          'Origin, Content-Type, Accept, Authorization, Token',
      'Access-Control-Expose-Headers': "" 'Authorization, authenticated',
      'Access-Control-Allow-Origin': '*',
      'Access-Control-Allow-Methods': 'GET, OPTIONS',
      'Access-Control-Allow-Credentials': 'true',
    };
    print("testtt");
    return await get(
        'https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline',
        contentType: 'application/x-www-form-urlencoded; charset=utf-8',
        headers: headers, decoder: (data) {
      print("data $data");
      return List<Product>.from(data.map((e) => Product.fromJson(e)));
    }).then((value) {
      if (value.isOk) {
        log(value.body.toString());
        return value.body;
      } else {
        throw value.statusText;
      }
    }).catchError((e) => throw e);
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
