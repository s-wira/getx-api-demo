import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:getx_api_demo/controllers/product_controller.dart';
import 'package:getx_api_demo/views/product_tile.dart';

class Homepage extends StatelessWidget {
  /// Ingat panggil class controller yang akan digunakan
  /// Gunakan Get.put(....) jika class tidak pernah dipanggil sebelumnya
  /// gunnakan Get.find<T>() jika class pernah dipanggil di page sebelumnya
  final ProductController productController = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.black,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'ShopX',
                    style: TextStyle(
                        // fontFamily: 'avenir',
                        fontSize: 32,
                        fontWeight: FontWeight.w900),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.view_list_rounded),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.grid_view),
                  onPressed: () {},
                )
              ],
            ),
          ),
          Expanded(
            child: GetBuilder<ProductController>(
              builder: (controller) {
                /// controller disini berfungsi sebagai parameter dari class
                /// product controller
                if (controller.isLoading.value) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return StaggeredGridView.countBuilder(
                      crossAxisCount: 2,
                      itemCount: controller.productList.length,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
                      itemBuilder: (context, index) {
                        return ProductTile(controller.productList[index]);
                      },
                      staggeredTileBuilder: (index) => StaggeredTile.fit(1));
                }
              },
            ),

            /// Gunakan Obx ketika widget membutuhkan perubahan data secara terus menerus.
            /// Karena akan menghambat peforma aplikasi jika hanya digunakan untuk menampilkan
            /// data yang menunggu interaksi user untuk berubah
            /// Menggunakan obx tidak perlu perintah update() tiap kali ada perubahan data
            /// Eg. Widget text yang menampilkan jumlah orang yg melihat produk tsb

            // child: Obx(() {
            //   if (productController.isLoading.value) {
            //     return Center(
            //       child: CircularProgressIndicator(),
            //     );
            //   } else {
            //     return StaggeredGridView.countBuilder(
            //         crossAxisCount: 2,
            //         itemCount: productController.productList.length,
            //         mainAxisSpacing: 16,
            //         crossAxisSpacing: 16,
            //         itemBuilder: (context, index) {
            //           return ProductTile(productController.productList[index]);
            //         },
            //         staggeredTileBuilder: (index) => StaggeredTile.fit(1));
            //   }
            // }),
          )
        ],
      ),
    );
  }
}
