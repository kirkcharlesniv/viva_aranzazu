import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  @override
  DetailState get initialState => InitialDetailState();

  @override
  Stream<DetailState> mapEventToState(
    DetailEvent event,
  ) async* {
    // TODO: Add Logic
  }
}
