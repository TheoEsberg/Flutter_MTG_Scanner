// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mtg_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$searchHash() => r'10413721472d0f2732d04e81cb727addf64beb4b';

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

/// See also [search].
@ProviderFor(search)
const searchProvider = SearchFamily();

/// See also [search].
class SearchFamily extends Family<AsyncValue<PaginableList<MtgCard>>> {
  /// See also [search].
  const SearchFamily();

  /// See also [search].
  SearchProvider call(
    int currentPage,
  ) {
    return SearchProvider(
      currentPage,
    );
  }

  @override
  SearchProvider getProviderOverride(
    covariant SearchProvider provider,
  ) {
    return call(
      provider.currentPage,
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
  String? get name => r'searchProvider';
}

/// See also [search].
class SearchProvider extends AutoDisposeFutureProvider<PaginableList<MtgCard>> {
  /// See also [search].
  SearchProvider(
    int currentPage,
  ) : this._internal(
          (ref) => search(
            ref as SearchRef,
            currentPage,
          ),
          from: searchProvider,
          name: r'searchProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$searchHash,
          dependencies: SearchFamily._dependencies,
          allTransitiveDependencies: SearchFamily._allTransitiveDependencies,
          currentPage: currentPage,
        );

  SearchProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.currentPage,
  }) : super.internal();

  final int currentPage;

  @override
  Override overrideWith(
    FutureOr<PaginableList<MtgCard>> Function(SearchRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SearchProvider._internal(
        (ref) => create(ref as SearchRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        currentPage: currentPage,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<PaginableList<MtgCard>> createElement() {
    return _SearchProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SearchProvider && other.currentPage == currentPage;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, currentPage.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SearchRef on AutoDisposeFutureProviderRef<PaginableList<MtgCard>> {
  /// The parameter `currentPage` of this provider.
  int get currentPage;
}

class _SearchProviderElement
    extends AutoDisposeFutureProviderElement<PaginableList<MtgCard>>
    with SearchRef {
  _SearchProviderElement(super.provider);

  @override
  int get currentPage => (origin as SearchProvider).currentPage;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
