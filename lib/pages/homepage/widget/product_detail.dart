import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tezda/config/colors.dart';
import 'package:tezda/config/constant.dart';
import 'package:tezda/config/style.dart';
import 'package:tezda/model/products.dart';
import 'package:tezda/widget/navigation_box.dart';

class ProductDetails extends StatelessWidget {
  final Products products;
  const ProductDetails({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.grey,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColor.grey,
        toolbarHeight: 60,
        title: Row(
          children: [
            NavigationBox(onTap: () => Navigator.pop(context)),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Stack(
              children: [
                ClipRRect(
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30)),
                    child: Container(
                      color: AppColor.white,
                      child: CachedNetworkImage(
                        imageUrl: products.image,
                        height: Constants.screenHeight / 2.1,
                        width: double.infinity,
                        fit: BoxFit.contain,
                      ),
                    )),
                Positioned(
                    top: 10,
                    right: 20,
                    child: CircleAvatar(
                      radius: 18,
                      backgroundColor: AppColor.primaryColor,
                      child: Icon(
                        Icons.favorite,
                        color: AppColor.grey,
                        size: 20,
                      ),
                    ))
              ],
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    products.title,
                    style: style.copyWith(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '\$${products.price.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 18,
                      color: AppColor.orange,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    products.description,
                    style: style.copyWith(fontSize: 16),
                  ),
                  const SizedBox(height: 16),
                  Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor.primaryColor),
                      onPressed: () {},
                      child: Text(
                        'Add to Cart',
                        style: style.copyWith(color: AppColor.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
