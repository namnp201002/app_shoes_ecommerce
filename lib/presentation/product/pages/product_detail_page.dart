import 'package:app_shoes_ecommerce/core/error/error_page.dart';
import 'package:app_shoes_ecommerce/core/utilities/media_query.dart';
import 'package:app_shoes_ecommerce/core/utilities/path.dart';
import 'package:app_shoes_ecommerce/domain/product/entities/product_entity.dart';
import 'package:app_shoes_ecommerce/presentation/cart/widget/icon_box_widget.dart';
import 'package:app_shoes_ecommerce/presentation/home/widget/selected_box_widget.dart';
import 'package:app_shoes_ecommerce/presentation/product/bloc/product_detail_bloc.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:expand_widget/expand_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:intl/intl.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({super.key, required this.idProduct});
  // final ProductEntity productEntity;
  final String idProduct;
  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  CarouselController carouselController = CarouselController();
  // final controller = PageController(viewportFraction: 0.8, keepPage: true);
  int _current = 0;
  @override
  void initState() {
    BlocProvider.of<ProductDetailBloc>(context)
        .add(ProductClickedViewEvent(id: widget.idProduct));
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductDetailBloc, ProductDetailState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is ProductDetailLoadingState) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is ProductDetailLoadingSuccessState) {
          final ProductEntity product = state.product;
          return Scaffold(
              body: SafeArea(
                  child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        CarouselSlider.builder(
                            itemCount: product.assets!.length,
                            itemBuilder: (BuildContext context, int itemIndex,
                                    int pageViewIndex) =>
                                Image.network(product.assets![itemIndex].url!),
                            carouselController: carouselController,
                            options: CarouselOptions(
                              height: 300,
                              initialPage: 0,
                              enableInfiniteScroll: false,
                              reverse: false,
                              enlargeCenterPage: true,
                              enlargeFactor: 0.5,
                              onPageChanged: (index, reason) {
                                setState(() {
                                  _current = index;
                                });
                              },
                              scrollDirection: Axis.horizontal,
                            )),
                        Positioned(
                            top: 10,
                            left: 10,
                            child: CircleAvatar(
                              backgroundColor: Colors.grey[200],
                              child: IconButton(
                                icon: SvgPicture.asset(
                                    '${AssetPath.arrowLeftLineIconPath}arrow_left_line_outline.svg'),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            )),
                        Positioned(
                            top: 10,
                            right: 10,
                            child: CircleAvatar(
                              backgroundColor: Colors.grey[200],
                              child: IconButton(
                                icon: SvgPicture.asset(
                                    '${AssetPath.moreIconPath}more_outline.svg'),
                                onPressed: () {},
                              ),
                            )),
                        Positioned(
                            bottom: 10,
                            right: 10,
                            child: IconButton(
                              icon: SvgPicture.asset(
                                  '${AssetPath.heartIconPath}heart_bold.svg'),
                              onPressed: () {},
                            )),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: product.assets!.asMap().entries.map((entry) {
                        return GestureDetector(
                          onTap: () =>
                              carouselController.animateToPage(entry.key),
                          child: Container(
                            width: 7.0,
                            height: 7.0,
                            margin: const EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 4.0),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: (Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? Colors.white
                                        : Colors.black)
                                    .withOpacity(
                                        _current == entry.key ? 0.9 : 0.2)),
                          ),
                        );
                      }).toList(),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Nike',
                            style: TextStyle(fontSize: 17, color: Colors.grey),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
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
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
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
                                          style: TextStyle(fontSize: 12),
                                        )
                                      ],
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
                                          NumberFormat.currency(
                                                  locale: 'vi', symbol: 'đ')
                                              .format(
                                                  product.price.raw!.toInt()),
                                        )
                                      ]))
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            'Description',
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          ExpandChild(
                              // hideIndicatorOnExpand: true,
                              capitalizeIndicatorHintText: true,
                              collapsedVisibilityFactor: 0.2,
                              child: HtmlWidget(
                                product.description!,
                                textStyle: const TextStyle(
                                    overflow: TextOverflow.ellipsis),
                              ))
                        ],
                      ),
                    ),
                  ],
                ),
              )),
              bottomNavigationBar: SizedBox(
                height: kHeight(context) * 0.08,
                child: Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: InkWell(
                          onTap: () {
                            showModalBottomSheet(
                                context: context,
                                shape: const BeveledRectangleBorder(
                                    side: BorderSide.none),
                                builder: (context) {
                                  return Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              flex: 3,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    product.name,
                                                    style: const TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  const Text(
                                                    'Men Store',
                                                    style: TextStyle(
                                                        color: Colors.grey),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                                flex: 1,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    Text(
                                                      NumberFormat.currency(
                                                              locale: 'vi',
                                                              symbol: 'đ')
                                                          .format(product
                                                              .price.raw!
                                                              .toInt()),
                                                    )
                                                  ],
                                                ))
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        const Text(
                                          'Size:',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: product
                                                .variantGroup![0].options
                                                .asMap()
                                                .entries
                                                .map((size) {
                                              int len = product.variantGroup![0]
                                                      .options.length -
                                                  1;
                                              return SelectedBoxWidget(
                                                  content: size.value.name,
                                                  padding: 7,
                                                  radius: 5,
                                                  margin: (size.key != len)
                                                      ? const EdgeInsets.only(
                                                          right: 10)
                                                      : null,
                                                  isSelected: false);
                                            }).toList()),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Row(
                                          children: [
                                            const Text(
                                              'Quantity:',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            const Spacer(),
                                            InkWell(
                                              onTap: () {},
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
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                )),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            InkWell(
                                              onTap: () {},
                                              child: IconBoxWidget(
                                                  radius: 2,
                                                  isSelected: false,
                                                  padding: 10,
                                                  icon: SvgPicture.asset(
                                                      '${AssetPath.iconPath}ic_outline-plus.svg')),
                                            )
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        InkWell(
                                          onTap: () {},
                                          child: Container(
                                              decoration: const BoxDecoration(
                                                  color: Colors.black,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(5))),
                                              child: const Padding(
                                                padding: EdgeInsets.all(8.0),
                                                child: Center(
                                                    child: Text(
                                                  'Add to cart',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 15),
                                                )),
                                              )),
                                        )
                                      ],
                                    ),
                                  );
                                });
                          },
                          child: Center(
                            child: SvgPicture.asset(
                                '${AssetPath.shopBagIconPath}shop_bag_outline.svg'),
                          ),
                        )),
                    Expanded(
                        flex: 2,
                        child: InkWell(
                          onTap: () {},
                          child: Container(
                              color: Colors.black,
                              child: const Center(
                                  child: Text(
                                'Buy Now',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ))),
                        ))
                  ],
                ),
              ));
        } else {
          return const Scaffold(
            body: ErrorPage(),
          );
        }
      },
    );
  }
}
