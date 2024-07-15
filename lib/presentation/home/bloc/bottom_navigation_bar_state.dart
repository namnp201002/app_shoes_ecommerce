part of 'bottom_navigation_bar_bloc.dart';

abstract class BottomNavigationBarState extends Equatable {
  const BottomNavigationBarState();
  final int index = 0;
  @override
  List<Object> get props => [];
}

class HomeState extends BottomNavigationBarState {
  @override
  final int index = 0;
  final String title = 'Home';

  @override
  List<Object> get props => [index, title];
}

class ShopState extends BottomNavigationBarState {
  @override
  final int index = 2;
  final String title = 'Shop';

  @override
  List<Object> get props => [index, title];
}

class FavoriteState extends BottomNavigationBarState {
  @override
  final int index = 1;
  final String title = 'Favorite';

  @override
  List<Object> get props => [index, title];
}

class ProfilePageState extends BottomNavigationBarState {
  @override
  final int index = 3;
  final String title = 'Profile';

  @override
  List<Object> get props => [index, title];
}
