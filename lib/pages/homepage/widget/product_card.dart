import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tezda/config/colors.dart';
import 'package:tezda/config/style.dart';
import 'package:tezda/controller/product_controller.dart';
import 'package:tezda/model/products.dart';
import 'package:tezda/pages/homepage/widget/product_detail.dart';

class ProductCard extends StatelessWidget {
  final Products products;
  final bool isgrid;
  const ProductCard({super.key, required this.products, required this.isgrid});

  @override
  Widget build(BuildContext context) {
    var productProvider = Provider.of<ProductController>(context);
    return Stack(
      children: [
        InkWell(
          onTap: () => Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (_) => ProductDetails(products: products),
            ),
          ),
          child: Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    color: AppColor.white,
                    child: CachedNetworkImage(
                      imageUrl: products.image,
                      height: isgrid ? 130 : 90,
                      width: isgrid ? double.infinity : 100,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Container(
                  width: 100,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        products.title,
                        style: style.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: isgrid ? 13 : 11,
                        ),
                        maxLines: 2,
                      ),
                      const SizedBox(height: 4.0),
                      Text(
                        '\$${products.price.toStringAsFixed(2)}',
                        style: style.copyWith(
                          color: AppColor.orange,
                          fontWeight: FontWeight.bold,
                          fontSize: isgrid ? 14 : 11,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        Positioned(
          top: 10,
          right: 10,
          child: InkWell(
            onTap: () {
              productProvider.handleFavourite(products);
            },
            child: CircleAvatar(
              radius: 14,
              backgroundColor: AppColor.primaryColor,
              child: Icon(
                Icons.favorite,
                color: productProvider.favouriteProduct.contains(products)
                    ? AppColor.orange
                    : AppColor.grey,
                size: 16,
              ),
            ),
          ),
        )
      ],
    );
  }
}
