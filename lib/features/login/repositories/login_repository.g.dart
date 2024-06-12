// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$loginRepositoryHash() => r'e30c8925b31cd42ffff0f227f73d00ae5a4bd984';

/// See also [loginRepository].
@ProviderFor(loginRepository)
final loginRepositoryProvider = AutoDisposeProvider<LoginRepository>.internal(
  loginRepository,
  name: r'loginRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$loginRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef LoginRepositoryRef = AutoDisposeProviderRef<LoginRepository>;
String _$loginUserHash() => r'33bef003ef2a00068e6a7b7823b55d0b11f67385';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [loginUser].
@ProviderFor(loginUser)
const loginUserProvider = LoginUserFamily();

/// See also [loginUser].
class LoginUserFamily extends Family<AsyncValue<UserModel?>> {
  /// See also [loginUser].
  const LoginUserFamily();

  /// See also [loginUser].
  LoginUserProvider call({
    required LoginModel loginModel,
  }) {
    return LoginUserProvider(
      loginModel: loginModel,
    );
  }

  @override
  LoginUserProvider getProviderOverride(
    covariant LoginUserProvider provider,
  ) {
    return call(
      loginModel: provider.loginModel,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'loginUserProvider';
}

/// See also [loginUser].
class LoginUserProvider extends AutoDisposeFutureProvider<UserModel?> {
  /// See also [loginUser].
  LoginUserProvider({
    required LoginModel loginModel,
  }) : this._internal(
          (ref) => loginUser(
            ref as LoginUserRef,
            loginModel: loginModel,
          ),
          from: loginUserProvider,
          name: r'loginUserProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$loginUserHash,
          dependencies: LoginUserFamily._dependencies,
          allTransitiveDependencies: LoginUserFamily._allTransitiveDependencies,
          loginModel: loginModel,
        );

  LoginUserProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.loginModel,
  }) : super.internal();

  final LoginModel loginModel;

  @override
  Override overrideWith(
    FutureOr<UserModel?> Function(LoginUserRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: LoginUserProvider._internal(
        (ref) => create(ref as LoginUserRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        loginModel: loginModel,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<UserModel?> createElement() {
    return _LoginUserProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is LoginUserProvider && other.loginModel == loginModel;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, loginModel.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin LoginUserRef on AutoDisposeFutureProviderRef<UserModel?> {
  /// The parameter `loginModel` of this provider.
  LoginModel get loginModel;
}

class _LoginUserProviderElement
    extends AutoDisposeFutureProviderElement<UserModel?> with LoginUserRef {
  _LoginUserProviderElement(super.provider);

  @override
  LoginModel get loginModel => (origin as LoginUserProvider).loginModel;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
