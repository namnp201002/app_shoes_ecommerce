import 'package:app_shoes_ecommerce/presentation/cart/widget/quantity_control_widget.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class ItemCartWidget extends StatelessWidget {
  const ItemCartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.05),
                spreadRadius: 3,
                blurRadius: 5,
                offset: const Offset(0, 3))
          ],
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: Row(
        children: [
          Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.network(
                    'https://cdn.chec.io/merchants/57685/assets/8e6VGvyUWbXegI2n%7C1_137_1.webp'),
              )),
          Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Nike'),
                    const Row(
                      children: [
                        Text('Size: 40  Colour: Black'),
                        Spacer(),
                        Text(
                          'Edit',
                          style:
                              TextStyle(decoration: TextDecoration.underline),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        QuantityControlWidget(
                            incrementTap: () {}, decrementTap: () {}),
                        const Spacer(),
                        const Text('250.000 đ')
                      ],
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
