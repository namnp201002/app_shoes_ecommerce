import 'package:app_shoes_ecommerce/core/utilities/path.dart';
import 'package:app_shoes_ecommerce/presentation/cart/widget/icon_box_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class QuantityControlWidget extends StatelessWidget {
  final void Function()? incrementTap;
  final void Function()? decrementTap;

  const QuantityControlWidget(
      {super.key, required this.incrementTap, required this.decrementTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: decrementTap,
          child: IconBoxWidget(
              radius: 2,
              isSelected: false,
              padding: 10,
              icon: SvgPicture.asset(
                  '${AssetPath.iconPath}ic_baseline-minus.svg')),
        ),
        const SizedBox(
          width: 5,
        ),
        const IconBoxWidget(
            radius: 2,
            isSelected: true,
            padding: 10,
            icon: Text(
              '10',
              style: TextStyle(color: Colors.white),
            )),
        const SizedBox(
          width: 5,
        ),
        InkWell(
          onTap: incrementTap,
          child: IconBoxWidget(
              radius: 2,
              isSelected: false,
              padding: 10,
              icon:
                  SvgPicture.asset('${AssetPath.iconPath}ic_outline-plus.svg')),
        )
      ],
    );
  }
}
