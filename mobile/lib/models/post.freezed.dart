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
