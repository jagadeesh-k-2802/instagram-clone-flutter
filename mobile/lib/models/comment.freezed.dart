// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GetCommentsResponse _$GetCommentsResponseFromJson(Map<String, dynamic> json) {
  return _GetCommentsResponse.fromJson(json);
}

/// @nodoc
mixin _$GetCommentsResponse {
  bool get success => throw _privateConstructorUsedError;
  List<GetCommentsResponseData> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetCommentsResponseCopyWith<GetCommentsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetCommentsResponseCopyWith<$Res> {
  factory $GetCommentsResponseCopyWith(
          GetCommentsResponse value, $Res Function(GetCommentsResponse) then) =
      _$GetCommentsResponseCopyWithImpl<$Res, GetCommentsResponse>;
  @useResult
  $Res call({bool success, List<GetCommentsResponseData> data});
}

/// @nodoc
class _$GetCommentsResponseCopyWithImpl<$Res, $Val extends GetCommentsResponse>
    implements $GetCommentsResponseCopyWith<$Res> {
  _$GetCommentsResponseCopyWithImpl(this._value, this._then);

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
              as List<GetCommentsResponseData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetCommentsResponseImplCopyWith<$Res>
    implements $GetCommentsResponseCopyWith<$Res> {
  factory _$$GetCommentsResponseImplCopyWith(_$GetCommentsResponseImpl value,
          $Res Function(_$GetCommentsResponseImpl) then) =
      __$$GetCommentsResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, List<GetCommentsResponseData> data});
}

