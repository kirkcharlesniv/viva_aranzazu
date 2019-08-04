// ignore: library_names
library SearchItem;

import 'dart:convert';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:viva_aranzazu/model/serializers.dart';

part 'SearchItem.g.dart';

abstract class SearchItem implements Built<SearchItem, SearchItemBuilder> {
  int get id;
  String get date;
  String get title;
  String get excerpt;
  String get authorName;
  String get authorImage;
  String get thumbnail;

  SearchItem._();

  factory SearchItem([updates(SearchItemBuilder b)]) = _$SearchItem;

  String toJson() {
    return json.encode(serializers.serializeWith(SearchItem.serializer, this));
  }

  static SearchItem fromJson(String jsonString) {
    return serializers.deserializeWith(
        SearchItem.serializer, json.decode(jsonString));
  }

  static Serializer<SearchItem> get serializer => _$searchItemSerializer;
}
