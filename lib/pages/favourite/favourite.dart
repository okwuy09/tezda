import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tezda/config/colors.dart';
import 'package:tezda/config/style.dart';
import 'package:tezda/controller/product_controller.dart';
import 'package:tezda/pages/homepage/widget/product_card.dart';

class FavouritePage extends StatelessWidget {
  const FavouritePage({super.key});

  @override
  Widget build(BuildContext context) {
    var productProvider = Provider.of<ProductController>(context);
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Favourite products',
          style: style.copyWith(
              color: AppColor.orange,
              fontSize: 20,
              fontWeight: FontWeight.w600),
        ),
        actions: [
          Icon(
            CupertinoIcons.search,
            color: AppColor.primaryColor,
          ),
          const SizedBox(width: 20),
          Stack(
            children: [
              Icon(
                Icons.shopping_cart_outlined,
                color: AppColor.primaryColor,
                size: 26,
              ),
              Positioned(
                  right: 0,
                  top: 0,
                  child: CircleAvatar(
                      radius: 6.5,
                      backgroundColor: AppColor.orange,
                      child: Text(
                        '2',
                        style: style.copyWith(
                          fontSize: 8,
                          color: AppColor.white,
                          fontWeight: FontWeight.bold,
                        ),
                      )))
            ],
          ),
          const SizedBox(width: 30),
        ],
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                imageUrl:
                    'https://assets.materialup.com/uploads/6ec43bb8-d7b1-4e1d-9f44-68f7fcb817b5/attachment.jpg',
                height: 100,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 2.0,
                mainAxisSpacing: 2.0,
                mainAxisExtent: 210,
              ),
              itemCount: productProvider.favouriteProduct.length,
              itemBuilder: (context, index) {
                return ProductCard(
                  products: productProvider.favouriteProduct[index],
                  isgrid: true,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
