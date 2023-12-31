// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'm_note_inputs.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CreateNoteInput {
  String get noteId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;
  bool get isSyncWithCloud => throw _privateConstructorUsedError;
  bool get isPrivate => throw _privateConstructorUsedError;
  bool get isFavorite => throw _privateConstructorUsedError;
  String? get userId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CreateNoteInputCopyWith<CreateNoteInput> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateNoteInputCopyWith<$Res> {
  factory $CreateNoteInputCopyWith(
          CreateNoteInput value, $Res Function(CreateNoteInput) then) =
      _$CreateNoteInputCopyWithImpl<$Res, CreateNoteInput>;
  @useResult
  $Res call(
      {String noteId,
      String title,
      String text,
      bool isSyncWithCloud,
      bool isPrivate,
      bool isFavorite,
      String? userId});
}

/// @nodoc
class _$CreateNoteInputCopyWithImpl<$Res, $Val extends CreateNoteInput>
    implements $CreateNoteInputCopyWith<$Res> {
  _$CreateNoteInputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? noteId = null,
    Object? title = null,
    Object? text = null,
    Object? isSyncWithCloud = null,
    Object? isPrivate = null,
    Object? isFavorite = null,
    Object? userId = freezed,
  }) {
    return _then(_value.copyWith(
      noteId: null == noteId
          ? _value.noteId
          : noteId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      isSyncWithCloud: null == isSyncWithCloud
          ? _value.isSyncWithCloud
          : isSyncWithCloud // ignore: cast_nullable_to_non_nullable
              as bool,
      isPrivate: null == isPrivate
          ? _value.isPrivate
          : isPrivate // ignore: cast_nullable_to_non_nullable
              as bool,
      isFavorite: null == isFavorite
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateNoteInputImplCopyWith<$Res>
    implements $CreateNoteInputCopyWith<$Res> {
  factory _$$CreateNoteInputImplCopyWith(_$CreateNoteInputImpl value,
          $Res Function(_$CreateNoteInputImpl) then) =
      __$$CreateNoteInputImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String noteId,
      String title,
      String text,
      bool isSyncWithCloud,
      bool isPrivate,
      bool isFavorite,
      String? userId});
}

/// @nodoc
class __$$CreateNoteInputImplCopyWithImpl<$Res>
    extends _$CreateNoteInputCopyWithImpl<$Res, _$CreateNoteInputImpl>
    implements _$$CreateNoteInputImplCopyWith<$Res> {
  __$$CreateNoteInputImplCopyWithImpl(
      _$CreateNoteInputImpl _value, $Res Function(_$CreateNoteInputImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? noteId = null,
    Object? title = null,
    Object? text = null,
    Object? isSyncWithCloud = null,
    Object? isPrivate = null,
    Object? isFavorite = null,
    Object? userId = freezed,
  }) {
    return _then(_$CreateNoteInputImpl(
      noteId: null == noteId
          ? _value.noteId
          : noteId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      isSyncWithCloud: null == isSyncWithCloud
          ? _value.isSyncWithCloud
          : isSyncWithCloud // ignore: cast_nullable_to_non_nullable
              as bool,
      isPrivate: null == isPrivate
          ? _value.isPrivate
          : isPrivate // ignore: cast_nullable_to_non_nullable
              as bool,
      isFavorite: null == isFavorite
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$CreateNoteInputImpl implements _CreateNoteInput {
  const _$CreateNoteInputImpl(
      {required this.noteId,
      required this.title,
      required this.text,
      required this.isSyncWithCloud,
      required this.isPrivate,
      required this.isFavorite,
      required this.userId});

  @override
  final String noteId;
  @override
  final String title;
  @override
  final String text;
  @override
  final bool isSyncWithCloud;
  @override
  final bool isPrivate;
  @override
  final bool isFavorite;
  @override
  final String? userId;

  @override
  String toString() {
    return 'CreateNoteInput(noteId: $noteId, title: $title, text: $text, isSyncWithCloud: $isSyncWithCloud, isPrivate: $isPrivate, isFavorite: $isFavorite, userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateNoteInputImpl &&
            (identical(other.noteId, noteId) || other.noteId == noteId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.isSyncWithCloud, isSyncWithCloud) ||
                other.isSyncWithCloud == isSyncWithCloud) &&
            (identical(other.isPrivate, isPrivate) ||
                other.isPrivate == isPrivate) &&
            (identical(other.isFavorite, isFavorite) ||
                other.isFavorite == isFavorite) &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, noteId, title, text,
      isSyncWithCloud, isPrivate, isFavorite, userId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateNoteInputImplCopyWith<_$CreateNoteInputImpl> get copyWith =>
      __$$CreateNoteInputImplCopyWithImpl<_$CreateNoteInputImpl>(
          this, _$identity);
}

abstract class _CreateNoteInput implements CreateNoteInput {
  const factory _CreateNoteInput(
      {required final String noteId,
      required final String title,
      required final String text,
      required final bool isSyncWithCloud,
      required final bool isPrivate,
      required final bool isFavorite,
      required final String? userId}) = _$CreateNoteInputImpl;

  @override
  String get noteId;
  @override
  String get title;
  @override
  String get text;
  @override
  bool get isSyncWithCloud;
  @override
  bool get isPrivate;
  @override
  bool get isFavorite;
  @override
  String? get userId;
  @override
  @JsonKey(ignore: true)
  _$$CreateNoteInputImplCopyWith<_$CreateNoteInputImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$UpdateNoteInput {
  String get noteId => throw _privateConstructorUsedError;
  String? get userId => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  bool get isSyncWithCloud => throw _privateConstructorUsedError;
  bool get isPrivate => throw _privateConstructorUsedError;
  bool get isFavorite => throw _privateConstructorUsedError;
  bool get isTrash => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UpdateNoteInputCopyWith<UpdateNoteInput> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateNoteInputCopyWith<$Res> {
  factory $UpdateNoteInputCopyWith(
          UpdateNoteInput value, $Res Function(UpdateNoteInput) then) =
      _$UpdateNoteInputCopyWithImpl<$Res, UpdateNoteInput>;
  @useResult
  $Res call(
      {String noteId,
      String? userId,
      String text,
      String title,
      bool isSyncWithCloud,
      bool isPrivate,
      bool isFavorite,
      bool isTrash});
}

/// @nodoc
class _$UpdateNoteInputCopyWithImpl<$Res, $Val extends UpdateNoteInput>
    implements $UpdateNoteInputCopyWith<$Res> {
  _$UpdateNoteInputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? noteId = null,
    Object? userId = freezed,
    Object? text = null,
    Object? title = null,
    Object? isSyncWithCloud = null,
    Object? isPrivate = null,
    Object? isFavorite = null,
    Object? isTrash = null,
  }) {
    return _then(_value.copyWith(
      noteId: null == noteId
          ? _value.noteId
          : noteId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      isSyncWithCloud: null == isSyncWithCloud
          ? _value.isSyncWithCloud
          : isSyncWithCloud // ignore: cast_nullable_to_non_nullable
              as bool,
      isPrivate: null == isPrivate
          ? _value.isPrivate
          : isPrivate // ignore: cast_nullable_to_non_nullable
              as bool,
      isFavorite: null == isFavorite
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool,
      isTrash: null == isTrash
          ? _value.isTrash
          : isTrash // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UpdateNoteInputImplCopyWith<$Res>
    implements $UpdateNoteInputCopyWith<$Res> {
  factory _$$UpdateNoteInputImplCopyWith(_$UpdateNoteInputImpl value,
          $Res Function(_$UpdateNoteInputImpl) then) =
      __$$UpdateNoteInputImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String noteId,
      String? userId,
      String text,
      String title,
      bool isSyncWithCloud,
      bool isPrivate,
      bool isFavorite,
      bool isTrash});
}

/// @nodoc
class __$$UpdateNoteInputImplCopyWithImpl<$Res>
    extends _$UpdateNoteInputCopyWithImpl<$Res, _$UpdateNoteInputImpl>
    implements _$$UpdateNoteInputImplCopyWith<$Res> {
  __$$UpdateNoteInputImplCopyWithImpl(
      _$UpdateNoteInputImpl _value, $Res Function(_$UpdateNoteInputImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? noteId = null,
    Object? userId = freezed,
    Object? text = null,
    Object? title = null,
    Object? isSyncWithCloud = null,
    Object? isPrivate = null,
    Object? isFavorite = null,
    Object? isTrash = null,
  }) {
    return _then(_$UpdateNoteInputImpl(
      noteId: null == noteId
          ? _value.noteId
          : noteId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      isSyncWithCloud: null == isSyncWithCloud
          ? _value.isSyncWithCloud
          : isSyncWithCloud // ignore: cast_nullable_to_non_nullable
              as bool,
      isPrivate: null == isPrivate
          ? _value.isPrivate
          : isPrivate // ignore: cast_nullable_to_non_nullable
              as bool,
      isFavorite: null == isFavorite
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool,
      isTrash: null == isTrash
          ? _value.isTrash
          : isTrash // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$UpdateNoteInputImpl implements _UpdateNoteInput {
  const _$UpdateNoteInputImpl(
      {required this.noteId,
      required this.userId,
      required this.text,
      required this.title,
      required this.isSyncWithCloud,
      required this.isPrivate,
      required this.isFavorite,
      required this.isTrash});

  @override
  final String noteId;
  @override
  final String? userId;
  @override
  final String text;
  @override
  final String title;
  @override
  final bool isSyncWithCloud;
  @override
  final bool isPrivate;
  @override
  final bool isFavorite;
  @override
  final bool isTrash;

  @override
  String toString() {
    return 'UpdateNoteInput(noteId: $noteId, userId: $userId, text: $text, title: $title, isSyncWithCloud: $isSyncWithCloud, isPrivate: $isPrivate, isFavorite: $isFavorite, isTrash: $isTrash)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateNoteInputImpl &&
            (identical(other.noteId, noteId) || other.noteId == noteId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.isSyncWithCloud, isSyncWithCloud) ||
                other.isSyncWithCloud == isSyncWithCloud) &&
            (identical(other.isPrivate, isPrivate) ||
                other.isPrivate == isPrivate) &&
            (identical(other.isFavorite, isFavorite) ||
                other.isFavorite == isFavorite) &&
            (identical(other.isTrash, isTrash) || other.isTrash == isTrash));
  }

  @override
  int get hashCode => Object.hash(runtimeType, noteId, userId, text, title,
      isSyncWithCloud, isPrivate, isFavorite, isTrash);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateNoteInputImplCopyWith<_$UpdateNoteInputImpl> get copyWith =>
      __$$UpdateNoteInputImplCopyWithImpl<_$UpdateNoteInputImpl>(
          this, _$identity);
}

abstract class _UpdateNoteInput implements UpdateNoteInput {
  const factory _UpdateNoteInput(
      {required final String noteId,
      required final String? userId,
      required final String text,
      required final String title,
      required final bool isSyncWithCloud,
      required final bool isPrivate,
      required final bool isFavorite,
      required final bool isTrash}) = _$UpdateNoteInputImpl;

  @override
  String get noteId;
  @override
  String? get userId;
  @override
  String get text;
  @override
  String get title;
  @override
  bool get isSyncWithCloud;
  @override
  bool get isPrivate;
  @override
  bool get isFavorite;
  @override
  bool get isTrash;
  @override
  @JsonKey(ignore: true)
  _$$UpdateNoteInputImplCopyWith<_$UpdateNoteInputImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
