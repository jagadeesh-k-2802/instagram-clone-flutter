// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GetPostsResponse _$GetPostsResponseFromJson(Map<String, dynamic> json) {
  return _GetPostsResponse.fromJson(json);
}

/// @nodoc
mixin _$GetPostsResponse {
  bool get success => throw _privateConstructorUsedError;
  List<GetPostsResponseData> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetPostsResponseCopyWith<GetPostsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetPostsResponseCopyWith<$Res> {
  factory $GetPostsResponseCopyWith(
          GetPostsResponse value, $Res Function(GetPostsResponse) then) =
      _$GetPostsResponseCopyWithImpl<$Res, GetPostsResponse>;
  @useResult
  $Res call({bool success, List<GetPostsResponseData> data});
}

/// @nodoc
class _$GetPostsResponseCopyWithImpl<$Res, $Val extends GetPostsResponse>
    implements $GetPostsResponseCopyWith<$Res> {
  _$GetPostsResponseCopyWithImpl(this._value, this._then);

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
              as List<GetPostsResponseData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetPostsResponseImplCopyWith<$Res>
    implements $GetPostsResponseCopyWith<$Res> {
  factory _$$GetPostsResponseImplCopyWith(_$GetPostsResponseImpl value,
          $Res Function(_$GetPostsResponseImpl) then) =
      __$$GetPostsResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, List<GetPostsResponseData> data});
}

