import 'package:flutter/material.dart';
import 'package:store_app/screens/add_screen.dart';
import 'package:store_app/services/get_all_products_service.dart';

import '../models/product_model.dart';
import '../widgets/custom_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static String homeScreenId = 'HomeScreen';

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
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, AddProductScreen.addScreenId);
              },
              icon: Icon(Icons.shopping_cart))
        ],
      ),
      body: Padding(
          padding: EdgeInsets.only(top: 70, left: 16, right: 16, bottom: 16),
          child: FutureBuilder<List<ProductModel>>(
              future: AllProductsService().getAllProducts(),
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
