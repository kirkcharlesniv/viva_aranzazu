import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';
import 'package:viva_aranzazu/model/search.dart';
import 'package:viva_aranzazu/repository/dashboard_repository.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final DashboardRepository _repository;
  DashboardBloc(this._repository) : super();

  void onSearchInitiated(int index) {
    dispatch(DashboardInitiated((b) => b..index = index));
  }

  void fetchNextResultPage() {
    dispatch(FetchNextResultPage());
  }

  @override
  DashboardState get initialState => DashboardState.initial();

  @override
  Stream<DashboardState> mapEventToState(
    DashboardEvent event,
  ) async* {
    if (event is DashboardInitiated) {
      yield* mapSearchInitiated(event);
    } else if (event is FetchNextResultPage) {
      yield* mapFetchNextResultPage();
    }
  }

  Stream<DashboardState> mapSearchInitiated(event) async* {
    yield DashboardState.loading();

    try {
      final searchResult = await _repository.browseDashboard(event.index);
      yield DashboardState.success(searchResult);
    } on MessageError catch (e) {
      yield DashboardState.failure(e.message);
    } on NoDashboardResultsException catch (e) {
      yield DashboardState.failure(e.message);
    }
  }

  Stream<DashboardState> mapFetchNextResultPage() async* {
    try {
      final nextPageResults = await _repository.fetchNextPage();
      yield DashboardState.success(currentState.results + nextPageResults);
    } on NoNextPageTokenException catch (_) {
      yield currentState.rebuild((b) => b..hasReachedEndOfResults = true);
    } on BrowseNotInitiatedException catch (e) {
      yield DashboardState.failure(e.message);
    } on MessageError catch (e) {
      yield DashboardState.failure(e.message);
    }
  }
}
