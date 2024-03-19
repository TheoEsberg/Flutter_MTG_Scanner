import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mtg_scanner/core/routes/library_branch.dart';
import 'package:flutter_mtg_scanner/core/routes/outside_routes.dart';
import 'package:flutter_mtg_scanner/core/routes/scan_branch.dart';
import 'package:flutter_mtg_scanner/core/routes/search_branch.dart';
import 'package:flutter_mtg_scanner/core/routes/settings_branch.dart';
import 'package:flutter_mtg_scanner/core/widgets/mtg_bottom_navigation_bar.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();

class MyApp extends HookConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = useMemoized(
      () => GoRouter(
        navigatorKey: rootNavigatorKey,
        initialLocation: '/',
        routes: [
          ...outsideRoutes,
          StatefulShellRoute.indexedStack(
            builder: (context, state, navigationShell) =>
                MtgBottomNavigationBar(navigationShell: navigationShell),
            branches: [scanBranch, searchBranch, libraryBranch, settingsBranch],
          ),
        ],
      ),
      [],
    );

    return MaterialApp.router(
      routerConfig: router,
    );
  }
}
