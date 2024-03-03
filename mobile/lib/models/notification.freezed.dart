// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GetNotificationsResponse _$GetNotificationsResponseFromJson(
    Map<String, dynamic> json) {
  return _GetNotificationsResponse.fromJson(json);
}

/// @nodoc
mixin _$GetNotificationsResponse {
  bool get success => throw _privateConstructorUsedError;
  List<GetNotificationsResponseData> get data =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetNotificationsResponseCopyWith<GetNotificationsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetNotificationsResponseCopyWith<$Res> {
  factory $GetNotificationsResponseCopyWith(GetNotificationsResponse value,
          $Res Function(GetNotificationsResponse) then) =
      _$GetNotificationsResponseCopyWithImpl<$Res, GetNotificationsResponse>;
  @useResult
  $Res call({bool success, List<GetNotificationsResponseData> data});
}

/// @nodoc
class _$GetNotificationsResponseCopyWithImpl<$Res,
        $Val extends GetNotificationsResponse>
    implements $GetNotificationsResponseCopyWith<$Res> {
  _$GetNotificationsResponseCopyWithImpl(this._value, this._then);

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
              as List<GetNotificationsResponseData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetNotificationsResponseImplCopyWith<$Res>
    implements $GetNotificationsResponseCopyWith<$Res> {
  factory _$$GetNotificationsResponseImplCopyWith(
          _$GetNotificationsResponseImpl value,
          $Res Function(_$GetNotificationsResponseImpl) then) =
      __$$GetNotificationsResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, List<GetNotificationsResponseData> data});
}

