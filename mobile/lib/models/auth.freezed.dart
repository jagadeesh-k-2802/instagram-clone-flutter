// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TokenResponse _$TokenResponseFromJson(Map<String, dynamic> json) {
  return _TokenResponse.fromJson(json);
}

/// @nodoc
mixin _$TokenResponse {
  bool get success => throw _privateConstructorUsedError;
  String get token => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TokenResponseCopyWith<TokenResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TokenResponseCopyWith<$Res> {
  factory $TokenResponseCopyWith(
          TokenResponse value, $Res Function(TokenResponse) then) =
      _$TokenResponseCopyWithImpl<$Res, TokenResponse>;
  @useResult
  $Res call({bool success, String token});
}

/// @nodoc
class _$TokenResponseCopyWithImpl<$Res, $Val extends TokenResponse>
    implements $TokenResponseCopyWith<$Res> {
  _$TokenResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? token = null,
  }) {
    return _then(_value.copyWith(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TokenResponseImplCopyWith<$Res>
    implements $TokenResponseCopyWith<$Res> {
  factory _$$TokenResponseImplCopyWith(
          _$TokenResponseImpl value, $Res Function(_$TokenResponseImpl) then) =
      __$$TokenResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, String token});
}

/// @nodoc
class __$$TokenResponseImplCopyWithImpl<$Res>
    extends _$TokenResponseCopyWithImpl<$Res, _$TokenResponseImpl>
    implements _$$TokenResponseImplCopyWith<$Res> {
  __$$TokenResponseImplCopyWithImpl(
      _$TokenResponseImpl _value, $Res Function(_$TokenResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? token = null,
  }) {
    return _then(_$TokenResponseImpl(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TokenResponseImpl implements _TokenResponse {
  const _$TokenResponseImpl({required this.success, required this.token});

  factory _$TokenResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$TokenResponseImplFromJson(json);

  @override
  final bool success;
  @override
  final String token;

  @override
  String toString() {
    return 'TokenResponse(success: $success, token: $token)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TokenResponseImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.token, token) || other.token == token));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, success, token);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TokenResponseImplCopyWith<_$TokenResponseImpl> get copyWith =>
      __$$TokenResponseImplCopyWithImpl<_$TokenResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TokenResponseImplToJson(
      this,
    );
  }
}

abstract class _TokenResponse implements TokenResponse {
  const factory _TokenResponse(
      {required final bool success,
      required final String token}) = _$TokenResponseImpl;

  factory _TokenResponse.fromJson(Map<String, dynamic> json) =
      _$TokenResponseImpl.fromJson;

  @override
  bool get success;
  @override
  String get token;
  @override
  @JsonKey(ignore: true)
  _$$TokenResponseImplCopyWith<_$TokenResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserResponse _$UserResponseFromJson(Map<String, dynamic> json) {
  return _UserResponse.fromJson(json);
}

/// @nodoc
mixin _$UserResponse {
  bool get success => throw _privateConstructorUsedError;
  UserResponseData get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserResponseCopyWith<UserResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserResponseCopyWith<$Res> {
  factory $UserResponseCopyWith(
          UserResponse value, $Res Function(UserResponse) then) =
      _$UserResponseCopyWithImpl<$Res, UserResponse>;
  @useResult
  $Res call({bool success, UserResponseData data});

  $UserResponseDataCopyWith<$Res> get data;
}

/// @nodoc
class _$UserResponseCopyWithImpl<$Res, $Val extends UserResponse>
    implements $UserResponseCopyWith<$Res> {
  _$UserResponseCopyWithImpl(this._value, this._then);

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
              as UserResponseData,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserResponseDataCopyWith<$Res> get data {
    return $UserResponseDataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserResponseImplCopyWith<$Res>
    implements $UserResponseCopyWith<$Res> {
  factory _$$UserResponseImplCopyWith(
          _$UserResponseImpl value, $Res Function(_$UserResponseImpl) then) =
      __$$UserResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, UserResponseData data});

  @override
  $UserResponseDataCopyWith<$Res> get data;
}

/// @nodoc
class __$$UserResponseImplCopyWithImpl<$Res>
    extends _$UserResponseCopyWithImpl<$Res, _$UserResponseImpl>
    implements _$$UserResponseImplCopyWith<$Res> {
  __$$UserResponseImplCopyWithImpl(
      _$UserResponseImpl _value, $Res Function(_$UserResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? data = null,
  }) {
    return _then(_$UserResponseImpl(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as UserResponseData,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserResponseImpl implements _UserResponse {
  const _$UserResponseImpl({required this.success, required this.data});

  factory _$UserResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserResponseImplFromJson(json);

  @override
  final bool success;
  @override
  final UserResponseData data;

  @override
  String toString() {
    return 'UserResponse(success: $success, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserResponseImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, success, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserResponseImplCopyWith<_$UserResponseImpl> get copyWith =>
      __$$UserResponseImplCopyWithImpl<_$UserResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserResponseImplToJson(
      this,
    );
  }
}

abstract class _UserResponse implements UserResponse {
  const factory _UserResponse(
      {required final bool success,
      required final UserResponseData data}) = _$UserResponseImpl;

  factory _UserResponse.fromJson(Map<String, dynamic> json) =
      _$UserResponseImpl.fromJson;

  @override
  bool get success;
  @override
  UserResponseData get data;
  @override
  @JsonKey(ignore: true)
  _$$UserResponseImplCopyWith<_$UserResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserResponseData _$UserResponseDataFromJson(Map<String, dynamic> json) {
  return _UserResponseData.fromJson(json);
}

/// @nodoc
mixin _$UserResponseData {
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
  String get avatar => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get gender => throw _privateConstructorUsedError;
  String get bio => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  bool get isPrivateAccount => throw _privateConstructorUsedError;
  int get unReadNotificationsCount => throw _privateConstructorUsedError;
  String? get fcmToken => throw _privateConstructorUsedError;
  String? get streamToken => throw _privateConstructorUsedError;
  int get postCount => throw _privateConstructorUsedError;
  int get followersCount => throw _privateConstructorUsedError;
  int get followingCount => throw _privateConstructorUsedError;
  @DateTimeConvertor()
  String get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserResponseDataCopyWith<UserResponseData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserResponseDataCopyWith<$Res> {
  factory $UserResponseDataCopyWith(
          UserResponseData value, $Res Function(UserResponseData) then) =
      _$UserResponseDataCopyWithImpl<$Res, UserResponseData>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      String avatar,
      String name,
      String username,
      String email,
      String gender,
      String bio,
      String? phone,
      bool isPrivateAccount,
      int unReadNotificationsCount,
      String? fcmToken,
      String? streamToken,
      int postCount,
      int followersCount,
      int followingCount,
      @DateTimeConvertor() String createdAt});
}

/// @nodoc
class _$UserResponseDataCopyWithImpl<$Res, $Val extends UserResponseData>
    implements $UserResponseDataCopyWith<$Res> {
  _$UserResponseDataCopyWithImpl(this._value, this._then);

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
    Object? email = null,
    Object? gender = null,
    Object? bio = null,
    Object? phone = freezed,
    Object? isPrivateAccount = null,
    Object? unReadNotificationsCount = null,
    Object? fcmToken = freezed,
    Object? streamToken = freezed,
    Object? postCount = null,
    Object? followersCount = null,
    Object? followingCount = null,
    Object? createdAt = null,
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
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      bio: null == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      isPrivateAccount: null == isPrivateAccount
          ? _value.isPrivateAccount
          : isPrivateAccount // ignore: cast_nullable_to_non_nullable
              as bool,
      unReadNotificationsCount: null == unReadNotificationsCount
          ? _value.unReadNotificationsCount
          : unReadNotificationsCount // ignore: cast_nullable_to_non_nullable
              as int,
      fcmToken: freezed == fcmToken
          ? _value.fcmToken
          : fcmToken // ignore: cast_nullable_to_non_nullable
              as String?,
      streamToken: freezed == streamToken
          ? _value.streamToken
          : streamToken // ignore: cast_nullable_to_non_nullable
              as String?,
      postCount: null == postCount
          ? _value.postCount
          : postCount // ignore: cast_nullable_to_non_nullable
              as int,
      followersCount: null == followersCount
          ? _value.followersCount
          : followersCount // ignore: cast_nullable_to_non_nullable
              as int,
      followingCount: null == followingCount
          ? _value.followingCount
          : followingCount // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserResponseDataImplCopyWith<$Res>
    implements $UserResponseDataCopyWith<$Res> {
  factory _$$UserResponseDataImplCopyWith(_$UserResponseDataImpl value,
          $Res Function(_$UserResponseDataImpl) then) =
      __$$UserResponseDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      String avatar,
      String name,
      String username,
      String email,
      String gender,
      String bio,
      String? phone,
      bool isPrivateAccount,
      int unReadNotificationsCount,
      String? fcmToken,
      String? streamToken,
      int postCount,
      int followersCount,
      int followingCount,
      @DateTimeConvertor() String createdAt});
}

/// @nodoc
class __$$UserResponseDataImplCopyWithImpl<$Res>
    extends _$UserResponseDataCopyWithImpl<$Res, _$UserResponseDataImpl>
    implements _$$UserResponseDataImplCopyWith<$Res> {
  __$$UserResponseDataImplCopyWithImpl(_$UserResponseDataImpl _value,
      $Res Function(_$UserResponseDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? avatar = null,
    Object? name = null,
    Object? username = null,
    Object? email = null,
    Object? gender = null,
    Object? bio = null,
    Object? phone = freezed,
    Object? isPrivateAccount = null,
    Object? unReadNotificationsCount = null,
    Object? fcmToken = freezed,
    Object? streamToken = freezed,
    Object? postCount = null,
    Object? followersCount = null,
    Object? followingCount = null,
    Object? createdAt = null,
  }) {
    return _then(_$UserResponseDataImpl(
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
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      bio: null == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      isPrivateAccount: null == isPrivateAccount
          ? _value.isPrivateAccount
          : isPrivateAccount // ignore: cast_nullable_to_non_nullable
              as bool,
      unReadNotificationsCount: null == unReadNotificationsCount
          ? _value.unReadNotificationsCount
          : unReadNotificationsCount // ignore: cast_nullable_to_non_nullable
              as int,
      fcmToken: freezed == fcmToken
          ? _value.fcmToken
          : fcmToken // ignore: cast_nullable_to_non_nullable
              as String?,
      streamToken: freezed == streamToken
          ? _value.streamToken
          : streamToken // ignore: cast_nullable_to_non_nullable
              as String?,
      postCount: null == postCount
          ? _value.postCount
          : postCount // ignore: cast_nullable_to_non_nullable
              as int,
      followersCount: null == followersCount
          ? _value.followersCount
          : followersCount // ignore: cast_nullable_to_non_nullable
              as int,
      followingCount: null == followingCount
          ? _value.followingCount
          : followingCount // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserResponseDataImpl implements _UserResponseData {
  const _$UserResponseDataImpl(
      {@JsonKey(name: '_id') required this.id,
      required this.avatar,
      required this.name,
      required this.username,
      required this.email,
      required this.gender,
      required this.bio,
      required this.phone,
      required this.isPrivateAccount,
      required this.unReadNotificationsCount,
      required this.fcmToken,
      required this.streamToken,
      required this.postCount,
      required this.followersCount,
      required this.followingCount,
      @DateTimeConvertor() required this.createdAt});

  factory _$UserResponseDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserResponseDataImplFromJson(json);

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
  final String email;
  @override
  final String gender;
  @override
  final String bio;
  @override
  final String? phone;
  @override
  final bool isPrivateAccount;
  @override
  final int unReadNotificationsCount;
  @override
  final String? fcmToken;
  @override
  final String? streamToken;
  @override
  final int postCount;
  @override
  final int followersCount;
  @override
  final int followingCount;
  @override
  @DateTimeConvertor()
  final String createdAt;

  @override
  String toString() {
    return 'UserResponseData(id: $id, avatar: $avatar, name: $name, username: $username, email: $email, gender: $gender, bio: $bio, phone: $phone, isPrivateAccount: $isPrivateAccount, unReadNotificationsCount: $unReadNotificationsCount, fcmToken: $fcmToken, streamToken: $streamToken, postCount: $postCount, followersCount: $followersCount, followingCount: $followingCount, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserResponseDataImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.bio, bio) || other.bio == bio) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.isPrivateAccount, isPrivateAccount) ||
                other.isPrivateAccount == isPrivateAccount) &&
            (identical(
                    other.unReadNotificationsCount, unReadNotificationsCount) ||
                other.unReadNotificationsCount == unReadNotificationsCount) &&
            (identical(other.fcmToken, fcmToken) ||
                other.fcmToken == fcmToken) &&
            (identical(other.streamToken, streamToken) ||
                other.streamToken == streamToken) &&
            (identical(other.postCount, postCount) ||
                other.postCount == postCount) &&
            (identical(other.followersCount, followersCount) ||
                other.followersCount == followersCount) &&
            (identical(other.followingCount, followingCount) ||
                other.followingCount == followingCount) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      avatar,
      name,
      username,
      email,
      gender,
      bio,
      phone,
      isPrivateAccount,
      unReadNotificationsCount,
      fcmToken,
      streamToken,
      postCount,
      followersCount,
      followingCount,
      createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserResponseDataImplCopyWith<_$UserResponseDataImpl> get copyWith =>
      __$$UserResponseDataImplCopyWithImpl<_$UserResponseDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserResponseDataImplToJson(
      this,
    );
  }
}

abstract class _UserResponseData implements UserResponseData {
  const factory _UserResponseData(
          {@JsonKey(name: '_id') required final String id,
          required final String avatar,
          required final String name,
          required final String username,
          required final String email,
          required final String gender,
          required final String bio,
          required final String? phone,
          required final bool isPrivateAccount,
          required final int unReadNotificationsCount,
          required final String? fcmToken,
          required final String? streamToken,
          required final int postCount,
          required final int followersCount,
          required final int followingCount,
          @DateTimeConvertor() required final String createdAt}) =
      _$UserResponseDataImpl;

  factory _UserResponseData.fromJson(Map<String, dynamic> json) =
      _$UserResponseDataImpl.fromJson;

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
  String get email;
  @override
  String get gender;
  @override
  String get bio;
  @override
  String? get phone;
  @override
  bool get isPrivateAccount;
  @override
  int get unReadNotificationsCount;
  @override
  String? get fcmToken;
  @override
  String? get streamToken;
  @override
  int get postCount;
  @override
  int get followersCount;
  @override
  int get followingCount;
  @override
  @DateTimeConvertor()
  String get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$UserResponseDataImplCopyWith<_$UserResponseDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
