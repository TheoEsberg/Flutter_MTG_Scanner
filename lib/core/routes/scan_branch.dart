import 'package:flutter/material.dart';
import 'package:flutter_mtg_scanner/core/constants/app_routes.dart';
import 'package:flutter_mtg_scanner/features/scan/views/scan_view.dart';
import 'package:go_router/go_router.dart';

final scanBranch = StatefulShellBranch(routes: <RouteBase>[
  GoRoute(
    path: '/scan',
    name: AppRoutes.Scan,
    pageBuilder: (context, state) => const MaterialPage(child: ScanView()),
  )
]);
