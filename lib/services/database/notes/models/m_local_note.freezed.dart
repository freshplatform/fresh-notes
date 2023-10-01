// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'm_local_note.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LocalNote _$LocalNoteFromJson(Map<String, dynamic> json) {
  return _LocalNote.fromJson(json);
}

/// @nodoc
mixin _$LocalNote {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;
  String? get cloudId => throw _privateConstructorUsedError;
  bool get isSyncWithCloud => throw _privateConstructorUsedError;
  bool get isPrivate => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LocalNoteCopyWith<LocalNote> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocalNoteCopyWith<$Res> {
  factory $LocalNoteCopyWith(LocalNote value, $Res Function(LocalNote) then) =
      _$LocalNoteCopyWithImpl<$Res, LocalNote>;
  @useResult
  $Res call(
      {String id,
      String userId,
      String text,
      String? cloudId,
      bool isSyncWithCloud,
      bool isPrivate,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class _$LocalNoteCopyWithImpl<$Res, $Val extends LocalNote>
    implements $LocalNoteCopyWith<$Res> {
  _$LocalNoteCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? text = null,
    Object? cloudId = freezed,
    Object? isSyncWithCloud = null,
    Object? isPrivate = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      cloudId: freezed == cloudId
          ? _value.cloudId
          : cloudId // ignore: cast_nullable_to_non_nullable
              as String?,
      isSyncWithCloud: null == isSyncWithCloud
          ? _value.isSyncWithCloud
          : isSyncWithCloud // ignore: cast_nullable_to_non_nullable
              as bool,
      isPrivate: null == isPrivate
          ? _value.isPrivate
          : isPrivate // ignore: cast_nullable_to_non_nullable
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
}

/// @nodoc
abstract class _$$_LocalNoteCopyWith<$Res> implements $LocalNoteCopyWith<$Res> {
  factory _$$_LocalNoteCopyWith(
          _$_LocalNote value, $Res Function(_$_LocalNote) then) =
      __$$_LocalNoteCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String userId,
      String text,
      String? cloudId,
      bool isSyncWithCloud,
      bool isPrivate,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class __$$_LocalNoteCopyWithImpl<$Res>
    extends _$LocalNoteCopyWithImpl<$Res, _$_LocalNote>
    implements _$$_LocalNoteCopyWith<$Res> {
  __$$_LocalNoteCopyWithImpl(
      _$_LocalNote _value, $Res Function(_$_LocalNote) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? text = null,
    Object? cloudId = freezed,
    Object? isSyncWithCloud = null,
    Object? isPrivate = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$_LocalNote(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      cloudId: freezed == cloudId
          ? _value.cloudId
          : cloudId // ignore: cast_nullable_to_non_nullable
              as String?,
      isSyncWithCloud: null == isSyncWithCloud
          ? _value.isSyncWithCloud
          : isSyncWithCloud // ignore: cast_nullable_to_non_nullable
              as bool,
      isPrivate: null == isPrivate
          ? _value.isPrivate
          : isPrivate // ignore: cast_nullable_to_non_nullable
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
class _$_LocalNote implements _LocalNote {
  const _$_LocalNote(
      {required this.id,
      required this.userId,
      required this.text,
      required this.cloudId,
      required this.isSyncWithCloud,
      required this.isPrivate,
      required this.createdAt,
      required this.updatedAt});

  factory _$_LocalNote.fromJson(Map<String, dynamic> json) =>
      _$$_LocalNoteFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final String text;
  @override
  final String? cloudId;
  @override
  final bool isSyncWithCloud;
  @override
  final bool isPrivate;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'LocalNote(id: $id, userId: $userId, text: $text, cloudId: $cloudId, isSyncWithCloud: $isSyncWithCloud, isPrivate: $isPrivate, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LocalNote &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.cloudId, cloudId) || other.cloudId == cloudId) &&
            (identical(other.isSyncWithCloud, isSyncWithCloud) ||
                other.isSyncWithCloud == isSyncWithCloud) &&
            (identical(other.isPrivate, isPrivate) ||
                other.isPrivate == isPrivate) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, userId, text, cloudId,
      isSyncWithCloud, isPrivate, createdAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LocalNoteCopyWith<_$_LocalNote> get copyWith =>
      __$$_LocalNoteCopyWithImpl<_$_LocalNote>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LocalNoteToJson(
      this,
    );
  }
}

abstract class _LocalNote implements LocalNote {
  const factory _LocalNote(
      {required final String id,
      required final String userId,
      required final String text,
      required final String? cloudId,
      required final bool isSyncWithCloud,
      required final bool isPrivate,
      required final DateTime createdAt,
      required final DateTime updatedAt}) = _$_LocalNote;

  factory _LocalNote.fromJson(Map<String, dynamic> json) =
      _$_LocalNote.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  String get text;
  @override
  String? get cloudId;
  @override
  bool get isSyncWithCloud;
  @override
  bool get isPrivate;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$_LocalNoteCopyWith<_$_LocalNote> get copyWith =>
      throw _privateConstructorUsedError;
}
