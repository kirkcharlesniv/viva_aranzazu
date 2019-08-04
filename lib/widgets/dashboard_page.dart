import 'package:flutter/material.dart';
import 'package:kiwi/kiwi.dart' as kiwi;
import 'package:viva_aranzazu/bloc/search/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:viva_aranzazu/widgets/dashboard/image.dart';
import 'package:viva_aranzazu/widgets/dashboard/search_button.dart';
import 'package:viva_aranzazu/widgets/title_template.dart';

class DashboardPage extends StatefulWidget {
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final _searchBloc = kiwi.Container().resolve<SearchBloc>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      builder: (context) => _searchBloc,
      child: _buildScaffold(),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _searchBloc.dispose();
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
    )); // TODO: add body
  }
}
