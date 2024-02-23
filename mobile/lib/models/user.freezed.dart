// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GetUserResponse _$GetUserResponseFromJson(Map<String, dynamic> json) {
  return _GetUserResponse.fromJson(json);
}

/// @nodoc
mixin _$GetUserResponse {
  bool get success => throw _privateConstructorUsedError;
  GetUserResponseData get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetUserResponseCopyWith<GetUserResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetUserResponseCopyWith<$Res> {
  factory $GetUserResponseCopyWith(
          GetUserResponse value, $Res Function(GetUserResponse) then) =
      _$GetUserResponseCopyWithImpl<$Res, GetUserResponse>;
  @useResult
  $Res call({bool success, GetUserResponseData data});

  $GetUserResponseDataCopyWith<$Res> get data;
}

/// @nodoc
class _$GetUserResponseCopyWithImpl<$Res, $Val extends GetUserResponse>
    implements $GetUserResponseCopyWith<$Res> {
  _$GetUserResponseCopyWithImpl(this._value, this._then);

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
              as GetUserResponseData,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $GetUserResponseDataCopyWith<$Res> get data {
    return $GetUserResponseDataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GetUserResponseImplCopyWith<$Res>
    implements $GetUserResponseCopyWith<$Res> {
  factory _$$GetUserResponseImplCopyWith(_$GetUserResponseImpl value,
          $Res Function(_$GetUserResponseImpl) then) =
      __$$GetUserResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, GetUserResponseData data});

  @override
  $GetUserResponseDataCopyWith<$Res> get data;
}

/// @nodoc
class __$$GetUserResponseImplCopyWithImpl<$Res>
    extends _$GetUserResponseCopyWithImpl<$Res, _$GetUserResponseImpl>
    implements _$$GetUserResponseImplCopyWith<$Res> {
  __$$GetUserResponseImplCopyWithImpl(
      _$GetUserResponseImpl _value, $Res Function(_$GetUserResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? data = null,
  }) {
    return _then(_$GetUserResponseImpl(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as GetUserResponseData,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetUserResponseImpl implements _GetUserResponse {
  const _$GetUserResponseImpl({required this.success, required this.data});

  factory _$GetUserResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetUserResponseImplFromJson(json);

  @override
  final bool success;
  @override
  final GetUserResponseData data;

  @override
  String toString() {
    return 'GetUserResponse(success: $success, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetUserResponseImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, success, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetUserResponseImplCopyWith<_$GetUserResponseImpl> get copyWith =>
      __$$GetUserResponseImplCopyWithImpl<_$GetUserResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetUserResponseImplToJson(
      this,
    );
  }
}

abstract class _GetUserResponse implements GetUserResponse {
  const factory _GetUserResponse(
      {required final bool success,
      required final GetUserResponseData data}) = _$GetUserResponseImpl;

  factory _GetUserResponse.fromJson(Map<String, dynamic> json) =
      _$GetUserResponseImpl.fromJson;

  @override
  bool get success;
  @override
  GetUserResponseData get data;
  @override
  @JsonKey(ignore: true)
  _$$GetUserResponseImplCopyWith<_$GetUserResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GetUserResponseData _$GetUserResponseDataFromJson(Map<String, dynamic> json) {
  return _GetUserResponseData.fromJson(json);
}

/// @nodoc
mixin _$GetUserResponseData {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String get avatar => throw _privateConstructorUsedError;
  String get bio => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetUserResponseDataCopyWith<GetUserResponseData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetUserResponseDataCopyWith<$Res> {
  factory $GetUserResponseDataCopyWith(
          GetUserResponseData value, $Res Function(GetUserResponseData) then) =
      _$GetUserResponseDataCopyWithImpl<$Res, GetUserResponseData>;
  @useResult
  $Res call(
      {String id, String name, String username, String avatar, String bio});
}

/// @nodoc
class _$GetUserResponseDataCopyWithImpl<$Res, $Val extends GetUserResponseData>
    implements $GetUserResponseDataCopyWith<$Res> {
  _$GetUserResponseDataCopyWithImpl(this._value, this._then);

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
    Object? bio = null,
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
      bio: null == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetUserResponseDataImplCopyWith<$Res>
    implements $GetUserResponseDataCopyWith<$Res> {
  factory _$$GetUserResponseDataImplCopyWith(_$GetUserResponseDataImpl value,
          $Res Function(_$GetUserResponseDataImpl) then) =
      __$$GetUserResponseDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id, String name, String username, String avatar, String bio});
}

/// @nodoc
class __$$GetUserResponseDataImplCopyWithImpl<$Res>
    extends _$GetUserResponseDataCopyWithImpl<$Res, _$GetUserResponseDataImpl>
    implements _$$GetUserResponseDataImplCopyWith<$Res> {
  __$$GetUserResponseDataImplCopyWithImpl(_$GetUserResponseDataImpl _value,
      $Res Function(_$GetUserResponseDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? username = null,
    Object? avatar = null,
    Object? bio = null,
  }) {
    return _then(_$GetUserResponseDataImpl(
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
      bio: null == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetUserResponseDataImpl implements _GetUserResponseData {
  const _$GetUserResponseDataImpl(
      {required this.id,
      required this.name,
      required this.username,
      required this.avatar,
      required this.bio});

  factory _$GetUserResponseDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetUserResponseDataImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String username;
  @override
  final String avatar;
  @override
  final String bio;

  @override
  String toString() {
    return 'GetUserResponseData(id: $id, name: $name, username: $username, avatar: $avatar, bio: $bio)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetUserResponseDataImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            (identical(other.bio, bio) || other.bio == bio));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, username, avatar, bio);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetUserResponseDataImplCopyWith<_$GetUserResponseDataImpl> get copyWith =>
      __$$GetUserResponseDataImplCopyWithImpl<_$GetUserResponseDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetUserResponseDataImplToJson(
      this,
    );
  }
}

abstract class _GetUserResponseData implements GetUserResponseData {
  const factory _GetUserResponseData(
      {required final String id,
      required final String name,
      required final String username,
      required final String avatar,
      required final String bio}) = _$GetUserResponseDataImpl;

  factory _GetUserResponseData.fromJson(Map<String, dynamic> json) =
      _$GetUserResponseDataImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get username;
  @override
  String get avatar;
  @override
  String get bio;
  @override
  @JsonKey(ignore: true)
  _$$GetUserResponseDataImplCopyWith<_$GetUserResponseDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GetUserPostsResponse _$GetUserPostsResponseFromJson(Map<String, dynamic> json) {
  return _GetUserPostsResponse.fromJson(json);
}

/// @nodoc
mixin _$GetUserPostsResponse {
  bool get success => throw _privateConstructorUsedError;
  List<GetUserPostsResponseData> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetUserPostsResponseCopyWith<GetUserPostsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetUserPostsResponseCopyWith<$Res> {
  factory $GetUserPostsResponseCopyWith(GetUserPostsResponse value,
          $Res Function(GetUserPostsResponse) then) =
      _$GetUserPostsResponseCopyWithImpl<$Res, GetUserPostsResponse>;
  @useResult
  $Res call({bool success, List<GetUserPostsResponseData> data});
}

/// @nodoc
class _$GetUserPostsResponseCopyWithImpl<$Res,
        $Val extends GetUserPostsResponse>
    implements $GetUserPostsResponseCopyWith<$Res> {
  _$GetUserPostsResponseCopyWithImpl(this._value, this._then);

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
              as List<GetUserPostsResponseData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetUserPostsResponseImplCopyWith<$Res>
    implements $GetUserPostsResponseCopyWith<$Res> {
  factory _$$GetUserPostsResponseImplCopyWith(_$GetUserPostsResponseImpl value,
          $Res Function(_$GetUserPostsResponseImpl) then) =
      __$$GetUserPostsResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, List<GetUserPostsResponseData> data});
}

/// @nodoc
class __$$GetUserPostsResponseImplCopyWithImpl<$Res>
    extends _$GetUserPostsResponseCopyWithImpl<$Res, _$GetUserPostsResponseImpl>
    implements _$$GetUserPostsResponseImplCopyWith<$Res> {
  __$$GetUserPostsResponseImplCopyWithImpl(_$GetUserPostsResponseImpl _value,
      $Res Function(_$GetUserPostsResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? data = null,
  }) {
    return _then(_$GetUserPostsResponseImpl(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<GetUserPostsResponseData>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetUserPostsResponseImpl implements _GetUserPostsResponse {
  const _$GetUserPostsResponseImpl(
      {required this.success,
      required final List<GetUserPostsResponseData> data})
      : _data = data;

  factory _$GetUserPostsResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetUserPostsResponseImplFromJson(json);

  @override
  final bool success;
  final List<GetUserPostsResponseData> _data;
  @override
  List<GetUserPostsResponseData> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'GetUserPostsResponse(success: $success, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetUserPostsResponseImpl &&
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
  _$$GetUserPostsResponseImplCopyWith<_$GetUserPostsResponseImpl>
      get copyWith =>
          __$$GetUserPostsResponseImplCopyWithImpl<_$GetUserPostsResponseImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetUserPostsResponseImplToJson(
      this,
    );
  }
}

abstract class _GetUserPostsResponse implements GetUserPostsResponse {
  const factory _GetUserPostsResponse(
          {required final bool success,
          required final List<GetUserPostsResponseData> data}) =
      _$GetUserPostsResponseImpl;

  factory _GetUserPostsResponse.fromJson(Map<String, dynamic> json) =
      _$GetUserPostsResponseImpl.fromJson;

  @override
  bool get success;
  @override
  List<GetUserPostsResponseData> get data;
  @override
  @JsonKey(ignore: true)
  _$$GetUserPostsResponseImplCopyWith<_$GetUserPostsResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

GetUserPostsResponseData _$GetUserPostsResponseDataFromJson(
    Map<String, dynamic> json) {
  return _GetUserPostsResponseData.fromJson(json);
}

/// @nodoc
mixin _$GetUserPostsResponseData {
  String get id => throw _privateConstructorUsedError;
  String get caption => throw _privateConstructorUsedError;
  List<PostAssetItem> get assets => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetUserPostsResponseDataCopyWith<GetUserPostsResponseData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetUserPostsResponseDataCopyWith<$Res> {
  factory $GetUserPostsResponseDataCopyWith(GetUserPostsResponseData value,
          $Res Function(GetUserPostsResponseData) then) =
      _$GetUserPostsResponseDataCopyWithImpl<$Res, GetUserPostsResponseData>;
  @useResult
  $Res call({String id, String caption, List<PostAssetItem> assets});
}

/// @nodoc
class _$GetUserPostsResponseDataCopyWithImpl<$Res,
        $Val extends GetUserPostsResponseData>
    implements $GetUserPostsResponseDataCopyWith<$Res> {
  _$GetUserPostsResponseDataCopyWithImpl(this._value, this._then);

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
abstract class _$$GetUserPostsResponseDataImplCopyWith<$Res>
    implements $GetUserPostsResponseDataCopyWith<$Res> {
  factory _$$GetUserPostsResponseDataImplCopyWith(
          _$GetUserPostsResponseDataImpl value,
          $Res Function(_$GetUserPostsResponseDataImpl) then) =
      __$$GetUserPostsResponseDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String caption, List<PostAssetItem> assets});
}

/// @nodoc
class __$$GetUserPostsResponseDataImplCopyWithImpl<$Res>
    extends _$GetUserPostsResponseDataCopyWithImpl<$Res,
        _$GetUserPostsResponseDataImpl>
    implements _$$GetUserPostsResponseDataImplCopyWith<$Res> {
  __$$GetUserPostsResponseDataImplCopyWithImpl(
      _$GetUserPostsResponseDataImpl _value,
      $Res Function(_$GetUserPostsResponseDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? caption = null,
    Object? assets = null,
  }) {
    return _then(_$GetUserPostsResponseDataImpl(
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
class _$GetUserPostsResponseDataImpl implements _GetUserPostsResponseData {
  const _$GetUserPostsResponseDataImpl(
      {required this.id,
      required this.caption,
      required final List<PostAssetItem> assets})
      : _assets = assets;

  factory _$GetUserPostsResponseDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetUserPostsResponseDataImplFromJson(json);

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
    return 'GetUserPostsResponseData(id: $id, caption: $caption, assets: $assets)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetUserPostsResponseDataImpl &&
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
  _$$GetUserPostsResponseDataImplCopyWith<_$GetUserPostsResponseDataImpl>
      get copyWith => __$$GetUserPostsResponseDataImplCopyWithImpl<
          _$GetUserPostsResponseDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetUserPostsResponseDataImplToJson(
      this,
    );
  }
}

abstract class _GetUserPostsResponseData implements GetUserPostsResponseData {
  const factory _GetUserPostsResponseData(
          {required final String id,
          required final String caption,
          required final List<PostAssetItem> assets}) =
      _$GetUserPostsResponseDataImpl;

  factory _GetUserPostsResponseData.fromJson(Map<String, dynamic> json) =
      _$GetUserPostsResponseDataImpl.fromJson;

  @override
  String get id;
  @override
  String get caption;
  @override
  List<PostAssetItem> get assets;
  @override
  @JsonKey(ignore: true)
  _$$GetUserPostsResponseDataImplCopyWith<_$GetUserPostsResponseDataImpl>
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

SearchUsersResponse _$SearchUsersResponseFromJson(Map<String, dynamic> json) {
  return _SearchUsersResponse.fromJson(json);
}

/// @nodoc
mixin _$SearchUsersResponse {
  bool get success => throw _privateConstructorUsedError;
  List<SearchUsersResponseData> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SearchUsersResponseCopyWith<SearchUsersResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchUsersResponseCopyWith<$Res> {
  factory $SearchUsersResponseCopyWith(
          SearchUsersResponse value, $Res Function(SearchUsersResponse) then) =
      _$SearchUsersResponseCopyWithImpl<$Res, SearchUsersResponse>;
  @useResult
  $Res call({bool success, List<SearchUsersResponseData> data});
}

/// @nodoc
class _$SearchUsersResponseCopyWithImpl<$Res, $Val extends SearchUsersResponse>
    implements $SearchUsersResponseCopyWith<$Res> {
  _$SearchUsersResponseCopyWithImpl(this._value, this._then);

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
              as List<SearchUsersResponseData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SearchUsersResponseImplCopyWith<$Res>
    implements $SearchUsersResponseCopyWith<$Res> {
  factory _$$SearchUsersResponseImplCopyWith(_$SearchUsersResponseImpl value,
          $Res Function(_$SearchUsersResponseImpl) then) =
      __$$SearchUsersResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, List<SearchUsersResponseData> data});
}

/// @nodoc
class __$$SearchUsersResponseImplCopyWithImpl<$Res>
    extends _$SearchUsersResponseCopyWithImpl<$Res, _$SearchUsersResponseImpl>
    implements _$$SearchUsersResponseImplCopyWith<$Res> {
  __$$SearchUsersResponseImplCopyWithImpl(_$SearchUsersResponseImpl _value,
      $Res Function(_$SearchUsersResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? data = null,
  }) {
    return _then(_$SearchUsersResponseImpl(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<SearchUsersResponseData>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SearchUsersResponseImpl implements _SearchUsersResponse {
  const _$SearchUsersResponseImpl(
      {required this.success,
      required final List<SearchUsersResponseData> data})
      : _data = data;

  factory _$SearchUsersResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$SearchUsersResponseImplFromJson(json);

  @override
  final bool success;
  final List<SearchUsersResponseData> _data;
  @override
  List<SearchUsersResponseData> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'SearchUsersResponse(success: $success, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchUsersResponseImpl &&
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
  _$$SearchUsersResponseImplCopyWith<_$SearchUsersResponseImpl> get copyWith =>
      __$$SearchUsersResponseImplCopyWithImpl<_$SearchUsersResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SearchUsersResponseImplToJson(
      this,
    );
  }
}

abstract class _SearchUsersResponse implements SearchUsersResponse {
  const factory _SearchUsersResponse(
          {required final bool success,
          required final List<SearchUsersResponseData> data}) =
      _$SearchUsersResponseImpl;

  factory _SearchUsersResponse.fromJson(Map<String, dynamic> json) =
      _$SearchUsersResponseImpl.fromJson;

  @override
  bool get success;
  @override
  List<SearchUsersResponseData> get data;
  @override
  @JsonKey(ignore: true)
  _$$SearchUsersResponseImplCopyWith<_$SearchUsersResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SearchUsersResponseData _$SearchUsersResponseDataFromJson(
    Map<String, dynamic> json) {
  return _SearchUsersResponseData.fromJson(json);
}

/// @nodoc
mixin _$SearchUsersResponseData {
  String get id => throw _privateConstructorUsedError;
  String get avatar => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SearchUsersResponseDataCopyWith<SearchUsersResponseData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchUsersResponseDataCopyWith<$Res> {
  factory $SearchUsersResponseDataCopyWith(SearchUsersResponseData value,
          $Res Function(SearchUsersResponseData) then) =
      _$SearchUsersResponseDataCopyWithImpl<$Res, SearchUsersResponseData>;
  @useResult
  $Res call({String id, String avatar, String name, String username});
}

/// @nodoc
class _$SearchUsersResponseDataCopyWithImpl<$Res,
        $Val extends SearchUsersResponseData>
    implements $SearchUsersResponseDataCopyWith<$Res> {
  _$SearchUsersResponseDataCopyWithImpl(this._value, this._then);

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
abstract class _$$SearchUsersResponseDataImplCopyWith<$Res>
    implements $SearchUsersResponseDataCopyWith<$Res> {
  factory _$$SearchUsersResponseDataImplCopyWith(
          _$SearchUsersResponseDataImpl value,
          $Res Function(_$SearchUsersResponseDataImpl) then) =
      __$$SearchUsersResponseDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String avatar, String name, String username});
}

/// @nodoc
class __$$SearchUsersResponseDataImplCopyWithImpl<$Res>
    extends _$SearchUsersResponseDataCopyWithImpl<$Res,
        _$SearchUsersResponseDataImpl>
    implements _$$SearchUsersResponseDataImplCopyWith<$Res> {
  __$$SearchUsersResponseDataImplCopyWithImpl(
      _$SearchUsersResponseDataImpl _value,
      $Res Function(_$SearchUsersResponseDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? avatar = null,
    Object? name = null,
    Object? username = null,
  }) {
    return _then(_$SearchUsersResponseDataImpl(
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
class _$SearchUsersResponseDataImpl implements _SearchUsersResponseData {
  const _$SearchUsersResponseDataImpl(
      {required this.id,
      required this.avatar,
      required this.name,
      required this.username});

  factory _$SearchUsersResponseDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$SearchUsersResponseDataImplFromJson(json);

  @override
  final String id;
  @override
  final String avatar;
  @override
  final String name;
  @override
  final String username;

  @override
  String toString() {
    return 'SearchUsersResponseData(id: $id, avatar: $avatar, name: $name, username: $username)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchUsersResponseDataImpl &&
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
  _$$SearchUsersResponseDataImplCopyWith<_$SearchUsersResponseDataImpl>
      get copyWith => __$$SearchUsersResponseDataImplCopyWithImpl<
          _$SearchUsersResponseDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SearchUsersResponseDataImplToJson(
      this,
    );
  }
}

abstract class _SearchUsersResponseData implements SearchUsersResponseData {
  const factory _SearchUsersResponseData(
      {required final String id,
      required final String avatar,
      required final String name,
      required final String username}) = _$SearchUsersResponseDataImpl;

  factory _SearchUsersResponseData.fromJson(Map<String, dynamic> json) =
      _$SearchUsersResponseDataImpl.fromJson;

  @override
  String get id;
  @override
  String get avatar;
  @override
  String get name;
  @override
  String get username;
  @override
  @JsonKey(ignore: true)
  _$$SearchUsersResponseDataImplCopyWith<_$SearchUsersResponseDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}
