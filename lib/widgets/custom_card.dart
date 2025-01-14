import 'package:flutter/material.dart';
import 'package:store_app/screens/update_screen.dart';

import '../models/product_model.dart';

class CustomCard extends StatelessWidget {
  CustomCard({super.key, required this.product});

  ProductModel product;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, UpdateProductPage.updateScreenId,
            arguments: product);
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            child: Card(
              elevation: 8,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          product.title.substring(0, 14),
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                        Text(
                          r'$' '${product.price.toString()}',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.favorite,
                          color: Colors.red,
                        ))
                  ],
                ),
              ),
            ),
          ),
          Positioned(
              right: 5,
              top: -60,
              child: Image.network(
                product.image,
                height: 140,
                width: 140,
              ))
        ],
      ),
    );
  }
}
