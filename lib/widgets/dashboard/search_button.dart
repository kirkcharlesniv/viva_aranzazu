import 'package:flutter/material.dart';
import 'package:viva_aranzazu/bloc/search/search_bloc.dart';
import 'package:viva_aranzazu/widgets/dashboard/data_search.dart';

class SearchButton extends StatelessWidget {
  SearchBloc _searchBloc;
  SearchButton(this._searchBloc);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Icon(
          Icons.search,
          color: Colors.grey,
        ),
        onPressed: () {
          showSearch(context: context, delegate: DataSearch(_searchBloc));
        });
  }
}
