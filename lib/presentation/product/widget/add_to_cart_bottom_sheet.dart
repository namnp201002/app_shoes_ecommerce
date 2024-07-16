import 'package:app_shoes_ecommerce/domain/product/entities/product_entity.dart';
import 'package:app_shoes_ecommerce/presentation/cart/widget/quantity_control_widget.dart';
import 'package:app_shoes_ecommerce/presentation/home/widget/selected_box_widget.dart';
import 'package:app_shoes_ecommerce/presentation/product/bloc/quantity_product/bloc/quantity_product_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

Future<dynamic> addToCartBottomSheet(
    BuildContext context, ProductEntity product) {
  final variants = product.variantGroup ?? [];
  return showModalBottomSheet(
      context: context,
      shape: const BeveledRectangleBorder(side: BorderSide.none),
      builder: (context) {
        return BlocProvider(
          create: (context) => QuantityProductBloc(1),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.name,
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const Text(
                            'Men Store',
                            style: TextStyle(color: Colors.grey),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                        flex: 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              NumberFormat.currency(locale: 'vi', symbol: 'đ')
                                  .format(product.price.raw!.toInt()),
                            )
                          ],
                        ))
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                ...variants.map((variant) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${variant.name}:',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: variant.options.asMap().entries.map((size) {
                            int len = variant.options.length - 1;
                            return SelectedBoxWidget(
                                content: size.value.name,
                                padding: 7,
                                radius: 5,
                                margin: (size.key != len)
                                    ? const EdgeInsets.only(right: 10)
                                    : null,
                                isSelected: false);
                          }).toList()),
                      const SizedBox(
                        height: 20,
                      )
                    ],
                  );
                }),
                BlocBuilder<QuantityProductBloc, int>(
                  builder: (context, state) {
                    return Row(
                      children: [
                        const Text(
                          'Quantity:',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const Spacer(),
                        QuantityControlWidget(
                          decrementTap: () {
                            BlocProvider.of<QuantityProductBloc>(context)
                                .add(DecrementEvent());
                          },
                          incrementTap: () {
                            BlocProvider.of<QuantityProductBloc>(context)
                                .add(IncrementEvent());
                          },
                          quantity: state,
                        )
                      ],
                    );
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                      decoration: const BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Center(
                            child: Text(
                          'Add to cart',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        )),
                      )),
                )
              ],
            ),
          ),
        );
      });
}
