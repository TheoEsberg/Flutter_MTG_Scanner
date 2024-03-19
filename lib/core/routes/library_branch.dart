import 'package:flutter/material.dart';
import 'package:flutter_mtg_scanner/core/constants/app_routes.dart';
import 'package:flutter_mtg_scanner/features/library/views/library_view.dart';
import 'package:go_router/go_router.dart';

final libraryBranch = StatefulShellBranch(routes: <RouteBase>[
  GoRoute(
    path: '/library',
    name: AppRoutes.Library,
    pageBuilder: (context, state) => const MaterialPage(child: LibraryView()),
  )
]);
