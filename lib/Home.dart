import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/controler/controler%20.dart';

import 'package:shop_app/model/productmodel.dart';

class Homepage extends StatelessWidget {
  Homepage({Key? key}) : super(key: key);

  final productcontrler productcontroler = Get.put(productcontrler());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.shopify_rounded),
              ),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'ShopX',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
                ),
                const SizedBox(
                  width: 150,
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.view_list_rounded),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.grid_view_outlined),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView(
              children: [
                Obx(
                  () => GridView.builder(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: productcontroler.productList.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 0.75,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      final product = productcontroler.productList[index];
                      return Container(
                        decoration: BoxDecoration(
                          border: Border.all(width: .3),
                          color: Color.fromARGB(255, 255, 255, 255),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        height: 280,
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            Image.network(
                              product.imageLink,
                              fit: BoxFit.cover,
                              width: 130,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Text(
                                product.name,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  '${product.price} ₹',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                ),
                                if (product.rating != null)
                                  Container(
                                    height: 30,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Color.fromARGB(255, 99, 214, 114),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Center(
                                            child: Text(
                                                '${(product.rating.toString())}')),
                                        Icon(
                                          Icons.star,
                                          size: 20,
                                        ),
                                      ],
                                    ),
                                  ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
