import 'package:flutter/material.dart';
import 'package:flutter_mtg_scanner/core/constants/app_routes.dart';
import 'package:flutter_mtg_scanner/features/search/views/search_view.dart';
import 'package:go_router/go_router.dart';

final searchBranch = StatefulShellBranch(routes: <RouteBase>[
  GoRoute(
    path: '/search',
    name: AppRoutes.Search,
    pageBuilder: (context, state) => const MaterialPage(child: SearchView()),
  )
]);
