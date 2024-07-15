// ignore_for_file: deprecated_member_use

import 'package:app_shoes_ecommerce/core/error/error_page.dart';
import 'package:app_shoes_ecommerce/core/utilities/path.dart';
import 'package:app_shoes_ecommerce/presentation/cart/page/cart_page.dart';
import 'package:app_shoes_ecommerce/presentation/home/bloc/bottom_navigation_bar_bloc.dart';
import 'package:app_shoes_ecommerce/presentation/home/pages/home_page.dart';
import 'package:app_shoes_ecommerce/presentation/product/bloc/product_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Layout extends StatefulWidget {
  const Layout({super.key});

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigationBarBloc, BottomNavigationBarState>(
      builder: (context, state) {
        return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.teal,
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.grey[600],
            currentIndex: state.index,
            onTap: (index) {
              switch (index) {
                case 0:
                  BlocProvider.of<BottomNavigationBarBloc>(context)
                      .add(LoadHome());
                  BlocProvider.of<ProductBloc>(context)
                      .add(GetAllProductsHomeEvent());
                  break;
                case 1:
                  BlocProvider.of<BottomNavigationBarBloc>(context)
                      .add(LoadFavorite());
                  break;
                case 2:
                  BlocProvider.of<BottomNavigationBarBloc>(context)
                      .add(LoadShop());
                  break;
                case 3:
                  BlocProvider.of<BottomNavigationBarBloc>(context)
                      .add(LoadProfile());
                  break;
                default:
                  BlocProvider.of<BottomNavigationBarBloc>(context)
                      .add(LoadHome());
              }
            },
            items: [
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    '${AssetPath.homeIconPath}home_outline.svg',
                    color: Colors.grey[600],
                  ),
                  label: 'Home',
                  activeIcon: SvgPicture.asset(
                    '${AssetPath.homeIconPath}home_bold.svg',
                    color: Colors.black,
                  )),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  '${AssetPath.heartIconPath}heart_outline.svg',
                  color: Colors.grey[600],
                ),
                label: 'Favorite',
                activeIcon: SvgPicture.asset(
                  '${AssetPath.heartIconPath}heart_bold.svg',
                  color: Colors.black,
                ),
              ),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    '${AssetPath.shopBagIconPath}shop_bag_outline.svg',
                    color: Colors.grey[600],
                  ),
                  label: 'Cart',
                  activeIcon: SvgPicture.asset(
                    '${AssetPath.shopBagIconPath}shop_bag_bold.svg',
                    color: Colors.black,
                  )),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    '${AssetPath.profileIconPath}profile_outline.svg',
                    color: Colors.grey[600],
                  ),
                  label: 'Profile',
                  activeIcon: SvgPicture.asset(
                      '${AssetPath.profileIconPath}profile_bold.svg',
                      color: Colors.black)),
            ],
          ),
          body: BlocBuilder<BottomNavigationBarBloc, BottomNavigationBarState>(
            builder: (context, state) {
              if (state is HomeState) {
                return const HomePage();
              } else if (state is FavoriteState) {
                return const Center(
                  child: ErrorPage(),
                );
              } else if (state is ShopState) {
                return const CartPage();
              } else if (state is ProfilePageState) {
                return const Center(
                  child: Text("3"),
                );
              } else {
                return const SizedBox();
              }
            },
          ),
        );
      },
    );
  }
}
