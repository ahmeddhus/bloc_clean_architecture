import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:valu_store_app/core/routing/route_names.dart';
import 'package:valu_store_app/core/util/routing_extension.dart';
import 'package:valu_store_app/features/domain/entities/product.dart';
import 'package:valu_store_app/features/presentation/screens/details/product_details_screen.dart';
import 'package:valu_store_app/features/presentation/screens/home/home_screen.dart';

mixin AppRouter {
  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: RouteNames.homeScreen,
        builder: (BuildContext context, GoRouterState state) {
          return const HomeScreen();
        },
        routes: <RouteBase>[
          GoRoute(
            path: RouteNames.productDetailsScreen.toValidRouteName,
            builder: (BuildContext context, GoRouterState state) {
              final Product? product = state.extra is Product ? state.extra as Product : null;
              return ProductDetailsScreen(
                product: product,
              );
            },
          ),
        ],
      ),
    ],
  );
}
