import 'package:kiwi/kiwi.dart' as kiwi;
import 'package:http/http.dart' as http;
import 'network/SearchDataSource.dart';
import 'repository/repository.dart';
import 'bloc/search/search_bloc.dart';

void initKiwi() {
  kiwi.Container()
    ..registerInstance(http.Client())
    ..registerFactory((c) => SearchDataSource(c.resolve()))
    ..registerFactory((c) => Repository(c.resolve()))
    ..registerFactory((c) => SearchBloc(c.resolve()));
}
