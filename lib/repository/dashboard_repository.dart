import 'package:built_collection/built_collection.dart';
import 'package:viva_aranzazu/model/search.dart';
import 'package:viva_aranzazu/network/DashboardDataSource.dart';

class DashboardRepository {
  DashboardDataSource _dashboardDataSource;

  int _nextPage;

  DashboardRepository(this._dashboardDataSource);

  Future<BuiltList<SearchItem>> browseDashboard(int index) async {
    final result =
        await _dashboardDataSource.browseDashboard(index: index);
    _cacheValues(nextPage: result.next_page);
    if (result.items.isEmpty) throw NoDashboardResultsException();
    return result.items;
  }

  void _cacheValues({int nextPage}) {
    _nextPage = nextPage;
  }

  Future<BuiltList<SearchItem>> fetchNextPage() async {
    if (_nextPage == null) {
      throw NoNextPageTokenException();
    }

    final nextPageResult =
        await _dashboardDataSource.browseDashboard(index: _nextPage);

    _cacheValues(nextPage: nextPageResult.next_page);

    return nextPageResult.items;
  }
}

class NoDashboardResultsException implements Exception {
  final message = 'No results';
}

class BrowseNotInitiatedException implements Exception {
  final message = 'Cannot get the next result page without searching first.';
}

class NoNextPageTokenException implements Exception {}

class NoSuchVideoException implements Exception {
  final message = 'No such article exists';
}
