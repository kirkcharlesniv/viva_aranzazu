// GENERATED CODE - DO NOT MODIFY BY HAND

part of SearchItem;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SearchItem> _$searchItemSerializer = new _$SearchItemSerializer();

class _$SearchItemSerializer implements StructuredSerializer<SearchItem> {
  @override
  final Iterable<Type> types = const [SearchItem, _$SearchItem];
  @override
  final String wireName = 'SearchItem';

  @override
  Iterable<Object> serialize(Serializers serializers, SearchItem object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'date',
      serializers.serialize(object.date, specifiedType: const FullType(String)),
      'title',
      serializers.serialize(object.title,
          specifiedType: const FullType(String)),
      'excerpt',
      serializers.serialize(object.excerpt,
          specifiedType: const FullType(String)),
      'authorName',
      serializers.serialize(object.authorName,
          specifiedType: const FullType(String)),
      'authorImage',
      serializers.serialize(object.authorImage,
          specifiedType: const FullType(String)),
      'thumbnail',
      serializers.serialize(object.thumbnail,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  SearchItem deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SearchItemBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'date':
          result.date = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'excerpt':
          result.excerpt = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'authorName':
          result.authorName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'authorImage':
          result.authorImage = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'thumbnail':
          result.thumbnail = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$SearchItem extends SearchItem {
  @override
  final int id;
  @override
  final String date;
  @override
  final String title;
  @override
  final String excerpt;
  @override
  final String authorName;
  @override
  final String authorImage;
  @override
  final String thumbnail;

  factory _$SearchItem([void Function(SearchItemBuilder) updates]) =>
      (new SearchItemBuilder()..update(updates)).build();

  _$SearchItem._(
      {this.id,
      this.date,
      this.title,
      this.excerpt,
      this.authorName,
      this.authorImage,
      this.thumbnail})
      : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('SearchItem', 'id');
    }
    if (date == null) {
      throw new BuiltValueNullFieldError('SearchItem', 'date');
    }
    if (title == null) {
      throw new BuiltValueNullFieldError('SearchItem', 'title');
    }
    if (excerpt == null) {
      throw new BuiltValueNullFieldError('SearchItem', 'excerpt');
    }
    if (authorName == null) {
      throw new BuiltValueNullFieldError('SearchItem', 'authorName');
    }
    if (authorImage == null) {
      throw new BuiltValueNullFieldError('SearchItem', 'authorImage');
    }
    if (thumbnail == null) {
      throw new BuiltValueNullFieldError('SearchItem', 'thumbnail');
    }
  }

  @override
  SearchItem rebuild(void Function(SearchItemBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SearchItemBuilder toBuilder() => new SearchItemBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SearchItem &&
        id == other.id &&
        date == other.date &&
        title == other.title &&
        excerpt == other.excerpt &&
        authorName == other.authorName &&
        authorImage == other.authorImage &&
        thumbnail == other.thumbnail;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, id.hashCode), date.hashCode),
                        title.hashCode),
                    excerpt.hashCode),
                authorName.hashCode),
            authorImage.hashCode),
        thumbnail.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SearchItem')
          ..add('id', id)
          ..add('date', date)
          ..add('title', title)
          ..add('excerpt', excerpt)
          ..add('authorName', authorName)
          ..add('authorImage', authorImage)
          ..add('thumbnail', thumbnail))
        .toString();
  }
}

class SearchItemBuilder implements Builder<SearchItem, SearchItemBuilder> {
  _$SearchItem _$v;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  String _date;
  String get date => _$this._date;
  set date(String date) => _$this._date = date;

  String _title;
  String get title => _$this._title;
  set title(String title) => _$this._title = title;

  String _excerpt;
  String get excerpt => _$this._excerpt;
  set excerpt(String excerpt) => _$this._excerpt = excerpt;

  String _authorName;
  String get authorName => _$this._authorName;
  set authorName(String authorName) => _$this._authorName = authorName;

  String _authorImage;
  String get authorImage => _$this._authorImage;
  set authorImage(String authorImage) => _$this._authorImage = authorImage;

  String _thumbnail;
  String get thumbnail => _$this._thumbnail;
  set thumbnail(String thumbnail) => _$this._thumbnail = thumbnail;

  SearchItemBuilder();

  SearchItemBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _date = _$v.date;
      _title = _$v.title;
      _excerpt = _$v.excerpt;
      _authorName = _$v.authorName;
      _authorImage = _$v.authorImage;
      _thumbnail = _$v.thumbnail;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SearchItem other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$SearchItem;
  }

  @override
  void update(void Function(SearchItemBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SearchItem build() {
    final _$result = _$v ??
        new _$SearchItem._(
            id: id,
            date: date,
            title: title,
            excerpt: excerpt,
            authorName: authorName,
            authorImage: authorImage,
            thumbnail: thumbnail);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
