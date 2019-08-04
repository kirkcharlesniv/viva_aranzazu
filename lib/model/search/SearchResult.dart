// ignore: library_names
library SearchResult;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:viva_aranzazu/model/search/SearchItem.dart';
import 'package:viva_aranzazu/model/serializers.dart';

part 'SearchResult.g.dart';

abstract class SearchResult
    implements Built<SearchResult, SearchResultBuilder> {
  @nullable
  int get index;
  @nullable
  // ignore: non_constant_identifier_names
  int get next_page;
  @nullable
  BuiltList<SearchItem> get items;

  SearchResult._();

  factory SearchResult([updates(SearchResultBuilder b)]) = _$SearchResult;

  String toJson() {
    return json
        .encode(serializers.serializeWith(SearchResult.serializer, this));
  }

  static SearchResult fromJson(String jsonString) {
    return serializers.deserializeWith(
        SearchResult.serializer, json.decode(jsonString));
  }

  static Serializer<SearchResult> get serializer => _$searchResultSerializer;
}