/// @nodoc
class __$$GetNotificationsResponseImplCopyWithImpl<$Res>
    extends _$GetNotificationsResponseCopyWithImpl<$Res,
        _$GetNotificationsResponseImpl>
    implements _$$GetNotificationsResponseImplCopyWith<$Res> {
  __$$GetNotificationsResponseImplCopyWithImpl(
      _$GetNotificationsResponseImpl _value,
      $Res Function(_$GetNotificationsResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? data = null,
  }) {
    return _then(_$GetNotificationsResponseImpl(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<GetNotificationsResponseData>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetNotificationsResponseImpl implements _GetNotificationsResponse {
  const _$GetNotificationsResponseImpl(
      {required this.success,
      required final List<GetNotificationsResponseData> data})
      : _data = data;

  factory _$GetNotificationsResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetNotificationsResponseImplFromJson(json);

  @override
  final bool success;
  final List<GetNotificationsResponseData> _data;
  @override
  List<GetNotificationsResponseData> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'GetNotificationsResponse(success: $success, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetNotificationsResponseImpl &&
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
  _$$GetNotificationsResponseImplCopyWith<_$GetNotificationsResponseImpl>
      get copyWith => __$$GetNotificationsResponseImplCopyWithImpl<
          _$GetNotificationsResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetNotificationsResponseImplToJson(
      this,
    );
  }
}

abstract class _GetNotificationsResponse implements GetNotificationsResponse {
  const factory _GetNotificationsResponse(
          {required final bool success,
          required final List<GetNotificationsResponseData> data}) =
      _$GetNotificationsResponseImpl;

  factory _GetNotificationsResponse.fromJson(Map<String, dynamic> json) =
      _$GetNotificationsResponseImpl.fromJson;

  @override
  bool get success;
  @override
  List<GetNotificationsResponseData> get data;
  @override
  @JsonKey(ignore: true)
  _$$GetNotificationsResponseImplCopyWith<_$GetNotificationsResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

NotificationDataUser _$NotificationDataUserFromJson(Map<String, dynamic> json) {
  return _NotificationDataUser.fromJson(json);
}

/// @nodoc
mixin _$NotificationDataUser {
  String get id => throw _privateConstructorUsedError;
  String get avatar => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotificationDataUserCopyWith<NotificationDataUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationDataUserCopyWith<$Res> {
  factory $NotificationDataUserCopyWith(NotificationDataUser value,
          $Res Function(NotificationDataUser) then) =
      _$NotificationDataUserCopyWithImpl<$Res, NotificationDataUser>;
  @useResult
  $Res call({String id, String avatar, String username, String name});
}

/// @nodoc
class _$NotificationDataUserCopyWithImpl<$Res,
        $Val extends NotificationDataUser>
    implements $NotificationDataUserCopyWith<$Res> {
  _$NotificationDataUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? avatar = null,
    Object? username = null,
    Object? name = null,
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
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NotificationDataUserImplCopyWith<$Res>
    implements $NotificationDataUserCopyWith<$Res> {
  factory _$$NotificationDataUserImplCopyWith(_$NotificationDataUserImpl value,
          $Res Function(_$NotificationDataUserImpl) then) =
      __$$NotificationDataUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String avatar, String username, String name});
}

/// @nodoc
class __$$NotificationDataUserImplCopyWithImpl<$Res>
    extends _$NotificationDataUserCopyWithImpl<$Res, _$NotificationDataUserImpl>
    implements _$$NotificationDataUserImplCopyWith<$Res> {
  __$$NotificationDataUserImplCopyWithImpl(_$NotificationDataUserImpl _value,
      $Res Function(_$NotificationDataUserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? avatar = null,
    Object? username = null,
    Object? name = null,
  }) {
    return _then(_$NotificationDataUserImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: null == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NotificationDataUserImpl implements _NotificationDataUser {
  const _$NotificationDataUserImpl(
      {required this.id,
      required this.avatar,
      required this.username,
      required this.name});

  factory _$NotificationDataUserImpl.fromJson(Map<String, dynamic> json) =>
      _$$NotificationDataUserImplFromJson(json);

  @override
  final String id;
  @override
  final String avatar;
  @override
  final String username;
  @override
  final String name;

  @override
  String toString() {
    return 'NotificationDataUser(id: $id, avatar: $avatar, username: $username, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationDataUserImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, avatar, username, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationDataUserImplCopyWith<_$NotificationDataUserImpl>
      get copyWith =>
          __$$NotificationDataUserImplCopyWithImpl<_$NotificationDataUserImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NotificationDataUserImplToJson(
      this,
    );
  }
}

abstract class _NotificationDataUser implements NotificationDataUser {
  const factory _NotificationDataUser(
      {required final String id,
      required final String avatar,
      required final String username,
      required final String name}) = _$NotificationDataUserImpl;

  factory _NotificationDataUser.fromJson(Map<String, dynamic> json) =
      _$NotificationDataUserImpl.fromJson;

  @override
  String get id;
  @override
  String get avatar;
  @override
  String get username;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$NotificationDataUserImplCopyWith<_$NotificationDataUserImpl>
      get copyWith => throw _privateConstructorUsedError;
}

NotificationData _$NotificationDataFromJson(Map<String, dynamic> json) {
  return _NotificationData.fromJson(json);
}

/// @nodoc
mixin _$NotificationData {
  NotificationDataUser? get user => throw _privateConstructorUsedError;
  String? get post => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotificationDataCopyWith<NotificationData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationDataCopyWith<$Res> {
  factory $NotificationDataCopyWith(
          NotificationData value, $Res Function(NotificationData) then) =
      _$NotificationDataCopyWithImpl<$Res, NotificationData>;
  @useResult
  $Res call({NotificationDataUser? user, String? post});

  $NotificationDataUserCopyWith<$Res>? get user;
}

/// @nodoc
class _$NotificationDataCopyWithImpl<$Res, $Val extends NotificationData>
    implements $NotificationDataCopyWith<$Res> {
  _$NotificationDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
    Object? post = freezed,
  }) {
    return _then(_value.copyWith(
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as NotificationDataUser?,
      post: freezed == post
          ? _value.post
          : post // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $NotificationDataUserCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $NotificationDataUserCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$NotificationDataImplCopyWith<$Res>
    implements $NotificationDataCopyWith<$Res> {
  factory _$$NotificationDataImplCopyWith(_$NotificationDataImpl value,
          $Res Function(_$NotificationDataImpl) then) =
      __$$NotificationDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({NotificationDataUser? user, String? post});

  @override
  $NotificationDataUserCopyWith<$Res>? get user;
}

/// @nodoc
class __$$NotificationDataImplCopyWithImpl<$Res>
    extends _$NotificationDataCopyWithImpl<$Res, _$NotificationDataImpl>
    implements _$$NotificationDataImplCopyWith<$Res> {
  __$$NotificationDataImplCopyWithImpl(_$NotificationDataImpl _value,
      $Res Function(_$NotificationDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
    Object? post = freezed,
  }) {
    return _then(_$NotificationDataImpl(
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as NotificationDataUser?,
      post: freezed == post
          ? _value.post
          : post // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NotificationDataImpl implements _NotificationData {
  const _$NotificationDataImpl({required this.user, required this.post});

  factory _$NotificationDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$NotificationDataImplFromJson(json);

  @override
  final NotificationDataUser? user;
  @override
  final String? post;

  @override
  String toString() {
    return 'NotificationData(user: $user, post: $post)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationDataImpl &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.post, post) || other.post == post));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, user, post);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationDataImplCopyWith<_$NotificationDataImpl> get copyWith =>
      __$$NotificationDataImplCopyWithImpl<_$NotificationDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NotificationDataImplToJson(
      this,
    );
  }
}

abstract class _NotificationData implements NotificationData {
  const factory _NotificationData(
      {required final NotificationDataUser? user,
      required final String? post}) = _$NotificationDataImpl;

  factory _NotificationData.fromJson(Map<String, dynamic> json) =
      _$NotificationDataImpl.fromJson;

  @override
  NotificationDataUser? get user;
  @override
  String? get post;
  @override
  @JsonKey(ignore: true)
  _$$NotificationDataImplCopyWith<_$NotificationDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GetNotificationsResponseData _$GetNotificationsResponseDataFromJson(
    Map<String, dynamic> json) {
  return _GetNotificationsResponseData.fromJson(json);
}

/// @nodoc
mixin _$GetNotificationsResponseData {
  String get id => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  NotificationData? get data => throw _privateConstructorUsedError;
  NotificationType get type => throw _privateConstructorUsedError;
  @DateTimeConvertor()
  DateTime get createdAt => throw _privateConstructorUsedError;
  @DateTimeConvertor()
  DateTime get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetNotificationsResponseDataCopyWith<GetNotificationsResponseData>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetNotificationsResponseDataCopyWith<$Res> {
  factory $GetNotificationsResponseDataCopyWith(
          GetNotificationsResponseData value,
          $Res Function(GetNotificationsResponseData) then) =
      _$GetNotificationsResponseDataCopyWithImpl<$Res,
          GetNotificationsResponseData>;
  @useResult
  $Res call(
      {String id,
      String content,
      NotificationData? data,
      NotificationType type,
      @DateTimeConvertor() DateTime createdAt,
      @DateTimeConvertor() DateTime updatedAt});

  $NotificationDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$GetNotificationsResponseDataCopyWithImpl<$Res,
        $Val extends GetNotificationsResponseData>
    implements $GetNotificationsResponseDataCopyWith<$Res> {
  _$GetNotificationsResponseDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? content = null,
    Object? data = freezed,
    Object? type = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as NotificationData?,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as NotificationType,
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
  $NotificationDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $NotificationDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GetNotificationsResponseDataImplCopyWith<$Res>
    implements $GetNotificationsResponseDataCopyWith<$Res> {
  factory _$$GetNotificationsResponseDataImplCopyWith(
          _$GetNotificationsResponseDataImpl value,
          $Res Function(_$GetNotificationsResponseDataImpl) then) =
      __$$GetNotificationsResponseDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String content,
      NotificationData? data,
      NotificationType type,
      @DateTimeConvertor() DateTime createdAt,
      @DateTimeConvertor() DateTime updatedAt});

  @override
  $NotificationDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$GetNotificationsResponseDataImplCopyWithImpl<$Res>
    extends _$GetNotificationsResponseDataCopyWithImpl<$Res,
        _$GetNotificationsResponseDataImpl>
    implements _$$GetNotificationsResponseDataImplCopyWith<$Res> {
  __$$GetNotificationsResponseDataImplCopyWithImpl(
      _$GetNotificationsResponseDataImpl _value,
      $Res Function(_$GetNotificationsResponseDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? content = null,
    Object? data = freezed,
    Object? type = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$GetNotificationsResponseDataImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as NotificationData?,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as NotificationType,
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
class _$GetNotificationsResponseDataImpl
    implements _GetNotificationsResponseData {
  const _$GetNotificationsResponseDataImpl(
      {required this.id,
      required this.content,
      required this.data,
      required this.type,
      @DateTimeConvertor() required this.createdAt,
      @DateTimeConvertor() required this.updatedAt});

  factory _$GetNotificationsResponseDataImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$GetNotificationsResponseDataImplFromJson(json);

  @override
  final String id;
  @override
  final String content;
  @override
  final NotificationData? data;
  @override
  final NotificationType type;
  @override
  @DateTimeConvertor()
  final DateTime createdAt;
  @override
  @DateTimeConvertor()
  final DateTime updatedAt;

  @override
  String toString() {
    return 'GetNotificationsResponseData(id: $id, content: $content, data: $data, type: $type, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetNotificationsResponseDataImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, content, data, type, createdAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetNotificationsResponseDataImplCopyWith<
          _$GetNotificationsResponseDataImpl>
      get copyWith => __$$GetNotificationsResponseDataImplCopyWithImpl<
          _$GetNotificationsResponseDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetNotificationsResponseDataImplToJson(
      this,
    );
  }
}

abstract class _GetNotificationsResponseData
    implements GetNotificationsResponseData {
  const factory _GetNotificationsResponseData(
          {required final String id,
          required final String content,
          required final NotificationData? data,
          required final NotificationType type,
          @DateTimeConvertor() required final DateTime createdAt,
          @DateTimeConvertor() required final DateTime updatedAt}) =
      _$GetNotificationsResponseDataImpl;

  factory _GetNotificationsResponseData.fromJson(Map<String, dynamic> json) =
      _$GetNotificationsResponseDataImpl.fromJson;

  @override
  String get id;
  @override
  String get content;
  @override
  NotificationData? get data;
  @override
  NotificationType get type;
  @override
  @DateTimeConvertor()
  DateTime get createdAt;
  @override
  @DateTimeConvertor()
  DateTime get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$GetNotificationsResponseDataImplCopyWith<
          _$GetNotificationsResponseDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}
