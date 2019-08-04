// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_event.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$DashboardInitiated extends DashboardInitiated {
  @override
  final int index;

  factory _$DashboardInitiated(
          [void Function(DashboardInitiatedBuilder) updates]) =>
      (new DashboardInitiatedBuilder()..update(updates)).build();

  _$DashboardInitiated._({this.index}) : super._() {
    if (index == null) {
      throw new BuiltValueNullFieldError('DashboardInitiated', 'index');
    }
  }

  @override
  DashboardInitiated rebuild(
          void Function(DashboardInitiatedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DashboardInitiatedBuilder toBuilder() =>
      new DashboardInitiatedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DashboardInitiated && index == other.index;
  }

  @override
  int get hashCode {
    return $jf($jc(0, index.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('DashboardInitiated')
          ..add('index', index))
        .toString();
  }
}

class DashboardInitiatedBuilder
    implements Builder<DashboardInitiated, DashboardInitiatedBuilder> {
  _$DashboardInitiated _$v;

  int _index;
  int get index => _$this._index;
  set index(int index) => _$this._index = index;

  DashboardInitiatedBuilder();

  DashboardInitiatedBuilder get _$this {
    if (_$v != null) {
      _index = _$v.index;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DashboardInitiated other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$DashboardInitiated;
  }

  @override
  void update(void Function(DashboardInitiatedBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$DashboardInitiated build() {
    final _$result = _$v ?? new _$DashboardInitiated._(index: index);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
