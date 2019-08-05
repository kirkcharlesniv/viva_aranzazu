import 'package:kiwi/kiwi.dart' as kiwi;
import 'package:http/http.dart' as http;
import 'package:viva_aranzazu/repository/dashboard_repository.dart';
import 'bloc/dashboard/dashboard_bloc.dart';
import 'network/DashboardDataSource.dart';
import 'network/SearchDataSource.dart';
import 'repository/search_repository.dart';
import 'bloc/search/search_bloc.dart';

void initKiwi() {
  kiwi.Container()
    ..registerInstance(http.Client())
    ..registerFactory((c) => SearchDataSource(c.resolve()))
    ..registerFactory((c) => SearchRepository(c.resolve()))
    ..registerFactory((c) => SearchBloc(c.resolve()))
    ..registerFactory((c) => DashboardDataSource(c.resolve()))
    ..registerFactory((c) => DashboardRepository(c.resolve()))
    ..registerFactory((c) => DashboardBloc(c.resolve()));
}
