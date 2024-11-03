// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'articles_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ArticlesEvent {
  Completer<dynamic>? get completer => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Completer<dynamic>? completer) loadArticles,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Completer<dynamic>? completer)? loadArticles,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Completer<dynamic>? completer)? loadArticles,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadArticles value) loadArticles,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadArticles value)? loadArticles,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadArticles value)? loadArticles,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of ArticlesEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ArticlesEventCopyWith<ArticlesEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArticlesEventCopyWith<$Res> {
  factory $ArticlesEventCopyWith(
          ArticlesEvent value, $Res Function(ArticlesEvent) then) =
      _$ArticlesEventCopyWithImpl<$Res, ArticlesEvent>;
  @useResult
  $Res call({Completer<dynamic>? completer});
}

/// @nodoc
class _$ArticlesEventCopyWithImpl<$Res, $Val extends ArticlesEvent>
    implements $ArticlesEventCopyWith<$Res> {
  _$ArticlesEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ArticlesEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? completer = freezed,
  }) {
    return _then(_value.copyWith(
      completer: freezed == completer
          ? _value.completer
          : completer // ignore: cast_nullable_to_non_nullable
              as Completer<dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoadArticlesImplCopyWith<$Res>
    implements $ArticlesEventCopyWith<$Res> {
  factory _$$LoadArticlesImplCopyWith(
          _$LoadArticlesImpl value, $Res Function(_$LoadArticlesImpl) then) =
      __$$LoadArticlesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Completer<dynamic>? completer});
}

/// @nodoc
class __$$LoadArticlesImplCopyWithImpl<$Res>
    extends _$ArticlesEventCopyWithImpl<$Res, _$LoadArticlesImpl>
    implements _$$LoadArticlesImplCopyWith<$Res> {
  __$$LoadArticlesImplCopyWithImpl(
      _$LoadArticlesImpl _value, $Res Function(_$LoadArticlesImpl) _then)
      : super(_value, _then);

  /// Create a copy of ArticlesEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? completer = freezed,
  }) {
    return _then(_$LoadArticlesImpl(
      completer: freezed == completer
          ? _value.completer
          : completer // ignore: cast_nullable_to_non_nullable
              as Completer<dynamic>?,
    ));
  }
}

/// @nodoc

class _$LoadArticlesImpl implements LoadArticles {
  const _$LoadArticlesImpl({this.completer});

  @override
  final Completer<dynamic>? completer;

  @override
  String toString() {
    return 'ArticlesEvent.loadArticles(completer: $completer)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadArticlesImpl &&
            (identical(other.completer, completer) ||
                other.completer == completer));
  }

  @override
  int get hashCode => Object.hash(runtimeType, completer);

  /// Create a copy of ArticlesEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadArticlesImplCopyWith<_$LoadArticlesImpl> get copyWith =>
      __$$LoadArticlesImplCopyWithImpl<_$LoadArticlesImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Completer<dynamic>? completer) loadArticles,
  }) {
    return loadArticles(completer);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Completer<dynamic>? completer)? loadArticles,
  }) {
    return loadArticles?.call(completer);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Completer<dynamic>? completer)? loadArticles,
    required TResult orElse(),
  }) {
    if (loadArticles != null) {
      return loadArticles(completer);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadArticles value) loadArticles,
  }) {
    return loadArticles(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadArticles value)? loadArticles,
  }) {
    return loadArticles?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadArticles value)? loadArticles,
    required TResult orElse(),
  }) {
    if (loadArticles != null) {
      return loadArticles(this);
    }
    return orElse();
  }
}

abstract class LoadArticles implements ArticlesEvent {
  const factory LoadArticles({final Completer<dynamic>? completer}) =
      _$LoadArticlesImpl;

  @override
  Completer<dynamic>? get completer;

