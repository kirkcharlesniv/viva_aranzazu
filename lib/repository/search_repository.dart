import 'package:built_collection/built_collection.dart';
import 'package:viva_aranzazu/model/search.dart';
import 'package:viva_aranzazu/network/SearchDataSource.dart';

class SearchRepository {
  SearchDataSource _searchDataSource;

  String _lastSearchQuery;
  int _nextPage;

  SearchRepository(this._searchDataSource);

  Future<BuiltList<SearchItem>> searchArticles(String query, int index) async {
    final searchResult =
        await _searchDataSource.searchArticles(query: query, index: index);
    _cacheValues(query: query, nextPage: searchResult.next_page);
    if (searchResult.items.isEmpty) throw NoSearchResultsException();
    return searchResult.items;
  }

  void _cacheValues({String query, int nextPage}) {
    _lastSearchQuery = query;
    _nextPage = nextPage;
  }

  Future<BuiltList<SearchItem>> fetchNextResultPage() async {
    if (_lastSearchQuery == null) {
      throw SearchNotInitiatedException();
    }

    if (_nextPage == null) {
      throw NoNextPageTokenException();
    }

    final nextPageSearchResult = await _searchDataSource.searchArticles(
        query: _lastSearchQuery, index: _nextPage);

    _cacheValues(
        query: _lastSearchQuery, nextPage: nextPageSearchResult.next_page);

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
