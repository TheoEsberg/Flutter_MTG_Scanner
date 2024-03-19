import 'package:flutter/material.dart';
import 'package:flutter_mtg_scanner/core/constants/app_routes.dart';
import 'package:flutter_mtg_scanner/features/settings/views/settings_view.dart';
import 'package:go_router/go_router.dart';

final settingsBranch = StatefulShellBranch(routes: <RouteBase>[
  GoRoute(
    path: '/settings',
    name: AppRoutes.Settings,
    pageBuilder: (context, state) => const MaterialPage(child: SettingsView()),
  )
]);
