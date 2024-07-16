import 'package:app_shoes_ecommerce/core/error/error_page.dart';
import 'package:app_shoes_ecommerce/core/utilities/path.dart';
import 'package:app_shoes_ecommerce/presentation/cart/bloc/cart_bloc.dart';
import 'package:app_shoes_ecommerce/presentation/cart/widget/item_cart_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  void initState() {
    BlocProvider.of<CartBloc>(context)
        .add(const CartInitEvent(idCart: "cart_ypbroE0K23w8n4"));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartBloc, CartState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is CartLoadingState) {
          return const Scaffold(
            body: SafeArea(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        } else if (state is CartLoadedState) {
          final lineItems = state.listItems;
          return Scaffold(
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: SingleChildScrollView(
                  physics: const ScrollPhysics(),
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
                        height: 20,
                      ),
                      const Text(
                        'Cart',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: lineItems.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              ItemCartWidget(
                                name: lineItems[index].name,
                                price: lineItems[index].price,
                                quantity: lineItems[index].quantity,
                                selectedOptions:
                                    lineItems[index].selectedOptions,
                                imageLink: lineItems[index].image.url!,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        } else {
          return const Scaffold(
            body: Center(
              child: ErrorPage(),
            ),
          );
        }
      },
    );
  }
}
