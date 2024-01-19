import 'package:flutter/material.dart';
import 'package:tezda/config/colors.dart';
import 'package:tezda/config/style.dart';

class FirstSlide extends StatelessWidget {
  final Function()? onTap;
  const FirstSlide({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    var screensize = MediaQuery.of(context).size;
    return Container(
      color: AppColor.white,
      child: Padding(
        padding: const EdgeInsets.only(top: 68),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 24),
                child: InkWell(
                  //Click to move to the next slide
                  onTap: onTap,
                  child: Text(
                    'Skip',
                    style: style.copyWith(color: AppColor.orange),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          // stack to position the graph image on top the device image
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Container(
                color: Colors.transparent,
                width: screensize.width,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    'assets/shop1.jpg',
                    height: screensize.height * 0.41,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),

          // the title and description text container
          Container(
            color: AppColor.white,
            height: screensize.height * 0.25,
            width: screensize.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // the tile text
                Container(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(
                    'Social commerce the safest \n and most trusted',
                    style: style.copyWith(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),

                // description text
                const SizedBox(height: 16),
                Text(
                  'Your Social experince with Shoping starts here. \n We are  here to help you speed up your \n social experince while shopping',
                  style: style.copyWith(
                    fontSize: 14,
                    color: AppColor.darkGrey,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