/// @nodoc
class __$$GetPostsResponseImplCopyWithImpl<$Res>
    extends _$GetPostsResponseCopyWithImpl<$Res, _$GetPostsResponseImpl>
    implements _$$GetPostsResponseImplCopyWith<$Res> {
  __$$GetPostsResponseImplCopyWithImpl(_$GetPostsResponseImpl _value,
      $Res Function(_$GetPostsResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? data = null,
  }) {
    return _then(_$GetPostsResponseImpl(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<GetPostsResponseData>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetPostsResponseImpl implements _GetPostsResponse {
  const _$GetPostsResponseImpl(
      {required this.success, required final List<GetPostsResponseData> data})
      : _data = data;

  factory _$GetPostsResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetPostsResponseImplFromJson(json);

  @override
  final bool success;
  final List<GetPostsResponseData> _data;
  @override
  List<GetPostsResponseData> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'GetPostsResponse(success: $success, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetPostsResponseImpl &&
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
  _$$GetPostsResponseImplCopyWith<_$GetPostsResponseImpl> get copyWith =>
      __$$GetPostsResponseImplCopyWithImpl<_$GetPostsResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetPostsResponseImplToJson(
      this,
    );
  }
}

abstract class _GetPostsResponse implements GetPostsResponse {
  const factory _GetPostsResponse(
      {required final bool success,
      required final List<GetPostsResponseData> data}) = _$GetPostsResponseImpl;

  factory _GetPostsResponse.fromJson(Map<String, dynamic> json) =
      _$GetPostsResponseImpl.fromJson;

  @override
  bool get success;
  @override
  List<GetPostsResponseData> get data;
  @override
  @JsonKey(ignore: true)
  _$$GetPostsResponseImplCopyWith<_$GetPostsResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GetPostsResponseData _$GetPostsResponseDataFromJson(Map<String, dynamic> json) {
  return _GetPostsResponseData.fromJson(json);
}

/// @nodoc
mixin _$GetPostsResponseData {
  String get id => throw _privateConstructorUsedError;
  String get caption => throw _privateConstructorUsedError;
  List<PostAssetItem> get assets => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetPostsResponseDataCopyWith<GetPostsResponseData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetPostsResponseDataCopyWith<$Res> {
  factory $GetPostsResponseDataCopyWith(GetPostsResponseData value,
          $Res Function(GetPostsResponseData) then) =
      _$GetPostsResponseDataCopyWithImpl<$Res, GetPostsResponseData>;
  @useResult
  $Res call({String id, String caption, List<PostAssetItem> assets});
}

/// @nodoc
class _$GetPostsResponseDataCopyWithImpl<$Res,
        $Val extends GetPostsResponseData>
    implements $GetPostsResponseDataCopyWith<$Res> {
  _$GetPostsResponseDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? caption = null,
    Object? assets = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      caption: null == caption
          ? _value.caption
          : caption // ignore: cast_nullable_to_non_nullable
              as String,
      assets: null == assets
          ? _value.assets
          : assets // ignore: cast_nullable_to_non_nullable
              as List<PostAssetItem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetPostsResponseDataImplCopyWith<$Res>
    implements $GetPostsResponseDataCopyWith<$Res> {
  factory _$$GetPostsResponseDataImplCopyWith(_$GetPostsResponseDataImpl value,
          $Res Function(_$GetPostsResponseDataImpl) then) =
      __$$GetPostsResponseDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String caption, List<PostAssetItem> assets});
}

/// @nodoc
class __$$GetPostsResponseDataImplCopyWithImpl<$Res>
    extends _$GetPostsResponseDataCopyWithImpl<$Res, _$GetPostsResponseDataImpl>
    implements _$$GetPostsResponseDataImplCopyWith<$Res> {
  __$$GetPostsResponseDataImplCopyWithImpl(_$GetPostsResponseDataImpl _value,
      $Res Function(_$GetPostsResponseDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? caption = null,
    Object? assets = null,
  }) {
    return _then(_$GetPostsResponseDataImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      caption: null == caption
          ? _value.caption
          : caption // ignore: cast_nullable_to_non_nullable
              as String,
      assets: null == assets
          ? _value._assets
          : assets // ignore: cast_nullable_to_non_nullable
              as List<PostAssetItem>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetPostsResponseDataImpl implements _GetPostsResponseData {
  const _$GetPostsResponseDataImpl(
      {required this.id,
      required this.caption,
      required final List<PostAssetItem> assets})
      : _assets = assets;

  factory _$GetPostsResponseDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetPostsResponseDataImplFromJson(json);

  @override
  final String id;
  @override
  final String caption;
  final List<PostAssetItem> _assets;
  @override
  List<PostAssetItem> get assets {
    if (_assets is EqualUnmodifiableListView) return _assets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_assets);
  }

  @override
  String toString() {
    return 'GetPostsResponseData(id: $id, caption: $caption, assets: $assets)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetPostsResponseDataImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.caption, caption) || other.caption == caption) &&
            const DeepCollectionEquality().equals(other._assets, _assets));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, caption, const DeepCollectionEquality().hash(_assets));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetPostsResponseDataImplCopyWith<_$GetPostsResponseDataImpl>
      get copyWith =>
          __$$GetPostsResponseDataImplCopyWithImpl<_$GetPostsResponseDataImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetPostsResponseDataImplToJson(
      this,
    );
  }
}

abstract class _GetPostsResponseData implements GetPostsResponseData {
  const factory _GetPostsResponseData(
      {required final String id,
      required final String caption,
      required final List<PostAssetItem> assets}) = _$GetPostsResponseDataImpl;

  factory _GetPostsResponseData.fromJson(Map<String, dynamic> json) =
      _$GetPostsResponseDataImpl.fromJson;

  @override
  String get id;
  @override
  String get caption;
  @override
  List<PostAssetItem> get assets;
  @override
  @JsonKey(ignore: true)
  _$$GetPostsResponseDataImplCopyWith<_$GetPostsResponseDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}

PostAssetItem _$PostAssetItemFromJson(Map<String, dynamic> json) {
  return _PostAssetItem.fromJson(json);
}

/// @nodoc
mixin _$PostAssetItem {
  String get assetType => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PostAssetItemCopyWith<PostAssetItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostAssetItemCopyWith<$Res> {
  factory $PostAssetItemCopyWith(
          PostAssetItem value, $Res Function(PostAssetItem) then) =
      _$PostAssetItemCopyWithImpl<$Res, PostAssetItem>;
  @useResult
  $Res call({String assetType, String url});
}

/// @nodoc
class _$PostAssetItemCopyWithImpl<$Res, $Val extends PostAssetItem>
    implements $PostAssetItemCopyWith<$Res> {
  _$PostAssetItemCopyWithImpl(this._value, this._then);

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
abstract class _$$PostAssetItemImplCopyWith<$Res>
    implements $PostAssetItemCopyWith<$Res> {
  factory _$$PostAssetItemImplCopyWith(
          _$PostAssetItemImpl value, $Res Function(_$PostAssetItemImpl) then) =
      __$$PostAssetItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String assetType, String url});
}

/// @nodoc
class __$$PostAssetItemImplCopyWithImpl<$Res>
    extends _$PostAssetItemCopyWithImpl<$Res, _$PostAssetItemImpl>
    implements _$$PostAssetItemImplCopyWith<$Res> {
  __$$PostAssetItemImplCopyWithImpl(
      _$PostAssetItemImpl _value, $Res Function(_$PostAssetItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? assetType = null,
    Object? url = null,
  }) {
    return _then(_$PostAssetItemImpl(
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
class _$PostAssetItemImpl implements _PostAssetItem {
  const _$PostAssetItemImpl({required this.assetType, required this.url});

  factory _$PostAssetItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$PostAssetItemImplFromJson(json);

  @override
  final String assetType;
  @override
  final String url;

  @override
  String toString() {
    return 'PostAssetItem(assetType: $assetType, url: $url)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostAssetItemImpl &&
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
  _$$PostAssetItemImplCopyWith<_$PostAssetItemImpl> get copyWith =>
      __$$PostAssetItemImplCopyWithImpl<_$PostAssetItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PostAssetItemImplToJson(
      this,
    );
  }
}

abstract class _PostAssetItem implements PostAssetItem {
  const factory _PostAssetItem(
      {required final String assetType,
      required final String url}) = _$PostAssetItemImpl;

  factory _PostAssetItem.fromJson(Map<String, dynamic> json) =
      _$PostAssetItemImpl.fromJson;

  @override
  String get assetType;
  @override
  String get url;
  @override
  @JsonKey(ignore: true)
  _$$PostAssetItemImplCopyWith<_$PostAssetItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TaggedUserItem _$TaggedUserItemFromJson(Map<String, dynamic> json) {
  return _TaggedUserItem.fromJson(json);
}

/// @nodoc
mixin _$TaggedUserItem {
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
  String get avatar => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TaggedUserItemCopyWith<TaggedUserItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaggedUserItemCopyWith<$Res> {
  factory $TaggedUserItemCopyWith(
          TaggedUserItem value, $Res Function(TaggedUserItem) then) =
      _$TaggedUserItemCopyWithImpl<$Res, TaggedUserItem>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      String avatar,
      String name,
      String username});
}

/// @nodoc
class _$TaggedUserItemCopyWithImpl<$Res, $Val extends TaggedUserItem>
    implements $TaggedUserItemCopyWith<$Res> {
  _$TaggedUserItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? avatar = null,
    Object? name = null,
    Object? username = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: null == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TaggedUserItemImplCopyWith<$Res>
    implements $TaggedUserItemCopyWith<$Res> {
  factory _$$TaggedUserItemImplCopyWith(_$TaggedUserItemImpl value,
          $Res Function(_$TaggedUserItemImpl) then) =
      __$$TaggedUserItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      String avatar,
      String name,
      String username});
}

/// @nodoc
class __$$TaggedUserItemImplCopyWithImpl<$Res>
    extends _$TaggedUserItemCopyWithImpl<$Res, _$TaggedUserItemImpl>
    implements _$$TaggedUserItemImplCopyWith<$Res> {
  __$$TaggedUserItemImplCopyWithImpl(
      _$TaggedUserItemImpl _value, $Res Function(_$TaggedUserItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? avatar = null,
    Object? name = null,
    Object? username = null,
  }) {
    return _then(_$TaggedUserItemImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: null == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TaggedUserItemImpl implements _TaggedUserItem {
  const _$TaggedUserItemImpl(
      {@JsonKey(name: '_id') required this.id,
      required this.avatar,
      required this.name,
      required this.username});

  factory _$TaggedUserItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$TaggedUserItemImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  final String avatar;
  @override
  final String name;
  @override
  final String username;

  @override
  String toString() {
    return 'TaggedUserItem(id: $id, avatar: $avatar, name: $name, username: $username)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaggedUserItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.username, username) ||
                other.username == username));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, avatar, name, username);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TaggedUserItemImplCopyWith<_$TaggedUserItemImpl> get copyWith =>
      __$$TaggedUserItemImplCopyWithImpl<_$TaggedUserItemImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TaggedUserItemImplToJson(
      this,
    );
  }
}

abstract class _TaggedUserItem implements TaggedUserItem {
  const factory _TaggedUserItem(
      {@JsonKey(name: '_id') required final String id,
      required final String avatar,
      required final String name,
      required final String username}) = _$TaggedUserItemImpl;

  factory _TaggedUserItem.fromJson(Map<String, dynamic> json) =
      _$TaggedUserItemImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String get id;
  @override
  String get avatar;
  @override
  String get name;
  @override
  String get username;
  @override
  @JsonKey(ignore: true)
  _$$TaggedUserItemImplCopyWith<_$TaggedUserItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GetFeedPostsResponse _$GetFeedPostsResponseFromJson(Map<String, dynamic> json) {
  return _GetFeedPostsResponse.fromJson(json);
}

/// @nodoc
mixin _$GetFeedPostsResponse {
  bool get success => throw _privateConstructorUsedError;
  List<GetFeedPostsResponseData> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetFeedPostsResponseCopyWith<GetFeedPostsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetFeedPostsResponseCopyWith<$Res> {
  factory $GetFeedPostsResponseCopyWith(GetFeedPostsResponse value,
          $Res Function(GetFeedPostsResponse) then) =
      _$GetFeedPostsResponseCopyWithImpl<$Res, GetFeedPostsResponse>;
  @useResult
  $Res call({bool success, List<GetFeedPostsResponseData> data});
}

/// @nodoc
class _$GetFeedPostsResponseCopyWithImpl<$Res,
        $Val extends GetFeedPostsResponse>
    implements $GetFeedPostsResponseCopyWith<$Res> {
  _$GetFeedPostsResponseCopyWithImpl(this._value, this._then);

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
              as List<GetFeedPostsResponseData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetFeedPostsResponseImplCopyWith<$Res>
    implements $GetFeedPostsResponseCopyWith<$Res> {
  factory _$$GetFeedPostsResponseImplCopyWith(_$GetFeedPostsResponseImpl value,
          $Res Function(_$GetFeedPostsResponseImpl) then) =
      __$$GetFeedPostsResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, List<GetFeedPostsResponseData> data});
}

/// @nodoc
class __$$GetFeedPostsResponseImplCopyWithImpl<$Res>
    extends _$GetFeedPostsResponseCopyWithImpl<$Res, _$GetFeedPostsResponseImpl>
    implements _$$GetFeedPostsResponseImplCopyWith<$Res> {
  __$$GetFeedPostsResponseImplCopyWithImpl(_$GetFeedPostsResponseImpl _value,
      $Res Function(_$GetFeedPostsResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? data = null,
  }) {
    return _then(_$GetFeedPostsResponseImpl(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<GetFeedPostsResponseData>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetFeedPostsResponseImpl implements _GetFeedPostsResponse {
  const _$GetFeedPostsResponseImpl(
      {required this.success,
      required final List<GetFeedPostsResponseData> data})
      : _data = data;

  factory _$GetFeedPostsResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetFeedPostsResponseImplFromJson(json);

  @override
  final bool success;
  final List<GetFeedPostsResponseData> _data;
  @override
  List<GetFeedPostsResponseData> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'GetFeedPostsResponse(success: $success, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetFeedPostsResponseImpl &&
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
  _$$GetFeedPostsResponseImplCopyWith<_$GetFeedPostsResponseImpl>
      get copyWith =>
          __$$GetFeedPostsResponseImplCopyWithImpl<_$GetFeedPostsResponseImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetFeedPostsResponseImplToJson(
      this,
    );
  }
}

abstract class _GetFeedPostsResponse implements GetFeedPostsResponse {
  const factory _GetFeedPostsResponse(
          {required final bool success,
          required final List<GetFeedPostsResponseData> data}) =
      _$GetFeedPostsResponseImpl;

  factory _GetFeedPostsResponse.fromJson(Map<String, dynamic> json) =
      _$GetFeedPostsResponseImpl.fromJson;

  @override
  bool get success;
  @override
  List<GetFeedPostsResponseData> get data;
  @override
  @JsonKey(ignore: true)
  _$$GetFeedPostsResponseImplCopyWith<_$GetFeedPostsResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

GetFeedPostsResponseData _$GetFeedPostsResponseDataFromJson(
    Map<String, dynamic> json) {
  return _GetFeedPostsResponseData.fromJson(json);
}

/// @nodoc
mixin _$GetFeedPostsResponseData {
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
  String get caption => throw _privateConstructorUsedError;
  List<PostAssetItem> get assets => throw _privateConstructorUsedError;
  List<TaggedUserItem> get taggedUsers => throw _privateConstructorUsedError;
  int get likeCount => throw _privateConstructorUsedError;
  int get commentCount => throw _privateConstructorUsedError;
  PostUser get user => throw _privateConstructorUsedError;
  bool get isLiked => throw _privateConstructorUsedError;
  bool get isSaved => throw _privateConstructorUsedError;
  @DateTimeConvertor()
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetFeedPostsResponseDataCopyWith<GetFeedPostsResponseData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetFeedPostsResponseDataCopyWith<$Res> {
  factory $GetFeedPostsResponseDataCopyWith(GetFeedPostsResponseData value,
          $Res Function(GetFeedPostsResponseData) then) =
      _$GetFeedPostsResponseDataCopyWithImpl<$Res, GetFeedPostsResponseData>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      String caption,
      List<PostAssetItem> assets,
      List<TaggedUserItem> taggedUsers,
      int likeCount,
      int commentCount,
      PostUser user,
      bool isLiked,
      bool isSaved,
      @DateTimeConvertor() DateTime createdAt,
      DateTime updatedAt});

  $PostUserCopyWith<$Res> get user;
}

/// @nodoc
class _$GetFeedPostsResponseDataCopyWithImpl<$Res,
        $Val extends GetFeedPostsResponseData>
    implements $GetFeedPostsResponseDataCopyWith<$Res> {
  _$GetFeedPostsResponseDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? caption = null,
    Object? assets = null,
    Object? taggedUsers = null,
    Object? likeCount = null,
    Object? commentCount = null,
    Object? user = null,
    Object? isLiked = null,
    Object? isSaved = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      caption: null == caption
          ? _value.caption
          : caption // ignore: cast_nullable_to_non_nullable
              as String,
      assets: null == assets
          ? _value.assets
          : assets // ignore: cast_nullable_to_non_nullable
              as List<PostAssetItem>,
      taggedUsers: null == taggedUsers
          ? _value.taggedUsers
          : taggedUsers // ignore: cast_nullable_to_non_nullable
              as List<TaggedUserItem>,
      likeCount: null == likeCount
          ? _value.likeCount
          : likeCount // ignore: cast_nullable_to_non_nullable
              as int,
      commentCount: null == commentCount
          ? _value.commentCount
          : commentCount // ignore: cast_nullable_to_non_nullable
              as int,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as PostUser,
      isLiked: null == isLiked
          ? _value.isLiked
          : isLiked // ignore: cast_nullable_to_non_nullable
              as bool,
      isSaved: null == isSaved
          ? _value.isSaved
          : isSaved // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PostUserCopyWith<$Res> get user {
    return $PostUserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GetFeedPostsResponseDataImplCopyWith<$Res>
    implements $GetFeedPostsResponseDataCopyWith<$Res> {
  factory _$$GetFeedPostsResponseDataImplCopyWith(
          _$GetFeedPostsResponseDataImpl value,
          $Res Function(_$GetFeedPostsResponseDataImpl) then) =
      __$$GetFeedPostsResponseDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      String caption,
      List<PostAssetItem> assets,
      List<TaggedUserItem> taggedUsers,
      int likeCount,
      int commentCount,
      PostUser user,
      bool isLiked,
      bool isSaved,
      @DateTimeConvertor() DateTime createdAt,
      DateTime updatedAt});

  @override
  $PostUserCopyWith<$Res> get user;
}

/// @nodoc
class __$$GetFeedPostsResponseDataImplCopyWithImpl<$Res>
    extends _$GetFeedPostsResponseDataCopyWithImpl<$Res,
        _$GetFeedPostsResponseDataImpl>
    implements _$$GetFeedPostsResponseDataImplCopyWith<$Res> {
  __$$GetFeedPostsResponseDataImplCopyWithImpl(
      _$GetFeedPostsResponseDataImpl _value,
      $Res Function(_$GetFeedPostsResponseDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? caption = null,
    Object? assets = null,
    Object? taggedUsers = null,
    Object? likeCount = null,
    Object? commentCount = null,
    Object? user = null,
    Object? isLiked = null,
    Object? isSaved = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$GetFeedPostsResponseDataImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      caption: null == caption
          ? _value.caption
          : caption // ignore: cast_nullable_to_non_nullable
              as String,
      assets: null == assets
          ? _value._assets
          : assets // ignore: cast_nullable_to_non_nullable
              as List<PostAssetItem>,
      taggedUsers: null == taggedUsers
          ? _value._taggedUsers
          : taggedUsers // ignore: cast_nullable_to_non_nullable
              as List<TaggedUserItem>,
      likeCount: null == likeCount
          ? _value.likeCount
          : likeCount // ignore: cast_nullable_to_non_nullable
              as int,
      commentCount: null == commentCount
          ? _value.commentCount
          : commentCount // ignore: cast_nullable_to_non_nullable
              as int,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as PostUser,
      isLiked: null == isLiked
          ? _value.isLiked
          : isLiked // ignore: cast_nullable_to_non_nullable
              as bool,
      isSaved: null == isSaved
          ? _value.isSaved
          : isSaved // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetFeedPostsResponseDataImpl implements _GetFeedPostsResponseData {
  const _$GetFeedPostsResponseDataImpl(
      {@JsonKey(name: '_id') required this.id,
      required this.caption,
      required final List<PostAssetItem> assets,
      required final List<TaggedUserItem> taggedUsers,
      required this.likeCount,
      required this.commentCount,
      required this.user,
      required this.isLiked,
      required this.isSaved,
      @DateTimeConvertor() required this.createdAt,
      required this.updatedAt})
      : _assets = assets,
        _taggedUsers = taggedUsers;

  factory _$GetFeedPostsResponseDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetFeedPostsResponseDataImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  final String caption;
  final List<PostAssetItem> _assets;
  @override
  List<PostAssetItem> get assets {
    if (_assets is EqualUnmodifiableListView) return _assets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_assets);
  }

  final List<TaggedUserItem> _taggedUsers;
  @override
  List<TaggedUserItem> get taggedUsers {
    if (_taggedUsers is EqualUnmodifiableListView) return _taggedUsers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_taggedUsers);
  }

  @override
  final int likeCount;
  @override
  final int commentCount;
  @override
  final PostUser user;
  @override
  final bool isLiked;
  @override
  final bool isSaved;
  @override
  @DateTimeConvertor()
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'GetFeedPostsResponseData(id: $id, caption: $caption, assets: $assets, taggedUsers: $taggedUsers, likeCount: $likeCount, commentCount: $commentCount, user: $user, isLiked: $isLiked, isSaved: $isSaved, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetFeedPostsResponseDataImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.caption, caption) || other.caption == caption) &&
            const DeepCollectionEquality().equals(other._assets, _assets) &&
            const DeepCollectionEquality()
                .equals(other._taggedUsers, _taggedUsers) &&
            (identical(other.likeCount, likeCount) ||
                other.likeCount == likeCount) &&
            (identical(other.commentCount, commentCount) ||
                other.commentCount == commentCount) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.isLiked, isLiked) || other.isLiked == isLiked) &&
            (identical(other.isSaved, isSaved) || other.isSaved == isSaved) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      caption,
      const DeepCollectionEquality().hash(_assets),
      const DeepCollectionEquality().hash(_taggedUsers),
      likeCount,
      commentCount,
      user,
      isLiked,
      isSaved,
      createdAt,
      updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetFeedPostsResponseDataImplCopyWith<_$GetFeedPostsResponseDataImpl>
      get copyWith => __$$GetFeedPostsResponseDataImplCopyWithImpl<
          _$GetFeedPostsResponseDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetFeedPostsResponseDataImplToJson(
      this,
    );
  }
}

abstract class _GetFeedPostsResponseData implements GetFeedPostsResponseData {
  const factory _GetFeedPostsResponseData(
      {@JsonKey(name: '_id') required final String id,
      required final String caption,
      required final List<PostAssetItem> assets,
      required final List<TaggedUserItem> taggedUsers,
      required final int likeCount,
      required final int commentCount,
      required final PostUser user,
      required final bool isLiked,
      required final bool isSaved,
      @DateTimeConvertor() required final DateTime createdAt,
      required final DateTime updatedAt}) = _$GetFeedPostsResponseDataImpl;

  factory _GetFeedPostsResponseData.fromJson(Map<String, dynamic> json) =
      _$GetFeedPostsResponseDataImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String get id;
  @override
  String get caption;
  @override
  List<PostAssetItem> get assets;
  @override
  List<TaggedUserItem> get taggedUsers;
  @override
  int get likeCount;
  @override
  int get commentCount;
  @override
  PostUser get user;
  @override
  bool get isLiked;
  @override
  bool get isSaved;
  @override
  @DateTimeConvertor()
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$GetFeedPostsResponseDataImplCopyWith<_$GetFeedPostsResponseDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}

PostUser _$PostUserFromJson(Map<String, dynamic> json) {
  return _PostUser.fromJson(json);
}

/// @nodoc
mixin _$PostUser {
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get avatar => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PostUserCopyWith<PostUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostUserCopyWith<$Res> {
  factory $PostUserCopyWith(PostUser value, $Res Function(PostUser) then) =
      _$PostUserCopyWithImpl<$Res, PostUser>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      String name,
      String avatar,
      String username});
}

/// @nodoc
class _$PostUserCopyWithImpl<$Res, $Val extends PostUser>
    implements $PostUserCopyWith<$Res> {
  _$PostUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? avatar = null,
    Object? username = null,
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
      avatar: null == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PostUserImplCopyWith<$Res>
    implements $PostUserCopyWith<$Res> {
  factory _$$PostUserImplCopyWith(
          _$PostUserImpl value, $Res Function(_$PostUserImpl) then) =
      __$$PostUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      String name,
      String avatar,
      String username});
}

/// @nodoc
class __$$PostUserImplCopyWithImpl<$Res>
    extends _$PostUserCopyWithImpl<$Res, _$PostUserImpl>
    implements _$$PostUserImplCopyWith<$Res> {
  __$$PostUserImplCopyWithImpl(
      _$PostUserImpl _value, $Res Function(_$PostUserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? avatar = null,
    Object? username = null,
  }) {
    return _then(_$PostUserImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: null == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PostUserImpl implements _PostUser {
  const _$PostUserImpl(
      {@JsonKey(name: '_id') required this.id,
      required this.name,
      required this.avatar,
      required this.username});

  factory _$PostUserImpl.fromJson(Map<String, dynamic> json) =>
      _$$PostUserImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  final String name;
  @override
  final String avatar;
  @override
  final String username;

  @override
  String toString() {
    return 'PostUser(id: $id, name: $name, avatar: $avatar, username: $username)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostUserImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            (identical(other.username, username) ||
                other.username == username));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, avatar, username);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PostUserImplCopyWith<_$PostUserImpl> get copyWith =>
      __$$PostUserImplCopyWithImpl<_$PostUserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PostUserImplToJson(
      this,
    );
  }
}

abstract class _PostUser implements PostUser {
  const factory _PostUser(
      {@JsonKey(name: '_id') required final String id,
      required final String name,
      required final String avatar,
      required final String username}) = _$PostUserImpl;

  factory _PostUser.fromJson(Map<String, dynamic> json) =
      _$PostUserImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String get id;
  @override
  String get name;
  @override
  String get avatar;
  @override
  String get username;
  @override
  @JsonKey(ignore: true)
  _$$PostUserImplCopyWith<_$PostUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GetUsersPostResponse _$GetUsersPostResponseFromJson(Map<String, dynamic> json) {
  return _GetUsersPostResponse.fromJson(json);
}

/// @nodoc
mixin _$GetUsersPostResponse {
  bool get success => throw _privateConstructorUsedError;
  List<GetUsersPostResponseData> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetUsersPostResponseCopyWith<GetUsersPostResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetUsersPostResponseCopyWith<$Res> {
  factory $GetUsersPostResponseCopyWith(GetUsersPostResponse value,
          $Res Function(GetUsersPostResponse) then) =
      _$GetUsersPostResponseCopyWithImpl<$Res, GetUsersPostResponse>;
  @useResult
  $Res call({bool success, List<GetUsersPostResponseData> data});
}

/// @nodoc
class _$GetUsersPostResponseCopyWithImpl<$Res,
        $Val extends GetUsersPostResponse>
    implements $GetUsersPostResponseCopyWith<$Res> {
  _$GetUsersPostResponseCopyWithImpl(this._value, this._then);

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
              as List<GetUsersPostResponseData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetUsersPostResponseImplCopyWith<$Res>
    implements $GetUsersPostResponseCopyWith<$Res> {
  factory _$$GetUsersPostResponseImplCopyWith(_$GetUsersPostResponseImpl value,
          $Res Function(_$GetUsersPostResponseImpl) then) =
      __$$GetUsersPostResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, List<GetUsersPostResponseData> data});
}

/// @nodoc
class __$$GetUsersPostResponseImplCopyWithImpl<$Res>
    extends _$GetUsersPostResponseCopyWithImpl<$Res, _$GetUsersPostResponseImpl>
    implements _$$GetUsersPostResponseImplCopyWith<$Res> {
  __$$GetUsersPostResponseImplCopyWithImpl(_$GetUsersPostResponseImpl _value,
      $Res Function(_$GetUsersPostResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? data = null,
  }) {
    return _then(_$GetUsersPostResponseImpl(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<GetUsersPostResponseData>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetUsersPostResponseImpl implements _GetUsersPostResponse {
  const _$GetUsersPostResponseImpl(
      {required this.success,
      required final List<GetUsersPostResponseData> data})
      : _data = data;

  factory _$GetUsersPostResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetUsersPostResponseImplFromJson(json);

  @override
  final bool success;
  final List<GetUsersPostResponseData> _data;
  @override
  List<GetUsersPostResponseData> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'GetUsersPostResponse(success: $success, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetUsersPostResponseImpl &&
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
  _$$GetUsersPostResponseImplCopyWith<_$GetUsersPostResponseImpl>
      get copyWith =>
          __$$GetUsersPostResponseImplCopyWithImpl<_$GetUsersPostResponseImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetUsersPostResponseImplToJson(
      this,
    );
  }
}

abstract class _GetUsersPostResponse implements GetUsersPostResponse {
  const factory _GetUsersPostResponse(
          {required final bool success,
          required final List<GetUsersPostResponseData> data}) =
      _$GetUsersPostResponseImpl;

  factory _GetUsersPostResponse.fromJson(Map<String, dynamic> json) =
      _$GetUsersPostResponseImpl.fromJson;

  @override
  bool get success;
  @override
  List<GetUsersPostResponseData> get data;
  @override
  @JsonKey(ignore: true)
  _$$GetUsersPostResponseImplCopyWith<_$GetUsersPostResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

GetUsersPostResponseData _$GetUsersPostResponseDataFromJson(
    Map<String, dynamic> json) {
  return _GetUsersPostResponseData.fromJson(json);
}

/// @nodoc
mixin _$GetUsersPostResponseData {
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
  UserPostItem get post => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetUsersPostResponseDataCopyWith<GetUsersPostResponseData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetUsersPostResponseDataCopyWith<$Res> {
  factory $GetUsersPostResponseDataCopyWith(GetUsersPostResponseData value,
          $Res Function(GetUsersPostResponseData) then) =
      _$GetUsersPostResponseDataCopyWithImpl<$Res, GetUsersPostResponseData>;
  @useResult
  $Res call({@JsonKey(name: '_id') String id, UserPostItem post});

  $UserPostItemCopyWith<$Res> get post;
}

/// @nodoc
class _$GetUsersPostResponseDataCopyWithImpl<$Res,
        $Val extends GetUsersPostResponseData>
    implements $GetUsersPostResponseDataCopyWith<$Res> {
  _$GetUsersPostResponseDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? post = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      post: null == post
          ? _value.post
          : post // ignore: cast_nullable_to_non_nullable
              as UserPostItem,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserPostItemCopyWith<$Res> get post {
    return $UserPostItemCopyWith<$Res>(_value.post, (value) {
      return _then(_value.copyWith(post: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GetUsersPostResponseDataImplCopyWith<$Res>
    implements $GetUsersPostResponseDataCopyWith<$Res> {
  factory _$$GetUsersPostResponseDataImplCopyWith(
          _$GetUsersPostResponseDataImpl value,
          $Res Function(_$GetUsersPostResponseDataImpl) then) =
      __$$GetUsersPostResponseDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: '_id') String id, UserPostItem post});

  @override
  $UserPostItemCopyWith<$Res> get post;
}

/// @nodoc
class __$$GetUsersPostResponseDataImplCopyWithImpl<$Res>
    extends _$GetUsersPostResponseDataCopyWithImpl<$Res,
        _$GetUsersPostResponseDataImpl>
    implements _$$GetUsersPostResponseDataImplCopyWith<$Res> {
  __$$GetUsersPostResponseDataImplCopyWithImpl(
      _$GetUsersPostResponseDataImpl _value,
      $Res Function(_$GetUsersPostResponseDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? post = null,
  }) {
    return _then(_$GetUsersPostResponseDataImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      post: null == post
          ? _value.post
          : post // ignore: cast_nullable_to_non_nullable
              as UserPostItem,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetUsersPostResponseDataImpl implements _GetUsersPostResponseData {
  const _$GetUsersPostResponseDataImpl(
      {@JsonKey(name: '_id') required this.id, required this.post});

  factory _$GetUsersPostResponseDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetUsersPostResponseDataImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  final UserPostItem post;

  @override
  String toString() {
    return 'GetUsersPostResponseData(id: $id, post: $post)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetUsersPostResponseDataImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.post, post) || other.post == post));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, post);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetUsersPostResponseDataImplCopyWith<_$GetUsersPostResponseDataImpl>
      get copyWith => __$$GetUsersPostResponseDataImplCopyWithImpl<
          _$GetUsersPostResponseDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetUsersPostResponseDataImplToJson(
      this,
    );
  }
}

abstract class _GetUsersPostResponseData implements GetUsersPostResponseData {
  const factory _GetUsersPostResponseData(
      {@JsonKey(name: '_id') required final String id,
      required final UserPostItem post}) = _$GetUsersPostResponseDataImpl;

  factory _GetUsersPostResponseData.fromJson(Map<String, dynamic> json) =
      _$GetUsersPostResponseDataImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String get id;
  @override
  UserPostItem get post;
  @override
  @JsonKey(ignore: true)
  _$$GetUsersPostResponseDataImplCopyWith<_$GetUsersPostResponseDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}

UserPostItem _$UserPostItemFromJson(Map<String, dynamic> json) {
  return _UserPostItem.fromJson(json);
}

/// @nodoc
mixin _$UserPostItem {
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
  List<PostAssetItem> get assets => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserPostItemCopyWith<UserPostItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserPostItemCopyWith<$Res> {
  factory $UserPostItemCopyWith(
          UserPostItem value, $Res Function(UserPostItem) then) =
      _$UserPostItemCopyWithImpl<$Res, UserPostItem>;
  @useResult
  $Res call({@JsonKey(name: '_id') String id, List<PostAssetItem> assets});
}

/// @nodoc
class _$UserPostItemCopyWithImpl<$Res, $Val extends UserPostItem>
    implements $UserPostItemCopyWith<$Res> {
  _$UserPostItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? assets = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      assets: null == assets
          ? _value.assets
          : assets // ignore: cast_nullable_to_non_nullable
              as List<PostAssetItem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserPostItemImplCopyWith<$Res>
    implements $UserPostItemCopyWith<$Res> {
  factory _$$UserPostItemImplCopyWith(
          _$UserPostItemImpl value, $Res Function(_$UserPostItemImpl) then) =
      __$$UserPostItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: '_id') String id, List<PostAssetItem> assets});
}

/// @nodoc
class __$$UserPostItemImplCopyWithImpl<$Res>
    extends _$UserPostItemCopyWithImpl<$Res, _$UserPostItemImpl>
    implements _$$UserPostItemImplCopyWith<$Res> {
  __$$UserPostItemImplCopyWithImpl(
      _$UserPostItemImpl _value, $Res Function(_$UserPostItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? assets = null,
  }) {
    return _then(_$UserPostItemImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      assets: null == assets
          ? _value._assets
          : assets // ignore: cast_nullable_to_non_nullable
              as List<PostAssetItem>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserPostItemImpl implements _UserPostItem {
  const _$UserPostItemImpl(
      {@JsonKey(name: '_id') required this.id,
      required final List<PostAssetItem> assets})
      : _assets = assets;

  factory _$UserPostItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserPostItemImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String id;
  final List<PostAssetItem> _assets;
  @override
  List<PostAssetItem> get assets {
    if (_assets is EqualUnmodifiableListView) return _assets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_assets);
  }

  @override
  String toString() {
    return 'UserPostItem(id: $id, assets: $assets)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserPostItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other._assets, _assets));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, const DeepCollectionEquality().hash(_assets));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserPostItemImplCopyWith<_$UserPostItemImpl> get copyWith =>
      __$$UserPostItemImplCopyWithImpl<_$UserPostItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserPostItemImplToJson(
      this,
    );
  }
}

abstract class _UserPostItem implements UserPostItem {
  const factory _UserPostItem(
      {@JsonKey(name: '_id') required final String id,
      required final List<PostAssetItem> assets}) = _$UserPostItemImpl;

  factory _UserPostItem.fromJson(Map<String, dynamic> json) =
      _$UserPostItemImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String get id;
  @override
  List<PostAssetItem> get assets;
  @override
  @JsonKey(ignore: true)
  _$$UserPostItemImplCopyWith<_$UserPostItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GetPostResponse _$GetPostResponseFromJson(Map<String, dynamic> json) {
  return _GetPostResponse.fromJson(json);
}

/// @nodoc
mixin _$GetPostResponse {
  bool get success => throw _privateConstructorUsedError;
  GetFeedPostsResponseData get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetPostResponseCopyWith<GetPostResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetPostResponseCopyWith<$Res> {
  factory $GetPostResponseCopyWith(
          GetPostResponse value, $Res Function(GetPostResponse) then) =
      _$GetPostResponseCopyWithImpl<$Res, GetPostResponse>;
  @useResult
  $Res call({bool success, GetFeedPostsResponseData data});

  $GetFeedPostsResponseDataCopyWith<$Res> get data;
}

/// @nodoc
class _$GetPostResponseCopyWithImpl<$Res, $Val extends GetPostResponse>
    implements $GetPostResponseCopyWith<$Res> {
  _$GetPostResponseCopyWithImpl(this._value, this._then);

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
              as GetFeedPostsResponseData,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $GetFeedPostsResponseDataCopyWith<$Res> get data {
    return $GetFeedPostsResponseDataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GetPostResponseImplCopyWith<$Res>
    implements $GetPostResponseCopyWith<$Res> {
  factory _$$GetPostResponseImplCopyWith(_$GetPostResponseImpl value,
          $Res Function(_$GetPostResponseImpl) then) =
      __$$GetPostResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, GetFeedPostsResponseData data});

  @override
  $GetFeedPostsResponseDataCopyWith<$Res> get data;
}

/// @nodoc
class __$$GetPostResponseImplCopyWithImpl<$Res>
    extends _$GetPostResponseCopyWithImpl<$Res, _$GetPostResponseImpl>
    implements _$$GetPostResponseImplCopyWith<$Res> {
  __$$GetPostResponseImplCopyWithImpl(
      _$GetPostResponseImpl _value, $Res Function(_$GetPostResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? data = null,
  }) {
    return _then(_$GetPostResponseImpl(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as GetFeedPostsResponseData,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetPostResponseImpl implements _GetPostResponse {
  const _$GetPostResponseImpl({required this.success, required this.data});

  factory _$GetPostResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetPostResponseImplFromJson(json);

  @override
  final bool success;
  @override
  final GetFeedPostsResponseData data;

  @override
  String toString() {
    return 'GetPostResponse(success: $success, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetPostResponseImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, success, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetPostResponseImplCopyWith<_$GetPostResponseImpl> get copyWith =>
      __$$GetPostResponseImplCopyWithImpl<_$GetPostResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetPostResponseImplToJson(
      this,
    );
  }
}

abstract class _GetPostResponse implements GetPostResponse {
  const factory _GetPostResponse(
      {required final bool success,
      required final GetFeedPostsResponseData data}) = _$GetPostResponseImpl;

  factory _GetPostResponse.fromJson(Map<String, dynamic> json) =
      _$GetPostResponseImpl.fromJson;

  @override
  bool get success;
  @override
  GetFeedPostsResponseData get data;
  @override
  @JsonKey(ignore: true)
  _$$GetPostResponseImplCopyWith<_$GetPostResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GetExplorePostsResponse _$GetExplorePostsResponseFromJson(
    Map<String, dynamic> json) {
  return _GetExplorePostsResponse.fromJson(json);
}

/// @nodoc
mixin _$GetExplorePostsResponse {
  bool get success => throw _privateConstructorUsedError;
  List<GetExplorePostsResponseData> get data =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetExplorePostsResponseCopyWith<GetExplorePostsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetExplorePostsResponseCopyWith<$Res> {
  factory $GetExplorePostsResponseCopyWith(GetExplorePostsResponse value,
          $Res Function(GetExplorePostsResponse) then) =
      _$GetExplorePostsResponseCopyWithImpl<$Res, GetExplorePostsResponse>;
  @useResult
  $Res call({bool success, List<GetExplorePostsResponseData> data});
}

/// @nodoc
class _$GetExplorePostsResponseCopyWithImpl<$Res,
        $Val extends GetExplorePostsResponse>
    implements $GetExplorePostsResponseCopyWith<$Res> {
  _$GetExplorePostsResponseCopyWithImpl(this._value, this._then);

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
              as List<GetExplorePostsResponseData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetExplorePostsResponseImplCopyWith<$Res>
    implements $GetExplorePostsResponseCopyWith<$Res> {
  factory _$$GetExplorePostsResponseImplCopyWith(
          _$GetExplorePostsResponseImpl value,
          $Res Function(_$GetExplorePostsResponseImpl) then) =
      __$$GetExplorePostsResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, List<GetExplorePostsResponseData> data});
}

/// @nodoc
class __$$GetExplorePostsResponseImplCopyWithImpl<$Res>
    extends _$GetExplorePostsResponseCopyWithImpl<$Res,
        _$GetExplorePostsResponseImpl>
    implements _$$GetExplorePostsResponseImplCopyWith<$Res> {
  __$$GetExplorePostsResponseImplCopyWithImpl(
      _$GetExplorePostsResponseImpl _value,
      $Res Function(_$GetExplorePostsResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? data = null,
  }) {
    return _then(_$GetExplorePostsResponseImpl(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<GetExplorePostsResponseData>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetExplorePostsResponseImpl implements _GetExplorePostsResponse {
  const _$GetExplorePostsResponseImpl(
      {required this.success,
      required final List<GetExplorePostsResponseData> data})
      : _data = data;

  factory _$GetExplorePostsResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetExplorePostsResponseImplFromJson(json);

  @override
  final bool success;
  final List<GetExplorePostsResponseData> _data;
  @override
  List<GetExplorePostsResponseData> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'GetExplorePostsResponse(success: $success, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetExplorePostsResponseImpl &&
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
  _$$GetExplorePostsResponseImplCopyWith<_$GetExplorePostsResponseImpl>
      get copyWith => __$$GetExplorePostsResponseImplCopyWithImpl<
          _$GetExplorePostsResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetExplorePostsResponseImplToJson(
      this,
    );
  }
}

abstract class _GetExplorePostsResponse implements GetExplorePostsResponse {
  const factory _GetExplorePostsResponse(
          {required final bool success,
          required final List<GetExplorePostsResponseData> data}) =
      _$GetExplorePostsResponseImpl;

  factory _GetExplorePostsResponse.fromJson(Map<String, dynamic> json) =
      _$GetExplorePostsResponseImpl.fromJson;

  @override
  bool get success;
  @override
  List<GetExplorePostsResponseData> get data;
  @override
  @JsonKey(ignore: true)
  _$$GetExplorePostsResponseImplCopyWith<_$GetExplorePostsResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

GetExplorePostsResponseData _$GetExplorePostsResponseDataFromJson(
    Map<String, dynamic> json) {
  return _GetExplorePostsResponseData.fromJson(json);
}

/// @nodoc
mixin _$GetExplorePostsResponseData {
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
  List<PostAssetItem> get assets => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetExplorePostsResponseDataCopyWith<GetExplorePostsResponseData>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetExplorePostsResponseDataCopyWith<$Res> {
  factory $GetExplorePostsResponseDataCopyWith(
          GetExplorePostsResponseData value,
          $Res Function(GetExplorePostsResponseData) then) =
      _$GetExplorePostsResponseDataCopyWithImpl<$Res,
          GetExplorePostsResponseData>;
  @useResult
  $Res call({@JsonKey(name: '_id') String id, List<PostAssetItem> assets});
}

/// @nodoc
class _$GetExplorePostsResponseDataCopyWithImpl<$Res,
        $Val extends GetExplorePostsResponseData>
    implements $GetExplorePostsResponseDataCopyWith<$Res> {
  _$GetExplorePostsResponseDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? assets = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      assets: null == assets
          ? _value.assets
          : assets // ignore: cast_nullable_to_non_nullable
              as List<PostAssetItem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetExplorePostsResponseDataImplCopyWith<$Res>
    implements $GetExplorePostsResponseDataCopyWith<$Res> {
  factory _$$GetExplorePostsResponseDataImplCopyWith(
          _$GetExplorePostsResponseDataImpl value,
          $Res Function(_$GetExplorePostsResponseDataImpl) then) =
      __$$GetExplorePostsResponseDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: '_id') String id, List<PostAssetItem> assets});
}

/// @nodoc
class __$$GetExplorePostsResponseDataImplCopyWithImpl<$Res>
    extends _$GetExplorePostsResponseDataCopyWithImpl<$Res,
        _$GetExplorePostsResponseDataImpl>
    implements _$$GetExplorePostsResponseDataImplCopyWith<$Res> {
  __$$GetExplorePostsResponseDataImplCopyWithImpl(
      _$GetExplorePostsResponseDataImpl _value,
      $Res Function(_$GetExplorePostsResponseDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? assets = null,
  }) {
    return _then(_$GetExplorePostsResponseDataImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      assets: null == assets
          ? _value._assets
          : assets // ignore: cast_nullable_to_non_nullable
              as List<PostAssetItem>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetExplorePostsResponseDataImpl
    implements _GetExplorePostsResponseData {
  const _$GetExplorePostsResponseDataImpl(
      {@JsonKey(name: '_id') required this.id,
      required final List<PostAssetItem> assets})
      : _assets = assets;

  factory _$GetExplorePostsResponseDataImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$GetExplorePostsResponseDataImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String id;
  final List<PostAssetItem> _assets;
  @override
  List<PostAssetItem> get assets {
    if (_assets is EqualUnmodifiableListView) return _assets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_assets);
  }

  @override
  String toString() {
    return 'GetExplorePostsResponseData(id: $id, assets: $assets)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetExplorePostsResponseDataImpl &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other._assets, _assets));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, const DeepCollectionEquality().hash(_assets));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetExplorePostsResponseDataImplCopyWith<_$GetExplorePostsResponseDataImpl>
      get copyWith => __$$GetExplorePostsResponseDataImplCopyWithImpl<
          _$GetExplorePostsResponseDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetExplorePostsResponseDataImplToJson(
      this,
    );
  }
}

abstract class _GetExplorePostsResponseData
    implements GetExplorePostsResponseData {
  const factory _GetExplorePostsResponseData(
          {@JsonKey(name: '_id') required final String id,
          required final List<PostAssetItem> assets}) =
      _$GetExplorePostsResponseDataImpl;

  factory _GetExplorePostsResponseData.fromJson(Map<String, dynamic> json) =
      _$GetExplorePostsResponseDataImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String get id;
  @override
  List<PostAssetItem> get assets;
  @override
  @JsonKey(ignore: true)
  _$$GetExplorePostsResponseDataImplCopyWith<_$GetExplorePostsResponseDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}

GetLikesUsersResponse _$GetLikesUsersResponseFromJson(
    Map<String, dynamic> json) {
  return _GetLikesUsersResponse.fromJson(json);
}

/// @nodoc
mixin _$GetLikesUsersResponse {
  bool get success => throw _privateConstructorUsedError;
  List<GetLikesUsersResponseData> get data =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetLikesUsersResponseCopyWith<GetLikesUsersResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetLikesUsersResponseCopyWith<$Res> {
  factory $GetLikesUsersResponseCopyWith(GetLikesUsersResponse value,
          $Res Function(GetLikesUsersResponse) then) =
      _$GetLikesUsersResponseCopyWithImpl<$Res, GetLikesUsersResponse>;
  @useResult
  $Res call({bool success, List<GetLikesUsersResponseData> data});
}

/// @nodoc
class _$GetLikesUsersResponseCopyWithImpl<$Res,
        $Val extends GetLikesUsersResponse>
    implements $GetLikesUsersResponseCopyWith<$Res> {
  _$GetLikesUsersResponseCopyWithImpl(this._value, this._then);

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
              as List<GetLikesUsersResponseData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetLikesUsersResponseImplCopyWith<$Res>
    implements $GetLikesUsersResponseCopyWith<$Res> {
  factory _$$GetLikesUsersResponseImplCopyWith(
          _$GetLikesUsersResponseImpl value,
          $Res Function(_$GetLikesUsersResponseImpl) then) =
      __$$GetLikesUsersResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, List<GetLikesUsersResponseData> data});
}

/// @nodoc
class __$$GetLikesUsersResponseImplCopyWithImpl<$Res>
    extends _$GetLikesUsersResponseCopyWithImpl<$Res,
        _$GetLikesUsersResponseImpl>
    implements _$$GetLikesUsersResponseImplCopyWith<$Res> {
  __$$GetLikesUsersResponseImplCopyWithImpl(_$GetLikesUsersResponseImpl _value,
      $Res Function(_$GetLikesUsersResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? data = null,
  }) {
    return _then(_$GetLikesUsersResponseImpl(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<GetLikesUsersResponseData>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetLikesUsersResponseImpl implements _GetLikesUsersResponse {
  const _$GetLikesUsersResponseImpl(
      {required this.success,
      required final List<GetLikesUsersResponseData> data})
      : _data = data;

  factory _$GetLikesUsersResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetLikesUsersResponseImplFromJson(json);

  @override
  final bool success;
  final List<GetLikesUsersResponseData> _data;
  @override
  List<GetLikesUsersResponseData> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'GetLikesUsersResponse(success: $success, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetLikesUsersResponseImpl &&
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
  _$$GetLikesUsersResponseImplCopyWith<_$GetLikesUsersResponseImpl>
      get copyWith => __$$GetLikesUsersResponseImplCopyWithImpl<
          _$GetLikesUsersResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetLikesUsersResponseImplToJson(
      this,
    );
  }
}

abstract class _GetLikesUsersResponse implements GetLikesUsersResponse {
  const factory _GetLikesUsersResponse(
          {required final bool success,
          required final List<GetLikesUsersResponseData> data}) =
      _$GetLikesUsersResponseImpl;

  factory _GetLikesUsersResponse.fromJson(Map<String, dynamic> json) =
      _$GetLikesUsersResponseImpl.fromJson;

  @override
  bool get success;
  @override
  List<GetLikesUsersResponseData> get data;
  @override
  @JsonKey(ignore: true)
  _$$GetLikesUsersResponseImplCopyWith<_$GetLikesUsersResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

GetLikesUsersResponseData _$GetLikesUsersResponseDataFromJson(
    Map<String, dynamic> json) {
  return _GetLikesUsersResponseData.fromJson(json);
}

/// @nodoc
mixin _$GetLikesUsersResponseData {
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
  String get avatar => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetLikesUsersResponseDataCopyWith<GetLikesUsersResponseData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetLikesUsersResponseDataCopyWith<$Res> {
  factory $GetLikesUsersResponseDataCopyWith(GetLikesUsersResponseData value,
          $Res Function(GetLikesUsersResponseData) then) =
      _$GetLikesUsersResponseDataCopyWithImpl<$Res, GetLikesUsersResponseData>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      String avatar,
      String name,
      String username});
}

/// @nodoc
class _$GetLikesUsersResponseDataCopyWithImpl<$Res,
        $Val extends GetLikesUsersResponseData>
    implements $GetLikesUsersResponseDataCopyWith<$Res> {
  _$GetLikesUsersResponseDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? avatar = null,
    Object? name = null,
    Object? username = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: null == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetLikesUsersResponseDataImplCopyWith<$Res>
    implements $GetLikesUsersResponseDataCopyWith<$Res> {
  factory _$$GetLikesUsersResponseDataImplCopyWith(
          _$GetLikesUsersResponseDataImpl value,
          $Res Function(_$GetLikesUsersResponseDataImpl) then) =
      __$$GetLikesUsersResponseDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      String avatar,
      String name,
      String username});
}

/// @nodoc
class __$$GetLikesUsersResponseDataImplCopyWithImpl<$Res>
    extends _$GetLikesUsersResponseDataCopyWithImpl<$Res,
        _$GetLikesUsersResponseDataImpl>
    implements _$$GetLikesUsersResponseDataImplCopyWith<$Res> {
  __$$GetLikesUsersResponseDataImplCopyWithImpl(
      _$GetLikesUsersResponseDataImpl _value,
      $Res Function(_$GetLikesUsersResponseDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? avatar = null,
    Object? name = null,
    Object? username = null,
  }) {
    return _then(_$GetLikesUsersResponseDataImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: null == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetLikesUsersResponseDataImpl implements _GetLikesUsersResponseData {
  const _$GetLikesUsersResponseDataImpl(
      {@JsonKey(name: '_id') required this.id,
      required this.avatar,
      required this.name,
      required this.username});

  factory _$GetLikesUsersResponseDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetLikesUsersResponseDataImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  final String avatar;
  @override
  final String name;
  @override
  final String username;

  @override
  String toString() {
    return 'GetLikesUsersResponseData(id: $id, avatar: $avatar, name: $name, username: $username)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetLikesUsersResponseDataImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.username, username) ||
                other.username == username));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, avatar, name, username);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetLikesUsersResponseDataImplCopyWith<_$GetLikesUsersResponseDataImpl>
      get copyWith => __$$GetLikesUsersResponseDataImplCopyWithImpl<
          _$GetLikesUsersResponseDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetLikesUsersResponseDataImplToJson(
      this,
    );
  }
}

abstract class _GetLikesUsersResponseData implements GetLikesUsersResponseData {
  const factory _GetLikesUsersResponseData(
      {@JsonKey(name: '_id') required final String id,
      required final String avatar,
      required final String name,
      required final String username}) = _$GetLikesUsersResponseDataImpl;

  factory _GetLikesUsersResponseData.fromJson(Map<String, dynamic> json) =
      _$GetLikesUsersResponseDataImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String get id;
  @override
  String get avatar;
  @override
  String get name;
  @override
  String get username;
  @override
  @JsonKey(ignore: true)
  _$$GetLikesUsersResponseDataImplCopyWith<_$GetLikesUsersResponseDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}
