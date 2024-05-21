// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mtg_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$searchHash() => r'824fa177406de9e5ea47d9dbe62b392e124b043d';

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

String _$searchByIdHash() => r'133705ef79ccb817016d7590e41d007202bf8e6a';

/// See also [searchById].
@ProviderFor(searchById)
const searchByIdProvider = SearchByIdFamily();

/// See also [searchById].
class SearchByIdFamily extends Family<AsyncValue<MtgCard>> {
  /// See also [searchById].
  const SearchByIdFamily();

  /// See also [searchById].
  SearchByIdProvider call(
    String id,
  ) {
    return SearchByIdProvider(
      id,
    );
  }

  @override
  SearchByIdProvider getProviderOverride(
    covariant SearchByIdProvider provider,
  ) {
    return call(
      provider.id,
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
  String? get name => r'searchByIdProvider';
}

/// See also [searchById].
class SearchByIdProvider extends AutoDisposeFutureProvider<MtgCard> {
  /// See also [searchById].
  SearchByIdProvider(
    String id,
  ) : this._internal(
          (ref) => searchById(
            ref as SearchByIdRef,
            id,
          ),
          from: searchByIdProvider,
          name: r'searchByIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$searchByIdHash,
          dependencies: SearchByIdFamily._dependencies,
          allTransitiveDependencies:
              SearchByIdFamily._allTransitiveDependencies,
          id: id,
        );

  SearchByIdProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  Override overrideWith(
    FutureOr<MtgCard> Function(SearchByIdRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SearchByIdProvider._internal(
        (ref) => create(ref as SearchByIdRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<MtgCard> createElement() {
    return _SearchByIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SearchByIdProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SearchByIdRef on AutoDisposeFutureProviderRef<MtgCard> {
  /// The parameter `id` of this provider.
  String get id;
}

class _SearchByIdProviderElement
    extends AutoDisposeFutureProviderElement<MtgCard> with SearchByIdRef {
  _SearchByIdProviderElement(super.provider);

  @override
  String get id => (origin as SearchByIdProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
