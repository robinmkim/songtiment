import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:songtiment/screens/main_navigation_screen.dart';

final routerProvider = Provider(
  (ref) => GoRouter(
    initialLocation: "/home",
    routes: [
      GoRoute(
        path: "/:tab(home|post|profile)",
        name: MainNavigationScreen.routeName,
        builder: (context, state) {
          final tab = state.pathParameters["tab"]!;
          return MainNavigationScreen(tab: tab);
        },
      ),
    ],
  ),
);
