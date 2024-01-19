import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class UserImageIcon extends StatelessWidget {
  UserImageIcon({
    super.key,
    this.imageUrl,
    this.radius = 60,
    this.borderColor,
    this.text,
    this.assetUrl,
    this.borderWidth,
    this.onPressed,
  });

  String? imageUrl;
  String? assetUrl;
  final double radius;
  final Color? borderColor;
  final String? text;
  final double? borderWidth;

  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: radius,
        width: radius,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
                width: borderWidth ?? 2,
                color: borderColor ?? Theme.of(context).primaryColor)),
        child: InkWell(
          onTap: onPressed,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(radius - 10),
              child: imageUrl != null
                  ? CachedNetworkImage(
                      imageUrl: imageUrl!,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) => Container(
                        height: radius,
                        width: radius,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage('assets/avatar.jpeg'),
                                fit: BoxFit.fill)),
                      ),
                    )
                  : assetUrl != null
                      ? Container(
                          height: radius,
                          width: radius,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: AssetImage(assetUrl!),
                                  fit: BoxFit.fill)))
                      : const SizedBox.shrink()),
        ));
  }
}

class ImageCatchedUrl extends StatelessWidget {
  const ImageCatchedUrl({
    super.key,
    required this.imageUrl,
    this.showBorder = false,
    this.height = 50,
    this.widght = double.infinity,
    this.borderRadius,
    this.openImage,
  });

  final String imageUrl;
  final double height, widght;
  final double? borderRadius;
  final bool showBorder;
  final VoidCallback? openImage;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        width: widght,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius ?? 0),
            border: showBorder
                ? Border.all(width: 2, color: Theme.of(context).primaryColor)
                : null),
        child: InkWell(
          onTap: openImage,
          child: CachedNetworkImage(
            imageUrl: imageUrl,
            fit: BoxFit.fill,
            placeholder: (context, url) => const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    height: 20, width: 20, child: CircularProgressIndicator()),
              ],
            ),
            errorWidget: (context, url, error) => Container(
              height: height,
              width: widght,
              decoration: BoxDecoration(
                  // shape: BoxShape.circle,
                  border: showBorder
                      ? Border.all(
                          width: 2, color: Theme.of(context).primaryColor)
                      : Border.all(width: 0),
                  borderRadius: BorderRadius.circular(100),
                  image: const DecorationImage(
                      image: AssetImage('assets/officiallogo.png'),
                      fit: BoxFit.fill)),
            ),
          ),
        ));
  }
}

class UserImageIconRect extends StatelessWidget {
  const UserImageIconRect({
    super.key,
    required this.imageUrl,
    this.radius = 70,
    this.showBorder = false,
    this.boxFit,
    this.padding,
  });

  final String imageUrl;
  final double radius;
  final bool showBorder;

  final BoxFit? boxFit;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    // if(imageUrl =='')
    return Container(
      height: radius,
      width: radius,
      padding: padding,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius / 7),
          border: showBorder
              ? Border.all(width: 2, color: Theme.of(context).primaryColor)
              : Border.all(width: 0)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius / 7),
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          fit: boxFit ?? BoxFit.fill,
          placeholder: (context, url) => const Row(
            children: [
              SizedBox(
                  height: 20, width: 20, child: CircularProgressIndicator()),
            ],
          ),
          errorWidget: (context, url, error) => Container(
            height: radius,
            width: radius,
            decoration: BoxDecoration(
              border: showBorder
                  ? Border.all(width: 2, color: Theme.of(context).primaryColor)
                  : Border.all(width: 0),
              borderRadius: BorderRadius.circular(100),
              image: const DecorationImage(
                  image: AssetImage('assets/officiallogo.png'),
                  fit: BoxFit.fill),
            ),
          ),
        ),
      ),
    );
  }
}
