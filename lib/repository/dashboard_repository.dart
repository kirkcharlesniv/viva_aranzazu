import 'package:built_collection/built_collection.dart';
import 'package:viva_aranzazu/model/search.dart';
import 'package:viva_aranzazu/network/DashboardDataSource.dart';

class DashboardRepository {
  DashboardDataSource _dashboardDataSource;

  int _nextPage;

  DashboardRepository(this._dashboardDataSource);

  Future<BuiltList<SearchItem>> searchArticles(String query, int index) async {
    final searchResult =
        await _dashboardDataSource.browseDashboard(index: index);
    _cacheValues(nextPage: searchResult.next_page);
    if (searchResult.items.isEmpty) throw NoSearchResultsException();
    return searchResult.items;
  }

  void _cacheValues({int nextPage}) {
    _nextPage = nextPage;
  }

  Future<BuiltList<SearchItem>> fetchNextResultPage() async {
    if (_nextPage == null) {
      throw NoNextPageTokenException();
    }

    final nextPageSearchResult =
        await _dashboardDataSource.browseDashboard(index: _nextPage);

    _cacheValues(nextPage: nextPageSearchResult.next_page);

    return nextPageSearchResult.items;
  }
}

class NoSearchResultsException implements Exception {
  final message = 'No results';
}

class SearchNotInitiatedException implements Exception {
  final message = 'Cannot get the next result page without searching first.';
}

class NoNextPageTokenException implements Exception {}

class NoSuchVideoException implements Exception {
  final message = 'No such article exists';
}
