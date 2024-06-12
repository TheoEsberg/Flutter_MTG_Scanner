import 'package:dio/dio.dart';
import 'package:flutter_mtg_scanner/core/utils/dio_provider.dart';
import 'package:flutter_mtg_scanner/features/login/models/login_model.dart';
import 'package:flutter_mtg_scanner/features/login/models/user_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_repository.g.dart';

class LoginRepository {
  const LoginRepository({required this.client});
  final Dio client;

  Future<UserModel?> loginUser({required LoginModel loginModel}) async {
    final uri = Uri.parse('http://192.168.0.52:5000/api/Login');

    try {
      final response = await client.postUri(
        uri,
        data: loginModel,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200) {
        return UserModel.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      print('Error: $e');
    }
    return null;
  }
}

@riverpod
LoginRepository loginRepository(LoginRepositoryRef ref) => LoginRepository(
      client: ref.watch(dioProvider),
    );

@riverpod
Future<UserModel?> loginUser(LoginUserRef ref,
    {required LoginModel loginModel}) async {
  final user = await ref
      .watch(loginRepositoryProvider)
      .loginUser(loginModel: loginModel);

  return user;
}

final userProvider = StateProvider<UserModel?>((ref) => null);
