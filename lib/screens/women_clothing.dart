import 'package:flutter/material.dart';
import 'package:store_app/services/categories_service.dart';

import '../models/product_model.dart';
import '../widgets/custom_card.dart';

class WomenClothing extends StatelessWidget {
  const WomenClothing({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          'New Trend',
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart))
        ],
      ),
      body: Padding(
          padding: EdgeInsets.only(top: 70, left: 16, right: 16, bottom: 16),
          child: FutureBuilder<List<ProductModel>>(
              future: CategoriesService()
                  .getCategoriesProducts(categoryName: "women's clothing"),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<ProductModel> products = snapshot.data!;
                  return GridView.builder(
                      clipBehavior: Clip.none,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1.5,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 70),
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        return CustomCard(
                          product: products[index],
                        );
                      });
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              })),
    );
  }
}
