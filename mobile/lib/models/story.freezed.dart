// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'story.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GetFeedStoriesResponse _$GetFeedStoriesResponseFromJson(
    Map<String, dynamic> json) {
  return _GetFeedStoriesResponse.fromJson(json);
}

/// @nodoc
mixin _$GetFeedStoriesResponse {
  bool get success => throw _privateConstructorUsedError;
  FeedStories get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetFeedStoriesResponseCopyWith<GetFeedStoriesResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetFeedStoriesResponseCopyWith<$Res> {
  factory $GetFeedStoriesResponseCopyWith(GetFeedStoriesResponse value,
          $Res Function(GetFeedStoriesResponse) then) =
      _$GetFeedStoriesResponseCopyWithImpl<$Res, GetFeedStoriesResponse>;
  @useResult
  $Res call({bool success, FeedStories data});

  $FeedStoriesCopyWith<$Res> get data;
}

/// @nodoc
class _$GetFeedStoriesResponseCopyWithImpl<$Res,
        $Val extends GetFeedStoriesResponse>
    implements $GetFeedStoriesResponseCopyWith<$Res> {
  _$GetFeedStoriesResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as FeedStories,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $FeedStoriesCopyWith<$Res> get data {
    return $FeedStoriesCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GetFeedStoriesResponseImplCopyWith<$Res>
    implements $GetFeedStoriesResponseCopyWith<$Res> {
  factory _$$GetFeedStoriesResponseImplCopyWith(
          _$GetFeedStoriesResponseImpl value,
          $Res Function(_$GetFeedStoriesResponseImpl) then) =
      __$$GetFeedStoriesResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, FeedStories data});

  @override
  $FeedStoriesCopyWith<$Res> get data;
}

/// @nodoc
class __$$GetFeedStoriesResponseImplCopyWithImpl<$Res>
    extends _$GetFeedStoriesResponseCopyWithImpl<$Res,
        _$GetFeedStoriesResponseImpl>
    implements _$$GetFeedStoriesResponseImplCopyWith<$Res> {
  __$$GetFeedStoriesResponseImplCopyWithImpl(
      _$GetFeedStoriesResponseImpl _value,
      $Res Function(_$GetFeedStoriesResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? data = null,
  }) {
    return _then(_$GetFeedStoriesResponseImpl(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as FeedStories,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetFeedStoriesResponseImpl implements _GetFeedStoriesResponse {
  const _$GetFeedStoriesResponseImpl(
      {required this.success, required this.data});

  factory _$GetFeedStoriesResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetFeedStoriesResponseImplFromJson(json);

  @override
  final bool success;
  @override
  final FeedStories data;

  @override
  String toString() {
    return 'GetFeedStoriesResponse(success: $success, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetFeedStoriesResponseImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, success, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetFeedStoriesResponseImplCopyWith<_$GetFeedStoriesResponseImpl>
      get copyWith => __$$GetFeedStoriesResponseImplCopyWithImpl<
          _$GetFeedStoriesResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetFeedStoriesResponseImplToJson(
      this,
    );
  }
}

abstract class _GetFeedStoriesResponse implements GetFeedStoriesResponse {
  const factory _GetFeedStoriesResponse(
      {required final bool success,
      required final FeedStories data}) = _$GetFeedStoriesResponseImpl;

  factory _GetFeedStoriesResponse.fromJson(Map<String, dynamic> json) =
      _$GetFeedStoriesResponseImpl.fromJson;

  @override
  bool get success;
  @override
  FeedStories get data;
  @override
  @JsonKey(ignore: true)
  _$$GetFeedStoriesResponseImplCopyWith<_$GetFeedStoriesResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

FeedStories _$FeedStoriesFromJson(Map<String, dynamic> json) {
  return _FeedStories.fromJson(json);
}

/// @nodoc
mixin _$FeedStories {
  List<GetFeedStoriesResponseData> get currentUserStories =>
      throw _privateConstructorUsedError;
  List<GetFeedStoriesResponseData> get otherUserStories =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FeedStoriesCopyWith<FeedStories> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeedStoriesCopyWith<$Res> {
  factory $FeedStoriesCopyWith(
          FeedStories value, $Res Function(FeedStories) then) =
      _$FeedStoriesCopyWithImpl<$Res, FeedStories>;
  @useResult
  $Res call(
      {List<GetFeedStoriesResponseData> currentUserStories,
      List<GetFeedStoriesResponseData> otherUserStories});
}

/// @nodoc
class _$FeedStoriesCopyWithImpl<$Res, $Val extends FeedStories>
    implements $FeedStoriesCopyWith<$Res> {
  _$FeedStoriesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentUserStories = null,
    Object? otherUserStories = null,
  }) {
    return _then(_value.copyWith(
      currentUserStories: null == currentUserStories
          ? _value.currentUserStories
          : currentUserStories // ignore: cast_nullable_to_non_nullable
              as List<GetFeedStoriesResponseData>,
      otherUserStories: null == otherUserStories
          ? _value.otherUserStories
          : otherUserStories // ignore: cast_nullable_to_non_nullable
              as List<GetFeedStoriesResponseData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FeedStoriesImplCopyWith<$Res>
    implements $FeedStoriesCopyWith<$Res> {
  factory _$$FeedStoriesImplCopyWith(
          _$FeedStoriesImpl value, $Res Function(_$FeedStoriesImpl) then) =
      __$$FeedStoriesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<GetFeedStoriesResponseData> currentUserStories,
      List<GetFeedStoriesResponseData> otherUserStories});
}

/// @nodoc
class __$$FeedStoriesImplCopyWithImpl<$Res>
    extends _$FeedStoriesCopyWithImpl<$Res, _$FeedStoriesImpl>
    implements _$$FeedStoriesImplCopyWith<$Res> {
  __$$FeedStoriesImplCopyWithImpl(
      _$FeedStoriesImpl _value, $Res Function(_$FeedStoriesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentUserStories = null,
    Object? otherUserStories = null,
  }) {
    return _then(_$FeedStoriesImpl(
      currentUserStories: null == currentUserStories
          ? _value._currentUserStories
          : currentUserStories // ignore: cast_nullable_to_non_nullable
              as List<GetFeedStoriesResponseData>,
      otherUserStories: null == otherUserStories
          ? _value._otherUserStories
          : otherUserStories // ignore: cast_nullable_to_non_nullable
              as List<GetFeedStoriesResponseData>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FeedStoriesImpl implements _FeedStories {
  const _$FeedStoriesImpl(
      {required final List<GetFeedStoriesResponseData> currentUserStories,
      required final List<GetFeedStoriesResponseData> otherUserStories})
      : _currentUserStories = currentUserStories,
        _otherUserStories = otherUserStories;

  factory _$FeedStoriesImpl.fromJson(Map<String, dynamic> json) =>
      _$$FeedStoriesImplFromJson(json);

  final List<GetFeedStoriesResponseData> _currentUserStories;
  @override
  List<GetFeedStoriesResponseData> get currentUserStories {
    if (_currentUserStories is EqualUnmodifiableListView)
      return _currentUserStories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_currentUserStories);
  }

  final List<GetFeedStoriesResponseData> _otherUserStories;
  @override
  List<GetFeedStoriesResponseData> get otherUserStories {
    if (_otherUserStories is EqualUnmodifiableListView)
      return _otherUserStories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_otherUserStories);
  }

  @override
  String toString() {
    return 'FeedStories(currentUserStories: $currentUserStories, otherUserStories: $otherUserStories)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FeedStoriesImpl &&
            const DeepCollectionEquality()
                .equals(other._currentUserStories, _currentUserStories) &&
            const DeepCollectionEquality()
                .equals(other._otherUserStories, _otherUserStories));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_currentUserStories),
      const DeepCollectionEquality().hash(_otherUserStories));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FeedStoriesImplCopyWith<_$FeedStoriesImpl> get copyWith =>
      __$$FeedStoriesImplCopyWithImpl<_$FeedStoriesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FeedStoriesImplToJson(
      this,
    );
  }
}

abstract class _FeedStories implements FeedStories {
  const factory _FeedStories(
          {required final List<GetFeedStoriesResponseData> currentUserStories,
          required final List<GetFeedStoriesResponseData> otherUserStories}) =
      _$FeedStoriesImpl;

  factory _FeedStories.fromJson(Map<String, dynamic> json) =
      _$FeedStoriesImpl.fromJson;

  @override
  List<GetFeedStoriesResponseData> get currentUserStories;
  @override
  List<GetFeedStoriesResponseData> get otherUserStories;
  @override
  @JsonKey(ignore: true)
  _$$FeedStoriesImplCopyWith<_$FeedStoriesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

StoryAssetItem _$StoryAssetItemFromJson(Map<String, dynamic> json) {
  return _StoryAssetItem.fromJson(json);
}

/// @nodoc
mixin _$StoryAssetItem {
  String get assetType => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StoryAssetItemCopyWith<StoryAssetItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoryAssetItemCopyWith<$Res> {
  factory $StoryAssetItemCopyWith(
          StoryAssetItem value, $Res Function(StoryAssetItem) then) =
      _$StoryAssetItemCopyWithImpl<$Res, StoryAssetItem>;
  @useResult
  $Res call({String assetType, String url});
}

/// @nodoc
class _$StoryAssetItemCopyWithImpl<$Res, $Val extends StoryAssetItem>
    implements $StoryAssetItemCopyWith<$Res> {
  _$StoryAssetItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? assetType = null,
    Object? url = null,
  }) {
    return _then(_value.copyWith(
      assetType: null == assetType
          ? _value.assetType
          : assetType // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StoryAssetItemImplCopyWith<$Res>
    implements $StoryAssetItemCopyWith<$Res> {
  factory _$$StoryAssetItemImplCopyWith(_$StoryAssetItemImpl value,
          $Res Function(_$StoryAssetItemImpl) then) =
      __$$StoryAssetItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String assetType, String url});
}

/// @nodoc
class __$$StoryAssetItemImplCopyWithImpl<$Res>
    extends _$StoryAssetItemCopyWithImpl<$Res, _$StoryAssetItemImpl>
    implements _$$StoryAssetItemImplCopyWith<$Res> {
  __$$StoryAssetItemImplCopyWithImpl(
      _$StoryAssetItemImpl _value, $Res Function(_$StoryAssetItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? assetType = null,
    Object? url = null,
  }) {
    return _then(_$StoryAssetItemImpl(
      assetType: null == assetType
          ? _value.assetType
          : assetType // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StoryAssetItemImpl implements _StoryAssetItem {
  const _$StoryAssetItemImpl({required this.assetType, required this.url});

  factory _$StoryAssetItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$StoryAssetItemImplFromJson(json);

  @override
  final String assetType;
  @override
  final String url;

  @override
  String toString() {
    return 'StoryAssetItem(assetType: $assetType, url: $url)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StoryAssetItemImpl &&
            (identical(other.assetType, assetType) ||
                other.assetType == assetType) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, assetType, url);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StoryAssetItemImplCopyWith<_$StoryAssetItemImpl> get copyWith =>
      __$$StoryAssetItemImplCopyWithImpl<_$StoryAssetItemImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StoryAssetItemImplToJson(
      this,
    );
  }
}

abstract class _StoryAssetItem implements StoryAssetItem {
  const factory _StoryAssetItem(
      {required final String assetType,
      required final String url}) = _$StoryAssetItemImpl;

  factory _StoryAssetItem.fromJson(Map<String, dynamic> json) =
      _$StoryAssetItemImpl.fromJson;

  @override
  String get assetType;
  @override
  String get url;
  @override
  @JsonKey(ignore: true)
  _$$StoryAssetItemImplCopyWith<_$StoryAssetItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

StoryItem _$StoryItemFromJson(Map<String, dynamic> json) {
  return _StoryItem.fromJson(json);
}

/// @nodoc
mixin _$StoryItem {
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
  StoryAssetItem get asset => throw _privateConstructorUsedError;
  bool get isViewed => throw _privateConstructorUsedError;
  int? get viewCount => throw _privateConstructorUsedError;
  @DateTimeConvertor()
  DateTime get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StoryItemCopyWith<StoryItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoryItemCopyWith<$Res> {
  factory $StoryItemCopyWith(StoryItem value, $Res Function(StoryItem) then) =
      _$StoryItemCopyWithImpl<$Res, StoryItem>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      StoryAssetItem asset,
      bool isViewed,
      int? viewCount,
      @DateTimeConvertor() DateTime createdAt});

  $StoryAssetItemCopyWith<$Res> get asset;
}

/// @nodoc
class _$StoryItemCopyWithImpl<$Res, $Val extends StoryItem>
    implements $StoryItemCopyWith<$Res> {
  _$StoryItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? asset = null,
    Object? isViewed = null,
    Object? viewCount = freezed,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      asset: null == asset
          ? _value.asset
          : asset // ignore: cast_nullable_to_non_nullable
              as StoryAssetItem,
      isViewed: null == isViewed
          ? _value.isViewed
          : isViewed // ignore: cast_nullable_to_non_nullable
              as bool,
      viewCount: freezed == viewCount
          ? _value.viewCount
          : viewCount // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $StoryAssetItemCopyWith<$Res> get asset {
    return $StoryAssetItemCopyWith<$Res>(_value.asset, (value) {
      return _then(_value.copyWith(asset: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$StoryItemImplCopyWith<$Res>
    implements $StoryItemCopyWith<$Res> {
  factory _$$StoryItemImplCopyWith(
          _$StoryItemImpl value, $Res Function(_$StoryItemImpl) then) =
      __$$StoryItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      StoryAssetItem asset,
      bool isViewed,
      int? viewCount,
      @DateTimeConvertor() DateTime createdAt});

  @override
  $StoryAssetItemCopyWith<$Res> get asset;
}

/// @nodoc
class __$$StoryItemImplCopyWithImpl<$Res>
    extends _$StoryItemCopyWithImpl<$Res, _$StoryItemImpl>
    implements _$$StoryItemImplCopyWith<$Res> {
  __$$StoryItemImplCopyWithImpl(
      _$StoryItemImpl _value, $Res Function(_$StoryItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? asset = null,
    Object? isViewed = null,
    Object? viewCount = freezed,
    Object? createdAt = null,
  }) {
    return _then(_$StoryItemImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      asset: null == asset
          ? _value.asset
          : asset // ignore: cast_nullable_to_non_nullable
              as StoryAssetItem,
      isViewed: null == isViewed
          ? _value.isViewed
          : isViewed // ignore: cast_nullable_to_non_nullable
              as bool,
      viewCount: freezed == viewCount
          ? _value.viewCount
          : viewCount // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StoryItemImpl implements _StoryItem {
  const _$StoryItemImpl(
      {@JsonKey(name: '_id') required this.id,
      required this.asset,
      required this.isViewed,
      required this.viewCount,
      @DateTimeConvertor() required this.createdAt});

  factory _$StoryItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$StoryItemImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  final StoryAssetItem asset;
  @override
  final bool isViewed;
  @override
  final int? viewCount;
  @override
  @DateTimeConvertor()
  final DateTime createdAt;

  @override
  String toString() {
    return 'StoryItem(id: $id, asset: $asset, isViewed: $isViewed, viewCount: $viewCount, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StoryItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.asset, asset) || other.asset == asset) &&
            (identical(other.isViewed, isViewed) ||
                other.isViewed == isViewed) &&
            (identical(other.viewCount, viewCount) ||
                other.viewCount == viewCount) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, asset, isViewed, viewCount, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StoryItemImplCopyWith<_$StoryItemImpl> get copyWith =>
      __$$StoryItemImplCopyWithImpl<_$StoryItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StoryItemImplToJson(
      this,
    );
  }
}

abstract class _StoryItem implements StoryItem {
  const factory _StoryItem(
          {@JsonKey(name: '_id') required final String id,
          required final StoryAssetItem asset,
          required final bool isViewed,
          required final int? viewCount,
          @DateTimeConvertor() required final DateTime createdAt}) =
      _$StoryItemImpl;

  factory _StoryItem.fromJson(Map<String, dynamic> json) =
      _$StoryItemImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String get id;
  @override
  StoryAssetItem get asset;
  @override
  bool get isViewed;
  @override
  int? get viewCount;
  @override
  @DateTimeConvertor()
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$StoryItemImplCopyWith<_$StoryItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GetFeedStoriesResponseData _$GetFeedStoriesResponseDataFromJson(
    Map<String, dynamic> json) {
  return _GetFeedStoriesResponseData.fromJson(json);
}

/// @nodoc
mixin _$GetFeedStoriesResponseData {
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get avatar => throw _privateConstructorUsedError;
  List<StoryItem> get stories => throw _privateConstructorUsedError;
  bool get hasPending => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetFeedStoriesResponseDataCopyWith<GetFeedStoriesResponseData>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetFeedStoriesResponseDataCopyWith<$Res> {
  factory $GetFeedStoriesResponseDataCopyWith(GetFeedStoriesResponseData value,
          $Res Function(GetFeedStoriesResponseData) then) =
      _$GetFeedStoriesResponseDataCopyWithImpl<$Res,
          GetFeedStoriesResponseData>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      String username,
      String name,
      String avatar,
      List<StoryItem> stories,
      bool hasPending});
}

/// @nodoc
class _$GetFeedStoriesResponseDataCopyWithImpl<$Res,
        $Val extends GetFeedStoriesResponseData>
    implements $GetFeedStoriesResponseDataCopyWith<$Res> {
  _$GetFeedStoriesResponseDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? username = null,
    Object? name = null,
    Object? avatar = null,
    Object? stories = null,
    Object? hasPending = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: null == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String,
      stories: null == stories
          ? _value.stories
          : stories // ignore: cast_nullable_to_non_nullable
              as List<StoryItem>,
      hasPending: null == hasPending
          ? _value.hasPending
          : hasPending // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetFeedStoriesResponseDataImplCopyWith<$Res>
    implements $GetFeedStoriesResponseDataCopyWith<$Res> {
  factory _$$GetFeedStoriesResponseDataImplCopyWith(
          _$GetFeedStoriesResponseDataImpl value,
          $Res Function(_$GetFeedStoriesResponseDataImpl) then) =
      __$$GetFeedStoriesResponseDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      String username,
      String name,
      String avatar,
      List<StoryItem> stories,
      bool hasPending});
}

/// @nodoc
class __$$GetFeedStoriesResponseDataImplCopyWithImpl<$Res>
    extends _$GetFeedStoriesResponseDataCopyWithImpl<$Res,
        _$GetFeedStoriesResponseDataImpl>
    implements _$$GetFeedStoriesResponseDataImplCopyWith<$Res> {
  __$$GetFeedStoriesResponseDataImplCopyWithImpl(
      _$GetFeedStoriesResponseDataImpl _value,
      $Res Function(_$GetFeedStoriesResponseDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? username = null,
    Object? name = null,
    Object? avatar = null,
    Object? stories = null,
    Object? hasPending = null,
  }) {
    return _then(_$GetFeedStoriesResponseDataImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: null == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String,
      stories: null == stories
          ? _value._stories
          : stories // ignore: cast_nullable_to_non_nullable
              as List<StoryItem>,
      hasPending: null == hasPending
          ? _value.hasPending
          : hasPending // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetFeedStoriesResponseDataImpl implements _GetFeedStoriesResponseData {
  const _$GetFeedStoriesResponseDataImpl(
      {@JsonKey(name: '_id') required this.id,
      required this.username,
      required this.name,
      required this.avatar,
      required final List<StoryItem> stories,
      required this.hasPending})
      : _stories = stories;

  factory _$GetFeedStoriesResponseDataImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$GetFeedStoriesResponseDataImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  final String username;
  @override
  final String name;
  @override
  final String avatar;
  final List<StoryItem> _stories;
  @override
  List<StoryItem> get stories {
    if (_stories is EqualUnmodifiableListView) return _stories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_stories);
  }

  @override
  final bool hasPending;

  @override
  String toString() {
    return 'GetFeedStoriesResponseData(id: $id, username: $username, name: $name, avatar: $avatar, stories: $stories, hasPending: $hasPending)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetFeedStoriesResponseDataImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            const DeepCollectionEquality().equals(other._stories, _stories) &&
            (identical(other.hasPending, hasPending) ||
                other.hasPending == hasPending));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, username, name, avatar,
      const DeepCollectionEquality().hash(_stories), hasPending);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetFeedStoriesResponseDataImplCopyWith<_$GetFeedStoriesResponseDataImpl>
      get copyWith => __$$GetFeedStoriesResponseDataImplCopyWithImpl<
          _$GetFeedStoriesResponseDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetFeedStoriesResponseDataImplToJson(
      this,
    );
  }
}

abstract class _GetFeedStoriesResponseData
    implements GetFeedStoriesResponseData {
  const factory _GetFeedStoriesResponseData(
      {@JsonKey(name: '_id') required final String id,
      required final String username,
      required final String name,
      required final String avatar,
      required final List<StoryItem> stories,
      required final bool hasPending}) = _$GetFeedStoriesResponseDataImpl;

  factory _GetFeedStoriesResponseData.fromJson(Map<String, dynamic> json) =
      _$GetFeedStoriesResponseDataImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String get id;
  @override
  String get username;
  @override
  String get name;
  @override
  String get avatar;
  @override
  List<StoryItem> get stories;
  @override
  bool get hasPending;
  @override
  @JsonKey(ignore: true)
  _$$GetFeedStoriesResponseDataImplCopyWith<_$GetFeedStoriesResponseDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}

GetStoryViewersResponse _$GetStoryViewersResponseFromJson(
    Map<String, dynamic> json) {
  return _GetStoryViewersResponse.fromJson(json);
}

/// @nodoc
mixin _$GetStoryViewersResponse {
  bool get success => throw _privateConstructorUsedError;
  List<GetStoryViewersResponseData> get data =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetStoryViewersResponseCopyWith<GetStoryViewersResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetStoryViewersResponseCopyWith<$Res> {
  factory $GetStoryViewersResponseCopyWith(GetStoryViewersResponse value,
          $Res Function(GetStoryViewersResponse) then) =
      _$GetStoryViewersResponseCopyWithImpl<$Res, GetStoryViewersResponse>;
  @useResult
  $Res call({bool success, List<GetStoryViewersResponseData> data});
}

/// @nodoc
class _$GetStoryViewersResponseCopyWithImpl<$Res,
        $Val extends GetStoryViewersResponse>
    implements $GetStoryViewersResponseCopyWith<$Res> {
  _$GetStoryViewersResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<GetStoryViewersResponseData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetStoryViewersResponseImplCopyWith<$Res>
    implements $GetStoryViewersResponseCopyWith<$Res> {
  factory _$$GetStoryViewersResponseImplCopyWith(
          _$GetStoryViewersResponseImpl value,
          $Res Function(_$GetStoryViewersResponseImpl) then) =
      __$$GetStoryViewersResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, List<GetStoryViewersResponseData> data});
}

/// @nodoc
class __$$GetStoryViewersResponseImplCopyWithImpl<$Res>
    extends _$GetStoryViewersResponseCopyWithImpl<$Res,
        _$GetStoryViewersResponseImpl>
    implements _$$GetStoryViewersResponseImplCopyWith<$Res> {
  __$$GetStoryViewersResponseImplCopyWithImpl(
      _$GetStoryViewersResponseImpl _value,
      $Res Function(_$GetStoryViewersResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? data = null,
  }) {
    return _then(_$GetStoryViewersResponseImpl(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<GetStoryViewersResponseData>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetStoryViewersResponseImpl implements _GetStoryViewersResponse {
  const _$GetStoryViewersResponseImpl(
      {required this.success,
      required final List<GetStoryViewersResponseData> data})
      : _data = data;

  factory _$GetStoryViewersResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetStoryViewersResponseImplFromJson(json);

  @override
  final bool success;
  final List<GetStoryViewersResponseData> _data;
  @override
  List<GetStoryViewersResponseData> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'GetStoryViewersResponse(success: $success, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetStoryViewersResponseImpl &&
            (identical(other.success, success) || other.success == success) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, success, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetStoryViewersResponseImplCopyWith<_$GetStoryViewersResponseImpl>
      get copyWith => __$$GetStoryViewersResponseImplCopyWithImpl<
          _$GetStoryViewersResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetStoryViewersResponseImplToJson(
      this,
    );
  }
}

abstract class _GetStoryViewersResponse implements GetStoryViewersResponse {
  const factory _GetStoryViewersResponse(
          {required final bool success,
          required final List<GetStoryViewersResponseData> data}) =
      _$GetStoryViewersResponseImpl;

  factory _GetStoryViewersResponse.fromJson(Map<String, dynamic> json) =
      _$GetStoryViewersResponseImpl.fromJson;

  @override
  bool get success;
  @override
  List<GetStoryViewersResponseData> get data;
  @override
  @JsonKey(ignore: true)
  _$$GetStoryViewersResponseImplCopyWith<_$GetStoryViewersResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

GetStoryViewersResponseData _$GetStoryViewersResponseDataFromJson(
    Map<String, dynamic> json) {
  return _GetStoryViewersResponseData.fromJson(json);
}

/// @nodoc
mixin _$GetStoryViewersResponseData {
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String get avatar => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetStoryViewersResponseDataCopyWith<GetStoryViewersResponseData>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetStoryViewersResponseDataCopyWith<$Res> {
  factory $GetStoryViewersResponseDataCopyWith(
          GetStoryViewersResponseData value,
          $Res Function(GetStoryViewersResponseData) then) =
      _$GetStoryViewersResponseDataCopyWithImpl<$Res,
          GetStoryViewersResponseData>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      String name,
      String username,
      String avatar});
}

/// @nodoc
class _$GetStoryViewersResponseDataCopyWithImpl<$Res,
        $Val extends GetStoryViewersResponseData>
    implements $GetStoryViewersResponseDataCopyWith<$Res> {
  _$GetStoryViewersResponseDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? username = null,
    Object? avatar = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: null == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetStoryViewersResponseDataImplCopyWith<$Res>
    implements $GetStoryViewersResponseDataCopyWith<$Res> {
  factory _$$GetStoryViewersResponseDataImplCopyWith(
          _$GetStoryViewersResponseDataImpl value,
          $Res Function(_$GetStoryViewersResponseDataImpl) then) =
      __$$GetStoryViewersResponseDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      String name,
      String username,
      String avatar});
}

/// @nodoc
class __$$GetStoryViewersResponseDataImplCopyWithImpl<$Res>
    extends _$GetStoryViewersResponseDataCopyWithImpl<$Res,
        _$GetStoryViewersResponseDataImpl>
    implements _$$GetStoryViewersResponseDataImplCopyWith<$Res> {
  __$$GetStoryViewersResponseDataImplCopyWithImpl(
      _$GetStoryViewersResponseDataImpl _value,
      $Res Function(_$GetStoryViewersResponseDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? username = null,
    Object? avatar = null,
  }) {
    return _then(_$GetStoryViewersResponseDataImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: null == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetStoryViewersResponseDataImpl
    implements _GetStoryViewersResponseData {
  const _$GetStoryViewersResponseDataImpl(
      {@JsonKey(name: '_id') required this.id,
      required this.name,
      required this.username,
      required this.avatar});

  factory _$GetStoryViewersResponseDataImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$GetStoryViewersResponseDataImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  final String name;
  @override
  final String username;
  @override
  final String avatar;

  @override
  String toString() {
    return 'GetStoryViewersResponseData(id: $id, name: $name, username: $username, avatar: $avatar)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetStoryViewersResponseDataImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.avatar, avatar) || other.avatar == avatar));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, username, avatar);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetStoryViewersResponseDataImplCopyWith<_$GetStoryViewersResponseDataImpl>
      get copyWith => __$$GetStoryViewersResponseDataImplCopyWithImpl<
          _$GetStoryViewersResponseDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetStoryViewersResponseDataImplToJson(
      this,
    );
  }
}

abstract class _GetStoryViewersResponseData
    implements GetStoryViewersResponseData {
  const factory _GetStoryViewersResponseData(
      {@JsonKey(name: '_id') required final String id,
      required final String name,
      required final String username,
      required final String avatar}) = _$GetStoryViewersResponseDataImpl;

  factory _GetStoryViewersResponseData.fromJson(Map<String, dynamic> json) =
      _$GetStoryViewersResponseDataImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String get id;
  @override
  String get name;
  @override
  String get username;
  @override
  String get avatar;
  @override
  @JsonKey(ignore: true)
  _$$GetStoryViewersResponseDataImplCopyWith<_$GetStoryViewersResponseDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}
