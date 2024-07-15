import 'package:app_shoes_ecommerce/core/network/api_provider_impl.dart';
import 'package:app_shoes_ecommerce/core/theme/bloc/theme_bloc.dart';
import 'package:app_shoes_ecommerce/core/theme/theme_service.dart';
import 'package:app_shoes_ecommerce/core/utilities/router.dart';
import 'package:app_shoes_ecommerce/data/product/datasources/product_datasource.dart';
import 'package:app_shoes_ecommerce/data/product/repository/product_repository_impl.dart';
import 'package:app_shoes_ecommerce/domain/product/usecases/get_all_product_usecase.dart';
import 'package:app_shoes_ecommerce/domain/product/usecases/get_product_usecase.dart';
// import 'package:app_shoes_ecommerce/firebase_options.dart';
import 'package:app_shoes_ecommerce/presentation/home/bloc/bottom_navigation_bar_bloc.dart';
import 'package:app_shoes_ecommerce/presentation/home/pages/layout.dart';
import 'package:app_shoes_ecommerce/presentation/login/bloc/login_bloc.dart';
import 'package:app_shoes_ecommerce/presentation/product/bloc/product_bloc.dart';
import 'package:app_shoes_ecommerce/presentation/product/bloc/product_detail_bloc.dart';
// import 'package:app_shoes_ecommerce/presentation/login/pages/login_page.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await ThemeDatabaseService.checkDatabaseExists();
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginBloc()),
        BlocProvider(create: (context) => BottomNavigationBarBloc()),
        BlocProvider(create: (context) => ThemeBloc()),
        BlocProvider(
            create: (context) => ProductDetailBloc(GetProductUsecase(
                productRepository: ProductRepositoryImpl(
                    productDatasource: ProductDatasourceImpl(
                        apiProvider: APIProviderImpl()))))),
        BlocProvider(
            create: (context) => ProductBloc(
                GetAllProductUseCase(
                    productRepository: ProductRepositoryImpl(
                        productDatasource: ProductDatasourceImpl(
                            apiProvider: APIProviderImpl()))),
                GetProductUsecase(
                    productRepository: ProductRepositoryImpl(
                        productDatasource: ProductDatasourceImpl(
                            apiProvider: APIProviderImpl())))))
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'App Shoes Ecommerce',
            onGenerateRoute: onGenerate,
            debugShowCheckedModeBanner: false,
            theme: state.themeData,
            home: const Layout(),
          );
        },
      ),
    );
  }
}
