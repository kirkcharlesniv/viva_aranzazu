// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$DashboardState extends DashboardState {
  @override
  final bool isLoading;
  @override
  final BuiltList<SearchItem> results;
  @override
  final String error;
  @override
  final bool hasReachedEndOfResults;

  factory _$DashboardState([void Function(DashboardStateBuilder) updates]) =>
      (new DashboardStateBuilder()..update(updates)).build();

  _$DashboardState._(
      {this.isLoading, this.results, this.error, this.hasReachedEndOfResults})
      : super._() {
    if (isLoading == null) {
      throw new BuiltValueNullFieldError('DashboardState', 'isLoading');
    }
    if (results == null) {
      throw new BuiltValueNullFieldError('DashboardState', 'results');
    }
    if (error == null) {
      throw new BuiltValueNullFieldError('DashboardState', 'error');
    }
    if (hasReachedEndOfResults == null) {
      throw new BuiltValueNullFieldError(
          'DashboardState', 'hasReachedEndOfResults');
    }
  }

  @override
  DashboardState rebuild(void Function(DashboardStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DashboardStateBuilder toBuilder() =>
      new DashboardStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DashboardState &&
        isLoading == other.isLoading &&
        results == other.results &&
        error == other.error &&
        hasReachedEndOfResults == other.hasReachedEndOfResults;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, isLoading.hashCode), results.hashCode), error.hashCode),
        hasReachedEndOfResults.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('DashboardState')
          ..add('isLoading', isLoading)
          ..add('results', results)
          ..add('error', error)
          ..add('hasReachedEndOfResults', hasReachedEndOfResults))
        .toString();
  }
}

class DashboardStateBuilder
    implements Builder<DashboardState, DashboardStateBuilder> {
  _$DashboardState _$v;

  bool _isLoading;
  bool get isLoading => _$this._isLoading;
  set isLoading(bool isLoading) => _$this._isLoading = isLoading;

  ListBuilder<SearchItem> _results;
  ListBuilder<SearchItem> get results =>
      _$this._results ??= new ListBuilder<SearchItem>();
  set results(ListBuilder<SearchItem> results) => _$this._results = results;

  String _error;
  String get error => _$this._error;
  set error(String error) => _$this._error = error;

  bool _hasReachedEndOfResults;
  bool get hasReachedEndOfResults => _$this._hasReachedEndOfResults;
  set hasReachedEndOfResults(bool hasReachedEndOfResults) =>
      _$this._hasReachedEndOfResults = hasReachedEndOfResults;

  DashboardStateBuilder();

  DashboardStateBuilder get _$this {
    if (_$v != null) {
      _isLoading = _$v.isLoading;
      _results = _$v.results?.toBuilder();
      _error = _$v.error;
      _hasReachedEndOfResults = _$v.hasReachedEndOfResults;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DashboardState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$DashboardState;
  }

  @override
  void update(void Function(DashboardStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$DashboardState build() {
    _$DashboardState _$result;
    try {
      _$result = _$v ??
          new _$DashboardState._(
              isLoading: isLoading,
              results: results.build(),
              error: error,
              hasReachedEndOfResults: hasReachedEndOfResults);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'results';
        results.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'DashboardState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
