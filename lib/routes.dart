import 'package:cotton_app/representation/ui/admin/ui/addproduct.dart';
import 'package:cotton_app/representation/ui/auth/log_or_reg.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case LoginOrReg.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const LoginOrReg(),
      );

    // case HomeScreen.routeName:
    //   return MaterialPageRoute(
    //     settings: routeSettings,
    //     builder: (_) => const HomePage(),
    //   );

    // case BottomBar.routeName:
    //   return MaterialPageRoute(
    //     settings: routeSettings,
    //     builder: (_) => const BottomBar(),
    //   );

    case AddProductScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const AddProductScreen(),
      );

    // case CategoryDealsScreen.routeName:
    //   var category = routeSettings.arguments as String;
    //   return MaterialPageRoute(
    //     settings: routeSettings,
    //     builder: (_) => CategoryDealsScreen(
    //       category: category,
    //     ),
    //   );
    //
    // case SearchPage.routeName:
    //   var searchQuery = routeSettings.arguments as String;
    //   return MaterialPageRoute(
    //     settings: routeSettings,
    //     builder: (_) => SearchPage(
    //       searchQuery: searchQuery,
    //     ),
    //   );
    //
    // case ProductDetailPage.routeName:
    //   var product = routeSettings.arguments as Product;
    //   return MaterialPageRoute(
    //     settings: routeSettings,
    //     builder: (_) => ProductDetailPage(
    //       product: product,
    //     ),
    //   );
    //
    // case AddressScreen.routeName:
    //   var totalAmount = routeSettings.arguments as String;
    //   return MaterialPageRoute(
    //     settings: routeSettings,
    //     builder: (_) => AddressScreen(
    //       totalAmount: totalAmount,
    //     ),
    //   );
    //
    // case OrderDetailPage.routeName:
    //   var order = routeSettings.arguments as Order;
    //   return MaterialPageRoute(
    //     settings: routeSettings,
    //     builder: (_) => OrderDetailPage(
    //       order: order,
    //     ),
    //   );

    default:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const Scaffold(
          body: Center(
            child: Text('Screen does not exist!'),
          ),
        ),
      );
  }
}