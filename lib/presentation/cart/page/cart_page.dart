import 'package:app_shoes_ecommerce/core/utilities/path.dart';
import 'package:app_shoes_ecommerce/presentation/cart/widget/item_cart_widget.dart';
import 'package:app_shoes_ecommerce/presentation/cart/widget/quantity_control_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(
                            '${AssetPath.searchIconPath}search_outline.svg')),
                    IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(
                            '${AssetPath.notificationIconPath}notification_outline.svg'))
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                const Text(
                  'Cart',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 25,
                ),
                const ItemCartWidget()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
