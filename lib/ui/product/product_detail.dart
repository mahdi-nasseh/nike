import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nike/common/utils.dart';
import 'package:nike/data/product.dart';
import 'package:nike/ui/widget/image.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key, required this.product});
  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: MediaQuery.of(context).size.width * 0.8,
              flexibleSpace: CachImage(
                imageUrl: product.imageUrl,
                borderRadius: BorderRadius.circular(0),
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(CupertinoIcons.heart),
                )
              ],
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(product.title),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              product.previousPrice.withPriceLable,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .apply(decoration: TextDecoration.lineThrough),
                            ),
                            Text(product.price.withPriceLable),
                          ],
                        )
                      ],
                    ),
                    Text(
                      ' کفشی بسیار عالی و راحت. مناسب برای ییاده‌روی، روزمرگی، دو و حتی ورزش‌های سنگین. این کتونی هیچ فشار اضافه‌ای را به پا و کمر وارد نمی‌کند.',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'نظرات کاربران',
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                        Text('ثبت نظر'),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
