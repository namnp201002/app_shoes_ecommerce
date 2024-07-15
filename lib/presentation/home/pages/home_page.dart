import 'package:app_shoes_ecommerce/core/error/error_page.dart';
import 'package:app_shoes_ecommerce/core/theme/app_pallete.dart';
import 'package:app_shoes_ecommerce/core/utilities/media_query.dart';
import 'package:app_shoes_ecommerce/core/utilities/path.dart';
import 'package:app_shoes_ecommerce/domain/product/entities/product_entity.dart';
import 'package:app_shoes_ecommerce/presentation/home/widget/selected_box_widget.dart';
import 'package:app_shoes_ecommerce/presentation/product/bloc/product_bloc.dart';
import 'package:app_shoes_ecommerce/presentation/product/pages/product_detail_page.dart';
import 'package:app_shoes_ecommerce/presentation/product/widget/product_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // final TextEditingController searchController = TextEditingController();
  final SearchController searchController = SearchController();

  @override
  void initState() {
    BlocProvider.of<ProductBloc>(context).add(GetAllProductsHomeEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Expanded(
                      child: SearchAnchor(
                          searchController: searchController,
                          viewConstraints: BoxConstraints(
                              minHeight: kHeight(context),
                              minWidth: kWidth(context)),
                          isFullScreen: true,
                          viewBackgroundColor: AppPallete.backgroundColor,
                          viewHintText: 'Search something...',
                          builder: (context, controller) {
                            return SearchBar(
                              hintText: 'Search something...',
                              controller: controller,
                              padding:
                                  const MaterialStatePropertyAll<EdgeInsets>(
                                      EdgeInsets.symmetric(horizontal: 10.0)),
                              onTap: () {
                                controller.openView();
                              },
                              onChanged: (_) {
                                controller.openView();
                              },
                              leading: SvgPicture.asset(
                                '${AssetPath.searchIconPath}search_outline.svg',
                              ),
                              elevation: const MaterialStatePropertyAll(0),
                              constraints: const BoxConstraints(minHeight: 40),
                              shape: MaterialStatePropertyAll(
                                  BeveledRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      side: BorderSide.none)),
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.grey[200]),
                            );
                          },
                          suggestionsBuilder: (BuildContext context,
                              SearchController controller) {
                            return List<ListTile>.generate(5, (int index) {
                              final String item = 'item $index';
                              return ListTile(
                                title: Text(item),
                                onTap: () {
                                  setState(() {
                                    controller.closeView(item);
                                  });
                                },
                              );
                            });
                          })),
                  IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(
                          '${AssetPath.filterIconPath}filter_outline.svg')),
                  IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(
                          '${AssetPath.notificationIconPath}notification_outline.svg'))
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 10, left: 10, right: 10),
              child: Row(
                children: [
                  SelectedBoxWidget(content: 'All', isSelected: true),
                  SizedBox(
                    width: 10,
                  ),
                  SelectedBoxWidget(content: 'New In', isSelected: false),
                  SizedBox(
                    width: 10,
                  ),
                  SelectedBoxWidget(content: 'Trending', isSelected: false),
                  SizedBox(
                    width: 10,
                  ),
                  SelectedBoxWidget(content: 'Sales', isSelected: false)
                ],
              ),
            ),
            BlocBuilder<ProductBloc, ProductState>(
              builder: (context, state) {
                if (state is AllProductsLoadingState) {
                  return const CircularProgressIndicator(color: Colors.black);
                } else if (state is AllProductsLoadingSuccessState) {
                  List<ProductEntity> list = state.data.toList();
                  return GridView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      physics: const ScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10,
                              childAspectRatio: 0.65),
                      itemCount: list.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ProductDetailPage(
                                          idProduct: list[index].id,
                                        )));
                          },
                          child: ProductCardWidget(
                            name: list[index].name,
                            imageLink: list[index].image!.url!,
                            isFavorite: index == 2 || index == 5 ? true : false,
                            price: list[index].price.raw!,
                            discount: 25,
                          ),
                        );
                      });
                } else {
                  return const Center(
                    child: ErrorPage(),
                  );
                }
              },
            )
          ],
        ),
      ),
    ));
  }
}
