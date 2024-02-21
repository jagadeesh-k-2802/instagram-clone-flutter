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
  $Res call({String avatar, String name, String username});
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
    Object? avatar = null,
    Object? name = null,
    Object? username = null,
  }) {
    return _then(_value.copyWith(
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
  $Res call({String avatar, String name, String username});
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
    Object? avatar = null,
    Object? name = null,
    Object? username = null,
  }) {
    return _then(_$SearchUsersResponseDataImpl(
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
      {required this.avatar, required this.name, required this.username});

  factory _$SearchUsersResponseDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$SearchUsersResponseDataImplFromJson(json);

  @override
  final String avatar;
  @override
  final String name;
  @override
  final String username;

  @override
  String toString() {
    return 'SearchUsersResponseData(avatar: $avatar, name: $name, username: $username)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchUsersResponseDataImpl &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.username, username) ||
                other.username == username));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, avatar, name, username);

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
      {required final String avatar,
      required final String name,
      required final String username}) = _$SearchUsersResponseDataImpl;

  factory _SearchUsersResponseData.fromJson(Map<String, dynamic> json) =
      _$SearchUsersResponseDataImpl.fromJson;

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