/// @nodoc
class __$$GetCommentsResponseImplCopyWithImpl<$Res>
    extends _$GetCommentsResponseCopyWithImpl<$Res, _$GetCommentsResponseImpl>
    implements _$$GetCommentsResponseImplCopyWith<$Res> {
  __$$GetCommentsResponseImplCopyWithImpl(_$GetCommentsResponseImpl _value,
      $Res Function(_$GetCommentsResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? data = null,
  }) {
    return _then(_$GetCommentsResponseImpl(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<GetCommentsResponseData>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetCommentsResponseImpl implements _GetCommentsResponse {
  const _$GetCommentsResponseImpl(
      {required this.success,
      required final List<GetCommentsResponseData> data})
      : _data = data;

  factory _$GetCommentsResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetCommentsResponseImplFromJson(json);

  @override
  final bool success;
  final List<GetCommentsResponseData> _data;
  @override
  List<GetCommentsResponseData> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'GetCommentsResponse(success: $success, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetCommentsResponseImpl &&
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
  _$$GetCommentsResponseImplCopyWith<_$GetCommentsResponseImpl> get copyWith =>
      __$$GetCommentsResponseImplCopyWithImpl<_$GetCommentsResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetCommentsResponseImplToJson(
      this,
    );
  }
}

abstract class _GetCommentsResponse implements GetCommentsResponse {
  const factory _GetCommentsResponse(
          {required final bool success,
          required final List<GetCommentsResponseData> data}) =
      _$GetCommentsResponseImpl;

  factory _GetCommentsResponse.fromJson(Map<String, dynamic> json) =
      _$GetCommentsResponseImpl.fromJson;

  @override
  bool get success;
  @override
  List<GetCommentsResponseData> get data;
  @override
  @JsonKey(ignore: true)
  _$$GetCommentsResponseImplCopyWith<_$GetCommentsResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GetCommentsResponseData _$GetCommentsResponseDataFromJson(
    Map<String, dynamic> json) {
  return _GetCommentsResponseData.fromJson(json);
}

/// @nodoc
mixin _$GetCommentsResponseData {
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
  String get comment => throw _privateConstructorUsedError;
  int get likeCount => throw _privateConstructorUsedError;
  bool get isLiked => throw _privateConstructorUsedError;
  CommentUser get user => throw _privateConstructorUsedError;
  @DateTimeConvertor()
  DateTime get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetCommentsResponseDataCopyWith<GetCommentsResponseData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetCommentsResponseDataCopyWith<$Res> {
  factory $GetCommentsResponseDataCopyWith(GetCommentsResponseData value,
          $Res Function(GetCommentsResponseData) then) =
      _$GetCommentsResponseDataCopyWithImpl<$Res, GetCommentsResponseData>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      String comment,
      int likeCount,
      bool isLiked,
      CommentUser user,
      @DateTimeConvertor() DateTime createdAt});

  $CommentUserCopyWith<$Res> get user;
}

/// @nodoc
class _$GetCommentsResponseDataCopyWithImpl<$Res,
        $Val extends GetCommentsResponseData>
    implements $GetCommentsResponseDataCopyWith<$Res> {
  _$GetCommentsResponseDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? comment = null,
    Object? likeCount = null,
    Object? isLiked = null,
    Object? user = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      likeCount: null == likeCount
          ? _value.likeCount
          : likeCount // ignore: cast_nullable_to_non_nullable
              as int,
      isLiked: null == isLiked
          ? _value.isLiked
          : isLiked // ignore: cast_nullable_to_non_nullable
              as bool,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as CommentUser,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CommentUserCopyWith<$Res> get user {
    return $CommentUserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GetCommentsResponseDataImplCopyWith<$Res>
    implements $GetCommentsResponseDataCopyWith<$Res> {
  factory _$$GetCommentsResponseDataImplCopyWith(
          _$GetCommentsResponseDataImpl value,
          $Res Function(_$GetCommentsResponseDataImpl) then) =
      __$$GetCommentsResponseDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      String comment,
      int likeCount,
      bool isLiked,
      CommentUser user,
      @DateTimeConvertor() DateTime createdAt});

  @override
  $CommentUserCopyWith<$Res> get user;
}

/// @nodoc
class __$$GetCommentsResponseDataImplCopyWithImpl<$Res>
    extends _$GetCommentsResponseDataCopyWithImpl<$Res,
        _$GetCommentsResponseDataImpl>
    implements _$$GetCommentsResponseDataImplCopyWith<$Res> {
  __$$GetCommentsResponseDataImplCopyWithImpl(
      _$GetCommentsResponseDataImpl _value,
      $Res Function(_$GetCommentsResponseDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? comment = null,
    Object? likeCount = null,
    Object? isLiked = null,
    Object? user = null,
    Object? createdAt = null,
  }) {
    return _then(_$GetCommentsResponseDataImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      likeCount: null == likeCount
          ? _value.likeCount
          : likeCount // ignore: cast_nullable_to_non_nullable
              as int,
      isLiked: null == isLiked
          ? _value.isLiked
          : isLiked // ignore: cast_nullable_to_non_nullable
              as bool,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as CommentUser,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetCommentsResponseDataImpl implements _GetCommentsResponseData {
  const _$GetCommentsResponseDataImpl(
      {@JsonKey(name: '_id') required this.id,
      required this.comment,
      required this.likeCount,
      required this.isLiked,
      required this.user,
      @DateTimeConvertor() required this.createdAt});

  factory _$GetCommentsResponseDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetCommentsResponseDataImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  final String comment;
  @override
  final int likeCount;
  @override
  final bool isLiked;
  @override
  final CommentUser user;
  @override
  @DateTimeConvertor()
  final DateTime createdAt;

  @override
  String toString() {
    return 'GetCommentsResponseData(id: $id, comment: $comment, likeCount: $likeCount, isLiked: $isLiked, user: $user, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetCommentsResponseDataImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.likeCount, likeCount) ||
                other.likeCount == likeCount) &&
            (identical(other.isLiked, isLiked) || other.isLiked == isLiked) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, comment, likeCount, isLiked, user, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetCommentsResponseDataImplCopyWith<_$GetCommentsResponseDataImpl>
      get copyWith => __$$GetCommentsResponseDataImplCopyWithImpl<
          _$GetCommentsResponseDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetCommentsResponseDataImplToJson(
      this,
    );
  }
}

abstract class _GetCommentsResponseData implements GetCommentsResponseData {
  const factory _GetCommentsResponseData(
          {@JsonKey(name: '_id') required final String id,
          required final String comment,
          required final int likeCount,
          required final bool isLiked,
          required final CommentUser user,
          @DateTimeConvertor() required final DateTime createdAt}) =
      _$GetCommentsResponseDataImpl;

  factory _GetCommentsResponseData.fromJson(Map<String, dynamic> json) =
      _$GetCommentsResponseDataImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String get id;
  @override
  String get comment;
  @override
  int get likeCount;
  @override
  bool get isLiked;
  @override
  CommentUser get user;
  @override
  @DateTimeConvertor()
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$GetCommentsResponseDataImplCopyWith<_$GetCommentsResponseDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}

CommentUser _$CommentUserFromJson(Map<String, dynamic> json) {
  return _CommentUser.fromJson(json);
}

/// @nodoc
mixin _$CommentUser {
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
  String get avatar => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CommentUserCopyWith<CommentUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentUserCopyWith<$Res> {
  factory $CommentUserCopyWith(
          CommentUser value, $Res Function(CommentUser) then) =
      _$CommentUserCopyWithImpl<$Res, CommentUser>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      String avatar,
      String name,
      String username});
}

/// @nodoc
class _$CommentUserCopyWithImpl<$Res, $Val extends CommentUser>
    implements $CommentUserCopyWith<$Res> {
  _$CommentUserCopyWithImpl(this._value, this._then);

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
abstract class _$$CommentUserImplCopyWith<$Res>
    implements $CommentUserCopyWith<$Res> {
  factory _$$CommentUserImplCopyWith(
          _$CommentUserImpl value, $Res Function(_$CommentUserImpl) then) =
      __$$CommentUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      String avatar,
      String name,
      String username});
}

/// @nodoc
class __$$CommentUserImplCopyWithImpl<$Res>
    extends _$CommentUserCopyWithImpl<$Res, _$CommentUserImpl>
    implements _$$CommentUserImplCopyWith<$Res> {
  __$$CommentUserImplCopyWithImpl(
      _$CommentUserImpl _value, $Res Function(_$CommentUserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? avatar = null,
    Object? name = null,
    Object? username = null,
  }) {
    return _then(_$CommentUserImpl(
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
class _$CommentUserImpl implements _CommentUser {
  const _$CommentUserImpl(
      {@JsonKey(name: '_id') required this.id,
      required this.avatar,
      required this.name,
      required this.username});

  factory _$CommentUserImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommentUserImplFromJson(json);

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
    return 'CommentUser(id: $id, avatar: $avatar, name: $name, username: $username)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommentUserImpl &&
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
  _$$CommentUserImplCopyWith<_$CommentUserImpl> get copyWith =>
      __$$CommentUserImplCopyWithImpl<_$CommentUserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CommentUserImplToJson(
      this,
    );
  }
}

abstract class _CommentUser implements CommentUser {
  const factory _CommentUser(
      {@JsonKey(name: '_id') required final String id,
      required final String avatar,
      required final String name,
      required final String username}) = _$CommentUserImpl;

  factory _CommentUser.fromJson(Map<String, dynamic> json) =
      _$CommentUserImpl.fromJson;

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
  _$$CommentUserImplCopyWith<_$CommentUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