  /// Create a copy of ArticlesEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadArticlesImplCopyWith<_$LoadArticlesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ArticlesState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Article> articlesList) loaded,
    required TResult Function(Object? exception) loadingFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Article> articlesList)? loaded,
    TResult? Function(Object? exception)? loadingFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Article> articlesList)? loaded,
    TResult Function(Object? exception)? loadingFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ArticlesInitial value) initial,
    required TResult Function(ArticlesLoading value) loading,
    required TResult Function(ArticlesLoaded value) loaded,
    required TResult Function(ArticlesLoadingFailure value) loadingFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ArticlesInitial value)? initial,
    TResult? Function(ArticlesLoading value)? loading,
    TResult? Function(ArticlesLoaded value)? loaded,
    TResult? Function(ArticlesLoadingFailure value)? loadingFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ArticlesInitial value)? initial,
    TResult Function(ArticlesLoading value)? loading,
    TResult Function(ArticlesLoaded value)? loaded,
    TResult Function(ArticlesLoadingFailure value)? loadingFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArticlesStateCopyWith<$Res> {
  factory $ArticlesStateCopyWith(
          ArticlesState value, $Res Function(ArticlesState) then) =
      _$ArticlesStateCopyWithImpl<$Res, ArticlesState>;
}

/// @nodoc
class _$ArticlesStateCopyWithImpl<$Res, $Val extends ArticlesState>
    implements $ArticlesStateCopyWith<$Res> {
  _$ArticlesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ArticlesState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$ArticlesInitialImplCopyWith<$Res> {
  factory _$$ArticlesInitialImplCopyWith(_$ArticlesInitialImpl value,
          $Res Function(_$ArticlesInitialImpl) then) =
      __$$ArticlesInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ArticlesInitialImplCopyWithImpl<$Res>
    extends _$ArticlesStateCopyWithImpl<$Res, _$ArticlesInitialImpl>
    implements _$$ArticlesInitialImplCopyWith<$Res> {
  __$$ArticlesInitialImplCopyWithImpl(
      _$ArticlesInitialImpl _value, $Res Function(_$ArticlesInitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of ArticlesState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ArticlesInitialImpl implements ArticlesInitial {
  const _$ArticlesInitialImpl();

  @override
  String toString() {
    return 'ArticlesState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ArticlesInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Article> articlesList) loaded,
    required TResult Function(Object? exception) loadingFailure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Article> articlesList)? loaded,
    TResult? Function(Object? exception)? loadingFailure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Article> articlesList)? loaded,
    TResult Function(Object? exception)? loadingFailure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ArticlesInitial value) initial,
    required TResult Function(ArticlesLoading value) loading,
    required TResult Function(ArticlesLoaded value) loaded,
    required TResult Function(ArticlesLoadingFailure value) loadingFailure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ArticlesInitial value)? initial,
    TResult? Function(ArticlesLoading value)? loading,
    TResult? Function(ArticlesLoaded value)? loaded,
    TResult? Function(ArticlesLoadingFailure value)? loadingFailure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ArticlesInitial value)? initial,
    TResult Function(ArticlesLoading value)? loading,
    TResult Function(ArticlesLoaded value)? loaded,
    TResult Function(ArticlesLoadingFailure value)? loadingFailure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class ArticlesInitial implements ArticlesState {
  const factory ArticlesInitial() = _$ArticlesInitialImpl;
}

/// @nodoc
abstract class _$$ArticlesLoadingImplCopyWith<$Res> {
  factory _$$ArticlesLoadingImplCopyWith(_$ArticlesLoadingImpl value,
          $Res Function(_$ArticlesLoadingImpl) then) =
      __$$ArticlesLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ArticlesLoadingImplCopyWithImpl<$Res>
    extends _$ArticlesStateCopyWithImpl<$Res, _$ArticlesLoadingImpl>
    implements _$$ArticlesLoadingImplCopyWith<$Res> {
  __$$ArticlesLoadingImplCopyWithImpl(
      _$ArticlesLoadingImpl _value, $Res Function(_$ArticlesLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of ArticlesState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ArticlesLoadingImpl implements ArticlesLoading {
  const _$ArticlesLoadingImpl();

  @override
  String toString() {
    return 'ArticlesState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ArticlesLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Article> articlesList) loaded,
    required TResult Function(Object? exception) loadingFailure,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Article> articlesList)? loaded,
    TResult? Function(Object? exception)? loadingFailure,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Article> articlesList)? loaded,
    TResult Function(Object? exception)? loadingFailure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ArticlesInitial value) initial,
    required TResult Function(ArticlesLoading value) loading,
    required TResult Function(ArticlesLoaded value) loaded,
    required TResult Function(ArticlesLoadingFailure value) loadingFailure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ArticlesInitial value)? initial,
    TResult? Function(ArticlesLoading value)? loading,
    TResult? Function(ArticlesLoaded value)? loaded,
    TResult? Function(ArticlesLoadingFailure value)? loadingFailure,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ArticlesInitial value)? initial,
    TResult Function(ArticlesLoading value)? loading,
    TResult Function(ArticlesLoaded value)? loaded,
    TResult Function(ArticlesLoadingFailure value)? loadingFailure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class ArticlesLoading implements ArticlesState {
  const factory ArticlesLoading() = _$ArticlesLoadingImpl;
}

/// @nodoc
abstract class _$$ArticlesLoadedImplCopyWith<$Res> {
  factory _$$ArticlesLoadedImplCopyWith(_$ArticlesLoadedImpl value,
          $Res Function(_$ArticlesLoadedImpl) then) =
      __$$ArticlesLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Article> articlesList});
}

/// @nodoc
class __$$ArticlesLoadedImplCopyWithImpl<$Res>
    extends _$ArticlesStateCopyWithImpl<$Res, _$ArticlesLoadedImpl>
    implements _$$ArticlesLoadedImplCopyWith<$Res> {
  __$$ArticlesLoadedImplCopyWithImpl(
      _$ArticlesLoadedImpl _value, $Res Function(_$ArticlesLoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of ArticlesState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? articlesList = null,
  }) {
    return _then(_$ArticlesLoadedImpl(
      null == articlesList
          ? _value._articlesList
          : articlesList // ignore: cast_nullable_to_non_nullable
              as List<Article>,
    ));
  }
}

/// @nodoc

class _$ArticlesLoadedImpl implements ArticlesLoaded {
  const _$ArticlesLoadedImpl(final List<Article> articlesList)
      : _articlesList = articlesList;

  final List<Article> _articlesList;
  @override
  List<Article> get articlesList {
    if (_articlesList is EqualUnmodifiableListView) return _articlesList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_articlesList);
  }

  @override
  String toString() {
    return 'ArticlesState.loaded(articlesList: $articlesList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ArticlesLoadedImpl &&
            const DeepCollectionEquality()
                .equals(other._articlesList, _articlesList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_articlesList));

  /// Create a copy of ArticlesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ArticlesLoadedImplCopyWith<_$ArticlesLoadedImpl> get copyWith =>
      __$$ArticlesLoadedImplCopyWithImpl<_$ArticlesLoadedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Article> articlesList) loaded,
    required TResult Function(Object? exception) loadingFailure,
  }) {
    return loaded(articlesList);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Article> articlesList)? loaded,
    TResult? Function(Object? exception)? loadingFailure,
  }) {
    return loaded?.call(articlesList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Article> articlesList)? loaded,
    TResult Function(Object? exception)? loadingFailure,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(articlesList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ArticlesInitial value) initial,
    required TResult Function(ArticlesLoading value) loading,
    required TResult Function(ArticlesLoaded value) loaded,
    required TResult Function(ArticlesLoadingFailure value) loadingFailure,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ArticlesInitial value)? initial,
    TResult? Function(ArticlesLoading value)? loading,
    TResult? Function(ArticlesLoaded value)? loaded,
    TResult? Function(ArticlesLoadingFailure value)? loadingFailure,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ArticlesInitial value)? initial,
    TResult Function(ArticlesLoading value)? loading,
    TResult Function(ArticlesLoaded value)? loaded,
    TResult Function(ArticlesLoadingFailure value)? loadingFailure,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class ArticlesLoaded implements ArticlesState {
  const factory ArticlesLoaded(final List<Article> articlesList) =
      _$ArticlesLoadedImpl;

  List<Article> get articlesList;

  /// Create a copy of ArticlesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ArticlesLoadedImplCopyWith<_$ArticlesLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ArticlesLoadingFailureImplCopyWith<$Res> {
  factory _$$ArticlesLoadingFailureImplCopyWith(
          _$ArticlesLoadingFailureImpl value,
          $Res Function(_$ArticlesLoadingFailureImpl) then) =
      __$$ArticlesLoadingFailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Object? exception});
}

