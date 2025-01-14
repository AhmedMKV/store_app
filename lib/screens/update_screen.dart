import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/widgets/custom_text_field.dart';

import '../models/product_model.dart';
import '../services/update_product.dart';
import '../widgets/custom_button.dart';

class UpdateProductPage extends StatefulWidget {
  static String updateScreenId = 'update product';

  const UpdateProductPage({super.key});

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  String? productName, desc, image;

  String? price;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Update Product',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 100,
                ),
                CustomTextFields(
                  onChanged: (data) {
                    productName = data;
                  },
                  hint: 'Product Name',
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextFields(
                  onChanged: (data) {
                    desc = data;
                  },
                  hint: 'description',
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextFields(
                  onChanged: (data) {
                    price = data;
                  },
                  hint: 'price',
                  inputType: TextInputType.number,
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextFields(
                  onChanged: (data) {
                    image = data;
                  },
                  hint: 'image',
                ),
                SizedBox(
                  height: 70,
                ),
                CustomButton(
                  buttonText: 'Update',
                  onTap: () async {
                    isLoading = true;
                    setState(() {});
                    try {
                      await updateProduct(product);

                      print('success');
                    } catch (e) {
                      print(e.toString());
                    }
                    isLoading = false;
                    setState(() {});
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> updateProduct(ProductModel product) async {
    await UpdateProductService().updateProduct(
        id: product.id,
        title: productName == null ? product.title : productName!,
        price: price == null ? product.price.toString() : price!,
        desc: desc == null ? product.description : desc!,
        image: image == null ? product.image : image!,
        category: product.category);
  }
}
