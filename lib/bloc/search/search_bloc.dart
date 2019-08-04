import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';
import 'package:viva_aranzazu/model/search.dart';
import 'package:viva_aranzazu/repository/search_repository.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchRepository _repository;
  SearchBloc(this._repository) : super();

  void onSearchInitiated(String query, int index) {
    dispatch(SearchInitiated((b) => b
      ..query = query
      ..index = index));
  }

  void fetchNextResultPage() {
    dispatch(FetchNextResultPage());
  }

  @override
  SearchState get initialState => SearchState.initial();

  @override
  Stream<SearchState> mapEventToState(
    SearchEvent event,
  ) async* {
    if (event is SearchInitiated) {
      yield* mapSearchInitiated(event);
    } else if (event is FetchNextResultPage) {
      yield* mapFetchNextResultPage();
    }
  }

  Stream<SearchState> mapSearchInitiated(event) async* {
    if (event.query.isEmpty) {
      yield SearchState.initial();
    } else {
      yield SearchState.loading();

      try {
        final searchResult =
            await _repository.searchArticles(event.query, event.index);
        yield SearchState.success(searchResult);
      } on MessageError catch (e) {
        yield SearchState.failure(e.message);
      } on NoSearchResultsException catch (e) {
        yield SearchState.failure(e.message);
      }
    }
  }

  Stream<SearchState> mapFetchNextResultPage() async* {
    try {
      final nextPageResults = await _repository.fetchNextResultPage();
      yield SearchState.success(currentState.searchResults + nextPageResults);
    } on NoNextPageTokenException catch (_) {
      yield currentState.rebuild((b) => b..hasReachedEndOfResults = true);
    } on SearchNotInitiatedException catch (e) {
      yield SearchState.failure(e.message);
    } on MessageError catch (e) {
      yield SearchState.failure(e.message);
    }
  }
}