/// @nodoc
class __$$ArticlesLoadingFailureImplCopyWithImpl<$Res>
    extends _$ArticlesStateCopyWithImpl<$Res, _$ArticlesLoadingFailureImpl>
    implements _$$ArticlesLoadingFailureImplCopyWith<$Res> {
  __$$ArticlesLoadingFailureImplCopyWithImpl(
      _$ArticlesLoadingFailureImpl _value,
      $Res Function(_$ArticlesLoadingFailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of ArticlesState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exception = freezed,
  }) {
    return _then(_$ArticlesLoadingFailureImpl(
      freezed == exception ? _value.exception : exception,
    ));
  }
}

/// @nodoc

class _$ArticlesLoadingFailureImpl implements ArticlesLoadingFailure {
  const _$ArticlesLoadingFailureImpl(this.exception);

  @override
  final Object? exception;

  @override
  String toString() {
    return 'ArticlesState.loadingFailure(exception: $exception)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ArticlesLoadingFailureImpl &&
            const DeepCollectionEquality().equals(other.exception, exception));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(exception));

  /// Create a copy of ArticlesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ArticlesLoadingFailureImplCopyWith<_$ArticlesLoadingFailureImpl>
      get copyWith => __$$ArticlesLoadingFailureImplCopyWithImpl<
          _$ArticlesLoadingFailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Article> articlesList) loaded,
    required TResult Function(Object? exception) loadingFailure,
  }) {
    return loadingFailure(exception);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Article> articlesList)? loaded,
    TResult? Function(Object? exception)? loadingFailure,
  }) {
    return loadingFailure?.call(exception);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Article> articlesList)? loaded,
    TResult Function(Object? exception)? loadingFailure,
    required TResult orElse(),
  }) {
    if (loadingFailure != null) {
      return loadingFailure(exception);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ArticlesInitial value) initial,
    required TResult Function(ArticlesLoading value) loading,
    required TResult Function(ArticlesLoaded value) loaded,
    required TResult Function(ArticlesLoadingFailure value) loadingFailure,
  }) {
    return loadingFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ArticlesInitial value)? initial,
    TResult? Function(ArticlesLoading value)? loading,
    TResult? Function(ArticlesLoaded value)? loaded,
    TResult? Function(ArticlesLoadingFailure value)? loadingFailure,
  }) {
    return loadingFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ArticlesInitial value)? initial,
    TResult Function(ArticlesLoading value)? loading,
    TResult Function(ArticlesLoaded value)? loaded,
    TResult Function(ArticlesLoadingFailure value)? loadingFailure,
    required TResult orElse(),
  }) {
    if (loadingFailure != null) {
      return loadingFailure(this);
    }
    return orElse();
  }
}

abstract class ArticlesLoadingFailure implements ArticlesState {
  const factory ArticlesLoadingFailure(final Object? exception) =
      _$ArticlesLoadingFailureImpl;

  Object? get exception;

  /// Create a copy of ArticlesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ArticlesLoadingFailureImplCopyWith<_$ArticlesLoadingFailureImpl>
      get copyWith => throw _privateConstructorUsedError;
}
