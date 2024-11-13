import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:simple_todo/features/create_task/create_task_page.dart';
import 'package:simple_todo/features/home/home_page.dart';
import 'package:simple_todo/features/task_details/task_details_page.dart';

class RoutePaths {
  static String get home => "/";
  static String get details => "/details/:id";
  static String get create => "/create";
}

final navigatonKey = GlobalKey<NavigatorState>();

final routerProvider = NotifierProvider<RouterProvider, GoRouter>(RouterProvider.new);

class RouterProvider extends Notifier<GoRouter> {
  @override
  GoRouter build() {
    return GoRouter(
      navigatorKey: navigatonKey,
      initialLocation: RoutePaths.home,
      routes: Routes.list,
    );
  }
}

class Routes {
  static List<RouteBase> get list => <RouteBase>[
        GoRoute(
          path: RoutePaths.home,
          name: RoutePaths.home,
          builder: (_, __) => const HomePage(),
        ),
        GoRoute(
          path: RoutePaths.create,
          name: RoutePaths.create,
          builder: (_, __) => const CreateTaskPage(),
        ),
        GoRoute(
          path: RoutePaths.details,
          name: RoutePaths.details,
          builder: (context, state) => TaskDetailsPage(int.parse(state.pathParameters["id"]!)),
        )
      ];
}
