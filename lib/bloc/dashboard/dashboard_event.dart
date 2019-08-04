import 'package:built_value/built_value.dart';
part 'dashboard_event.g.dart';

abstract class DashboardEvent {}

abstract class DashboardInitiated extends DashboardEvent
    implements Built<DashboardInitiated, DashboardInitiatedBuilder> {
  int get index;

  DashboardInitiated._();

  factory DashboardInitiated([updates(DashboardInitiatedBuilder b)]) =
      _$DashboardInitiated;
}

class FetchNextResultPage extends DashboardEvent {}
