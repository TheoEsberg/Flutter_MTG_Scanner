import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dio_provider.g.dart';

@riverpod
Dio dio(DioRef ref) {
  final dioClient = Dio(
    BaseOptions(
      baseUrl: 'https://api.scryfall.com',
      contentType: 'application/json',
    ),
  );

  return dioClient;
}
