// GENERATED CODE - DO NOT MODIFY BY HAND

part of SearchResult;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SearchResult> _$searchResultSerializer =
    new _$SearchResultSerializer();

class _$SearchResultSerializer implements StructuredSerializer<SearchResult> {
  @override
  final Iterable<Type> types = const [SearchResult, _$SearchResult];
  @override
  final String wireName = 'SearchResult';

  @override
  Iterable<Object> serialize(Serializers serializers, SearchResult object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.index != null) {
      result
        ..add('index')
        ..add(serializers.serialize(object.index,
            specifiedType: const FullType(int)));
    }
    if (object.next_page != null) {
      result
        ..add('next_page')
        ..add(serializers.serialize(object.next_page,
            specifiedType: const FullType(int)));
    }
    if (object.items != null) {
      result
        ..add('items')
        ..add(serializers.serialize(object.items,
            specifiedType:
                const FullType(BuiltList, const [const FullType(SearchItem)])));
    }
    return result;
  }

  @override
  SearchResult deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SearchResultBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'index':
          result.index = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'next_page':
          result.next_page = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'items':
          result.items.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(SearchItem)]))
              as BuiltList<dynamic>);
          break;
      }
    }

    return result.build();
  }
}

class _$SearchResult extends SearchResult {
  @override
  final int index;
  @override
  final int next_page;
  @override
  final BuiltList<SearchItem> items;

  factory _$SearchResult([void Function(SearchResultBuilder) updates]) =>
      (new SearchResultBuilder()..update(updates)).build();

  _$SearchResult._({this.index, this.next_page, this.items}) : super._();

  @override
  SearchResult rebuild(void Function(SearchResultBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SearchResultBuilder toBuilder() => new SearchResultBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SearchResult &&
        index == other.index &&
        next_page == other.next_page &&
        items == other.items;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, index.hashCode), next_page.hashCode), items.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SearchResult')
          ..add('index', index)
          ..add('next_page', next_page)
          ..add('items', items))
        .toString();
  }
}

class SearchResultBuilder
    implements Builder<SearchResult, SearchResultBuilder> {
  _$SearchResult _$v;

  int _index;
  int get index => _$this._index;
  set index(int index) => _$this._index = index;

  int _next_page;
  int get next_page => _$this._next_page;
  set next_page(int next_page) => _$this._next_page = next_page;

  ListBuilder<SearchItem> _items;
  ListBuilder<SearchItem> get items =>
      _$this._items ??= new ListBuilder<SearchItem>();
  set items(ListBuilder<SearchItem> items) => _$this._items = items;

  SearchResultBuilder();

  SearchResultBuilder get _$this {
    if (_$v != null) {
      _index = _$v.index;
      _next_page = _$v.next_page;
      _items = _$v.items?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SearchResult other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$SearchResult;
  }

  @override
  void update(void Function(SearchResultBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SearchResult build() {
    _$SearchResult _$result;
    try {
      _$result = _$v ??
          new _$SearchResult._(
              index: index, next_page: next_page, items: _items?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'items';
        _items?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'SearchResult', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
