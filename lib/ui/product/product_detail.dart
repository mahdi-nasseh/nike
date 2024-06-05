import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nike/common/utils.dart';
import 'package:nike/data/product.dart';
import 'package:nike/ui/product/comment/comment_list.dart';
import 'package:nike/ui/widget/image.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key, required this.product});
  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SizedBox(
        width: MediaQuery.of(context).size.width - 45,
        child: FloatingActionButton.extended(
          onPressed: () {},
          label: const Text("افزوذن به سبد خرید"),
          backgroundColor: themeData.colorScheme.secondary,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(36)),
        ),
      ),
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: CustomScrollView(
            physics: defualtScrollPhysics,
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
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              product.title,
                              style: themeData.textTheme.titleLarge,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                product.previousPrice.withPriceLable,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .apply(
                                        decoration: TextDecoration.lineThrough),
                              ),
                              Text(
                                product.price.withPriceLable,
                                style: themeData.textTheme.titleLarge!
                                    .copyWith(fontSize: 16),
                              ),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      Text(
                        ' کفشی بسیار عالی و راحت. مناسب برای ییاده‌روی، روزمرگی، دو و حتی ورزش‌های سنگین. این کتونی هیچ فشار اضافه‌ای را به پا و کمر وارد نمی‌کند.',
                        style: themeData.textTheme.bodyMedium,
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
                          TextButton(
                              onPressed: () {}, child: const Text('ثبت نظر'))
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              CommentList(
                productId: product.id,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
