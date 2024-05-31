import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nike/common/utils.dart';
import 'package:nike/data/product.dart';
import 'package:nike/ui/product/product_detail.dart';
import 'package:nike/ui/widget/image.dart';

class ProductSlid extends StatelessWidget {
  const ProductSlid({
    super.key,
    required this.product,
    required this.themeData,
    required this.borderRadius,
  });

  final ProductEntity product;
  final ThemeData themeData;
  final BorderRadius borderRadius;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: borderRadius,
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ProductDetail(
                product: product,
              ))),
      child: SizedBox(
        width: 176,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                SizedBox(
                  width: 176,
                  height: 189,
                  child: CachImage(
                    imageUrl: product.imageUrl,
                    borderRadius: borderRadius,
                  ),
                ),
                Positioned(
                  right: 8,
                  top: 4,
                  child: Container(
                    width: 30,
                    height: 30,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)),
                    child: const Icon(
                      CupertinoIcons.heart,
                      size: 18,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8, left: 8, bottom: 4),
              child: Text(
                product.title,
                maxLines: 1,
                style: themeData.textTheme.bodyMedium!
                    .copyWith(overflow: TextOverflow.ellipsis),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8, left: 8),
              child: Text(
                product.previousPrice.withPriceLable,
                style: themeData.textTheme.bodySmall!
                    .copyWith(decoration: TextDecoration.lineThrough),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8, left: 8),
              child: Text(
                product.price.withPriceLable,
                style: themeData.textTheme.bodyMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
