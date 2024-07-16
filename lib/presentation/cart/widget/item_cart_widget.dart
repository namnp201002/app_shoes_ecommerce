import 'package:app_shoes_ecommerce/domain/cart/entities/selected_option_entity.dart';
import 'package:app_shoes_ecommerce/domain/product/entities/price_entity.dart';
import 'package:app_shoes_ecommerce/presentation/cart/quantity_bloc/bloc/quantity_bloc.dart';
import 'package:app_shoes_ecommerce/presentation/cart/widget/arrow_selected_widget.dart';
import 'package:app_shoes_ecommerce/presentation/cart/widget/quantity_control_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class ItemCartWidget extends StatelessWidget {
  final String name;
  final List<SelectedOptionEntity> selectedOptions;
  final int quantity;
  final PriceEntity price;
  final String imageLink;
  const ItemCartWidget(
      {super.key,
      required this.name,
      required this.selectedOptions,
      required this.quantity,
      required this.price,
      required this.imageLink});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QuantityBloc(quantity),
      child: Container(
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
                  child: Image.network(imageLink),
                )),
            Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      int columns = constraints.maxWidth > 600 ? 3 : 2;
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Nike',
                            style: TextStyle(fontSize: 10, color: Colors.grey),
                          ),
                          Text(
                            name,
                            style: const TextStyle(
                                fontSize: 13, fontWeight: FontWeight.bold),
                          ),
                          GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: columns,
                              childAspectRatio:
                                  4, // Adjust this ratio as needed
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10,
                            ),
                            itemCount: selectedOptions.length,
                            itemBuilder: (context, index) {
                              return ArrowSelectedWidget(
                                title: selectedOptions[index].groupName,
                                option: selectedOptions[index].optionName,
                              );
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          BlocBuilder<QuantityBloc, int>(
                            builder: (context, state) {
                              return Row(
                                children: [
                                  QuantityControlWidget(
                                    decrementTap: () {
                                      BlocProvider.of<QuantityBloc>(context)
                                          .add(DecrementEvent());
                                    },
                                    incrementTap: () {
                                      BlocProvider.of<QuantityBloc>(context)
                                          .add(IncrementEvent());
                                    },
                                    quantity: state,
                                  ),
                                  const Spacer(),
                                  Text(
                                    NumberFormat.currency(
                                            locale: 'vi', symbol: 'đ')
                                        .format(price.raw!.toInt() * quantity),
                                  )
                                ],
                              );
                            },
                          )
                        ],
                      );
                    },
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
