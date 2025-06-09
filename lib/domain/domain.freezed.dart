// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'domain.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Mission {
  String get name;
  DateTime get createdAt;
  DateTime get endAt;
  MissionStatus get status;
  int get sendingCount;

  /// Create a copy of Mission
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MissionCopyWith<Mission> get copyWith =>
      _$MissionCopyWithImpl<Mission>(this as Mission, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Mission &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.endAt, endAt) || other.endAt == endAt) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.sendingCount, sendingCount) ||
                other.sendingCount == sendingCount));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, name, createdAt, endAt, status, sendingCount);

  @override
  String toString() {
    return 'Mission(name: $name, createdAt: $createdAt, endAt: $endAt, status: $status, sendingCount: $sendingCount)';
  }
}

/// @nodoc
abstract mixin class $MissionCopyWith<$Res> {
  factory $MissionCopyWith(Mission value, $Res Function(Mission) _then) =
      _$MissionCopyWithImpl;
  @useResult
  $Res call(
      {String name,
      DateTime createdAt,
      DateTime endAt,
      MissionStatus status,
      int sendingCount});
}

/// @nodoc
class _$MissionCopyWithImpl<$Res> implements $MissionCopyWith<$Res> {
  _$MissionCopyWithImpl(this._self, this._then);

  final Mission _self;
  final $Res Function(Mission) _then;

  /// Create a copy of Mission
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? createdAt = null,
    Object? endAt = null,
    Object? status = null,
    Object? sendingCount = null,
  }) {
    return _then(Mission(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endAt: null == endAt
          ? _self.endAt
          : endAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as MissionStatus,
      sendingCount: null == sendingCount
          ? _self.sendingCount
          : sendingCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
mixin _$Store {
  int get storeId;
  String get name;
  String get logoPath;
  double get distanceKm;
  String get address;
  StoreCategory get category;
  int get notificationCount;
  bool get isFavorite;

  /// Create a copy of Store
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $StoreCopyWith<Store> get copyWith =>
      _$StoreCopyWithImpl<Store>(this as Store, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Store &&
            (identical(other.storeId, storeId) || other.storeId == storeId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.logoPath, logoPath) ||
                other.logoPath == logoPath) &&
            (identical(other.distanceKm, distanceKm) ||
                other.distanceKm == distanceKm) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.notificationCount, notificationCount) ||
                other.notificationCount == notificationCount) &&
            (identical(other.isFavorite, isFavorite) ||
                other.isFavorite == isFavorite));
  }

  @override
  int get hashCode => Object.hash(runtimeType, storeId, name, logoPath,
      distanceKm, address, category, notificationCount, isFavorite);

  @override
  String toString() {
    return 'Store(storeId: $storeId, name: $name, logoPath: $logoPath, distanceKm: $distanceKm, address: $address, category: $category, notificationCount: $notificationCount, isFavorite: $isFavorite)';
  }
}

/// @nodoc
abstract mixin class $StoreCopyWith<$Res> {
  factory $StoreCopyWith(Store value, $Res Function(Store) _then) =
      _$StoreCopyWithImpl;
  @useResult
  $Res call(
      {int storeId,
      String name,
      String logoPath,
      double distanceKm,
      String address,
      StoreCategory category,
      int notificationCount,
      bool isFavorite});
}

/// @nodoc
class _$StoreCopyWithImpl<$Res> implements $StoreCopyWith<$Res> {
  _$StoreCopyWithImpl(this._self, this._then);

  final Store _self;
  final $Res Function(Store) _then;

  /// Create a copy of Store
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? storeId = null,
    Object? name = null,
    Object? logoPath = null,
    Object? distanceKm = null,
    Object? address = null,
    Object? category = null,
    Object? notificationCount = null,
    Object? isFavorite = null,
  }) {
    return _then(Store(
      storeId: null == storeId
          ? _self.storeId
          : storeId // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      logoPath: null == logoPath
          ? _self.logoPath
          : logoPath // ignore: cast_nullable_to_non_nullable
              as String,
      distanceKm: null == distanceKm
          ? _self.distanceKm
          : distanceKm // ignore: cast_nullable_to_non_nullable
              as double,
      address: null == address
          ? _self.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as StoreCategory,
      notificationCount: null == notificationCount
          ? _self.notificationCount
          : notificationCount // ignore: cast_nullable_to_non_nullable
              as int,
      isFavorite: null == isFavorite
          ? _self.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
mixin _$Tool {
  String get title;
  String get iconPath;

  /// Create a copy of Tool
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ToolCopyWith<Tool> get copyWith =>
      _$ToolCopyWithImpl<Tool>(this as Tool, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Tool &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.iconPath, iconPath) ||
                other.iconPath == iconPath));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title, iconPath);

  @override
  String toString() {
    return 'Tool(title: $title, iconPath: $iconPath)';
  }
}

/// @nodoc
abstract mixin class $ToolCopyWith<$Res> {
  factory $ToolCopyWith(Tool value, $Res Function(Tool) _then) =
      _$ToolCopyWithImpl;
  @useResult
  $Res call({String title, String iconPath});
}

/// @nodoc
class _$ToolCopyWithImpl<$Res> implements $ToolCopyWith<$Res> {
  _$ToolCopyWithImpl(this._self, this._then);

  final Tool _self;
  final $Res Function(Tool) _then;

  /// Create a copy of Tool
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? iconPath = null,
  }) {
    return _then(Tool(
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      iconPath: null == iconPath
          ? _self.iconPath
          : iconPath // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$User {
  String get fullName;
  DateTime? get dob;
  String get phoneNo;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserCopyWith<User> get copyWith =>
      _$UserCopyWithImpl<User>(this as User, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is User &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.dob, dob) || other.dob == dob) &&
            (identical(other.phoneNo, phoneNo) || other.phoneNo == phoneNo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, fullName, dob, phoneNo);

  @override
  String toString() {
    return 'User(fullName: $fullName, dob: $dob, phoneNo: $phoneNo)';
  }
}

/// @nodoc
abstract mixin class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) _then) =
      _$UserCopyWithImpl;
  @useResult
  $Res call({String fullName, DateTime? dob, String phoneNo});
}

/// @nodoc
class _$UserCopyWithImpl<$Res> implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._self, this._then);

  final User _self;
  final $Res Function(User) _then;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fullName = null,
    Object? dob = freezed,
    Object? phoneNo = null,
  }) {
    return _then(User(
      fullName: null == fullName
          ? _self.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      dob: freezed == dob
          ? _self.dob
          : dob // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      phoneNo: null == phoneNo
          ? _self.phoneNo
          : phoneNo // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
