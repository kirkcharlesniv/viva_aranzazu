import 'package:flutter/material.dart';
import 'package:kiwi/kiwi.dart' as kiwi;
import 'package:viva_aranzazu/bloc/dashboard/bloc.dart';
import 'package:viva_aranzazu/bloc/search/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:viva_aranzazu/widgets/dashboard/data_dashboard.dart';
import 'package:viva_aranzazu/widgets/dashboard/image.dart';
import 'package:viva_aranzazu/widgets/dashboard/search_button.dart';
import 'package:viva_aranzazu/widgets/templates/AppBarTitle.dart';

class DashboardPage extends StatefulWidget {
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  void initState() {
    super.initState();
    _dashboardBloc.onSearchInitiated(1);
  }

  // BLOC 17 automatically supports dispose, but this is a test only.
  @override
  void dispose() {
    super.dispose();
    _dashboardBloc.dispose();
  }

  final _searchBloc = kiwi.Container().resolve<SearchBloc>();
  final _dashboardBloc = kiwi.Container().resolve<DashboardBloc>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      builder: (context) => _searchBloc,
      child: _buildScaffold(),
    );
  }

  Scaffold _buildScaffold() {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading: ProfileImage(),
        title: AppBarTitle('News'),
        actions: <Widget>[SearchButton(_searchBloc)],
      ),
      body: BlocProvider(
        builder: (context) => _dashboardBloc,
        child: _buildDashboard(),
      ),
    );
  }

  Column _buildDashboard() {
    return Column(
      children: <Widget>[
        Expanded(
          child: DataDashboard(_dashboardBloc),
        )
      ],
    );
  }
}
