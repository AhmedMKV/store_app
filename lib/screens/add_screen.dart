import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/helper/show_snack_bar.dart';
import 'package:store_app/widgets/custom_text_field.dart';

import '../services/add_product.dart';

import '../widgets/custom_button.dart';

class AddProductScreen extends StatefulWidget {
  static String addScreenId = 'Add Screen';

  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<AddProductScreen> {
  String? productName, desc, image;

  String? price, category;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
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
                  height: 10,
                ),
                CustomTextFields(
                  onChanged: (data) {
                    category = data;
                  },
                  hint: 'category',
                ),
                SizedBox(
                  height: 70,
                ),
                CustomButton(
                  buttonText: 'Add',
                  onTap: () async {
                    isLoading = true;
                    setState(() {});
                    try {
                      await addProduct();

                      showSnackBar(context, 'success');
                    } catch (e) {
                      print(e.toString());
                    }
                    isLoading = false;
                    setState(() {});
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> addProduct() async {
    await AddProduct().addProduct(
        title: productName!,
        price: price!,
        desc: desc!,
        image: image!,
        category: category!);
  }
}
