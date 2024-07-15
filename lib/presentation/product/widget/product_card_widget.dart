import 'package:app_shoes_ecommerce/core/theme/app_pallete.dart';
import 'package:app_shoes_ecommerce/core/utilities/media_query.dart';
import 'package:app_shoes_ecommerce/core/utilities/path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class ProductCardWidget extends StatelessWidget {
  final String name;
  final double price;
  final bool isFavorite;
  final List<String?>? categories;
  final String imageLink;
  final double? discount;
  const ProductCardWidget(
      {super.key,
      required this.name,
      required this.price,
      required this.isFavorite,
      this.categories,
      required this.imageLink,
      this.discount});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppPallete.whiteColor,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.05),
                spreadRadius: 3,
                blurRadius: 5,
                offset: const Offset(0, 3))
          ],
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      width:
          kWidth(context) > 200 ? kWidth(context) * 0.3 : kWidth(context) * 0.5,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.network(imageLink),
                discount != null
                    ? Positioned(
                        left: 0,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircleAvatar(
                            backgroundColor: Colors.black,
                            child: Text(
                              '${(discount!.toInt()).toString()}%',
                              style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.white),
                            ),
                          ),
                        ))
                    : const SizedBox.shrink(),
                Positioned(
                    right: 0,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        radius: 17,
                        backgroundColor: Colors.grey[200],
                        child: IconButton(
                          icon: SvgPicture.asset(isFavorite
                              ? '${AssetPath.heartIconPath}heart_bold.svg'
                              : '${AssetPath.heartIconPath}heart_twotone.svg'),
                          onPressed: () {},
                        ),
                      ),
                    ))
              ],
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SvgPicture.asset(
                  '${AssetPath.iconPath}star_icon.svg',
                  width: 12,
                  height: 12,
                ),
                const Text(
                  ' 4.5  |  ',
                  style: TextStyle(fontSize: 12),
                ),
                const Text(
                  '123 Reivews',
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                )
              ],
            ),
            Text(
              name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(fontSize: 13, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10, top: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    NumberFormat.currency(locale: 'vi', symbol: 'đ')
                        .format(price.toInt()),
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
