import 'package:app_shoes_ecommerce/core/utilities/path.dart';
import 'package:app_shoes_ecommerce/presentation/cart/widget/icon_box_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class QuantityControlWidget extends StatefulWidget {
  final int quantity;
  final void Function()? incrementTap;
  final void Function()? decrementTap;

  const QuantityControlWidget(
      {super.key,
      required this.quantity,
      required this.incrementTap,
      required this.decrementTap});

  @override
  State<QuantityControlWidget> createState() => _QuantityControlWidgetState();
}

class _QuantityControlWidgetState extends State<QuantityControlWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: widget.quantity > 1 ? widget.decrementTap : null,
          child: IconBoxWidget(
              radius: 2,
              isSelected: false,
              padding: 5,
              icon: SvgPicture.asset(
                '${AssetPath.iconPath}ic_baseline-minus.svg',
                colorFilter: widget.quantity == 1
                    ? const ColorFilter.mode(Colors.grey, BlendMode.srcIn)
                    : null,
              )),
        ),
        const SizedBox(
          width: 5,
        ),
        IconBoxWidget(
            radius: 2,
            isSelected: true,
            padding: 5,
            icon: Center(
              child: Text(
                widget.quantity.toString(),
                style: const TextStyle(color: Colors.white, fontSize: 12),
              ),
            )),
        const SizedBox(
          width: 5,
        ),
        InkWell(
          onTap: widget.incrementTap,
          child: IconBoxWidget(
              radius: 2,
              isSelected: false,
              padding: 5,
              icon: SvgPicture.asset(
                '${AssetPath.iconPath}ic_outline-plus.svg',
                colorFilter:
                    const ColorFilter.mode(Colors.black, BlendMode.srcIn),
              )),
        )
      ],
    );
  }
}
