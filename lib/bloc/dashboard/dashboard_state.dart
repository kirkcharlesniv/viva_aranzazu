import 'package:viva_aranzazu/model/search.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:viva_aranzazu/model/search/SearchItem.dart';

part 'dashboard_state.g.dart';

abstract class DashboardState
    implements Built<DashboardState, DashboardStateBuilder> {
  bool get isLoading;
  BuiltList<SearchItem> get searchResults;
  String get error;
  bool get hasReachedEndOfResults;

  bool get isInitial => !isLoading && searchResults.isEmpty && error == '';
  bool get isSuccessful =>
      !isLoading && searchResults.isNotEmpty && error == '';

  DashboardState._();

  factory DashboardState([updates(DashboardStateBuilder b)]) = _$DashboardState;

  factory DashboardState.initial() {
    return DashboardState((b) => b
      ..isLoading = false
      ..searchResults.replace(BuiltList<SearchItem>())
      ..error = ''
      ..hasReachedEndOfResults = false);
  }

  factory DashboardState.loading() {
    return DashboardState((b) => b
      ..isLoading = true
      ..searchResults.replace(BuiltList<SearchItem>())
      ..error = ''
      ..hasReachedEndOfResults = false);
  }

  factory DashboardState.failure(String error) {
    return DashboardState((b) => b
      ..isLoading = false
      ..searchResults.replace(BuiltList<SearchItem>())
      ..error = error
      ..hasReachedEndOfResults = false);
  }

  factory DashboardState.success(BuiltList<SearchItem> resultList) {
    return DashboardState((b) => b
      ..isLoading = false
      ..searchResults.replace(resultList)
      ..error = ''
      ..hasReachedEndOfResults = false);
  }
}
