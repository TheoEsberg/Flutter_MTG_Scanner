import 'package:flutter/material.dart';
import 'package:flutter_mtg_scanner/core/constants/app_routes.dart';
import 'package:flutter_mtg_scanner/features/login/views/login_view.dart';
import 'package:go_router/go_router.dart';

final outsideRoutes = [
  GoRoute(
    path: '/',
    name: AppRoutes.Home,
    redirect: (context, state) => state.namedLocation(AppRoutes.Login),
  ),
  GoRoute(
    path: '/login',
    name: AppRoutes.Login,
    pageBuilder: (context, state) => const MaterialPage(
      child: LoginView(),
    ),
  ),
];
