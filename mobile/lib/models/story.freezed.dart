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

StoryUserItem _$StoryUserItemFromJson(Map<String, dynamic> json) {
  return _StoryUserItem.fromJson(json);
}

/// @nodoc
mixin _$StoryUserItem {
  String get name => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String get avatar => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StoryUserItemCopyWith<StoryUserItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoryUserItemCopyWith<$Res> {
  factory $StoryUserItemCopyWith(
          StoryUserItem value, $Res Function(StoryUserItem) then) =
      _$StoryUserItemCopyWithImpl<$Res, StoryUserItem>;
  @useResult
  $Res call({String name, String username, String avatar});
}

/// @nodoc
class _$StoryUserItemCopyWithImpl<$Res, $Val extends StoryUserItem>
    implements $StoryUserItemCopyWith<$Res> {
  _$StoryUserItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? username = null,
    Object? avatar = null,
  }) {
    return _then(_value.copyWith(
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
abstract class _$$StoryUserItemImplCopyWith<$Res>
    implements $StoryUserItemCopyWith<$Res> {
  factory _$$StoryUserItemImplCopyWith(
          _$StoryUserItemImpl value, $Res Function(_$StoryUserItemImpl) then) =
      __$$StoryUserItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String username, String avatar});
}

/// @nodoc
class __$$StoryUserItemImplCopyWithImpl<$Res>
    extends _$StoryUserItemCopyWithImpl<$Res, _$StoryUserItemImpl>
    implements _$$StoryUserItemImplCopyWith<$Res> {
  __$$StoryUserItemImplCopyWithImpl(
      _$StoryUserItemImpl _value, $Res Function(_$StoryUserItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? username = null,
    Object? avatar = null,
  }) {
    return _then(_$StoryUserItemImpl(
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
class _$StoryUserItemImpl implements _StoryUserItem {
  const _$StoryUserItemImpl(
      {required this.name, required this.username, required this.avatar});

  factory _$StoryUserItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$StoryUserItemImplFromJson(json);

  @override
  final String name;
  @override
  final String username;
  @override
  final String avatar;

  @override
  String toString() {
    return 'StoryUserItem(name: $name, username: $username, avatar: $avatar)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StoryUserItemImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.avatar, avatar) || other.avatar == avatar));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, username, avatar);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StoryUserItemImplCopyWith<_$StoryUserItemImpl> get copyWith =>
      __$$StoryUserItemImplCopyWithImpl<_$StoryUserItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StoryUserItemImplToJson(
      this,
    );
  }
}

abstract class _StoryUserItem implements StoryUserItem {
  const factory _StoryUserItem(
      {required final String name,
      required final String username,
      required final String avatar}) = _$StoryUserItemImpl;

  factory _StoryUserItem.fromJson(Map<String, dynamic> json) =
      _$StoryUserItemImpl.fromJson;

  @override
  String get name;
  @override
  String get username;
  @override
  String get avatar;
  @override
  @JsonKey(ignore: true)
  _$$StoryUserItemImplCopyWith<_$StoryUserItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

StoryItem _$StoryItemFromJson(Map<String, dynamic> json) {
  return _StoryItem.fromJson(json);
}

/// @nodoc
mixin _$StoryItem {
  StoryAssetItem get asset => throw _privateConstructorUsedError;
  StoryUserItem get user => throw _privateConstructorUsedError;
  bool get isViewed => throw _privateConstructorUsedError;

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
  $Res call({StoryAssetItem asset, StoryUserItem user, bool isViewed});

  $StoryAssetItemCopyWith<$Res> get asset;
  $StoryUserItemCopyWith<$Res> get user;
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
    Object? asset = null,
    Object? user = null,
    Object? isViewed = null,
  }) {
    return _then(_value.copyWith(
      asset: null == asset
          ? _value.asset
          : asset // ignore: cast_nullable_to_non_nullable
              as StoryAssetItem,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as StoryUserItem,
      isViewed: null == isViewed
          ? _value.isViewed
          : isViewed // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $StoryAssetItemCopyWith<$Res> get asset {
    return $StoryAssetItemCopyWith<$Res>(_value.asset, (value) {
      return _then(_value.copyWith(asset: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $StoryUserItemCopyWith<$Res> get user {
    return $StoryUserItemCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
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
  $Res call({StoryAssetItem asset, StoryUserItem user, bool isViewed});

  @override
  $StoryAssetItemCopyWith<$Res> get asset;
  @override
  $StoryUserItemCopyWith<$Res> get user;
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
    Object? asset = null,
    Object? user = null,
    Object? isViewed = null,
  }) {
    return _then(_$StoryItemImpl(
      asset: null == asset
          ? _value.asset
          : asset // ignore: cast_nullable_to_non_nullable
              as StoryAssetItem,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as StoryUserItem,
      isViewed: null == isViewed
          ? _value.isViewed
          : isViewed // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StoryItemImpl implements _StoryItem {
  const _$StoryItemImpl(
      {required this.asset, required this.user, required this.isViewed});

  factory _$StoryItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$StoryItemImplFromJson(json);

  @override
  final StoryAssetItem asset;
  @override
  final StoryUserItem user;
  @override
  final bool isViewed;

  @override
  String toString() {
    return 'StoryItem(asset: $asset, user: $user, isViewed: $isViewed)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StoryItemImpl &&
            (identical(other.asset, asset) || other.asset == asset) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.isViewed, isViewed) ||
                other.isViewed == isViewed));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, asset, user, isViewed);

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
      {required final StoryAssetItem asset,
      required final StoryUserItem user,
      required final bool isViewed}) = _$StoryItemImpl;

  factory _StoryItem.fromJson(Map<String, dynamic> json) =
      _$StoryItemImpl.fromJson;

  @override
  StoryAssetItem get asset;
  @override
  StoryUserItem get user;
  @override
  bool get isViewed;
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
    Object? stories = null,
    Object? hasPending = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
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
    Object? stories = null,
    Object? hasPending = null,
  }) {
    return _then(_$GetFeedStoriesResponseDataImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
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
      required final List<StoryItem> stories,
      required this.hasPending})
      : _stories = stories;

  factory _$GetFeedStoriesResponseDataImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$GetFeedStoriesResponseDataImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String id;
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
    return 'GetFeedStoriesResponseData(id: $id, stories: $stories, hasPending: $hasPending)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetFeedStoriesResponseDataImpl &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other._stories, _stories) &&
            (identical(other.hasPending, hasPending) ||
                other.hasPending == hasPending));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id,
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
      required final List<StoryItem> stories,
      required final bool hasPending}) = _$GetFeedStoriesResponseDataImpl;

  factory _GetFeedStoriesResponseData.fromJson(Map<String, dynamic> json) =
      _$GetFeedStoriesResponseDataImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String get id;
  @override
  List<StoryItem> get stories;
  @override
  bool get hasPending;
  @override
  @JsonKey(ignore: true)
  _$$GetFeedStoriesResponseDataImplCopyWith<_$GetFeedStoriesResponseDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}
