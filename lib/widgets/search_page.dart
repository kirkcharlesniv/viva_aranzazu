import 'package:flutter/material.dart';
import 'package:kiwi/kiwi.dart' as kiwi;
import 'package:viva_aranzazu/model/search.dart';
import 'package:viva_aranzazu/bloc/search/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:viva_aranzazu/widgets/search/centered_message.dart';
import 'package:viva_aranzazu/widgets/search/ListItemCard.dart';

class SearchPage extends StatefulWidget {
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
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
//        title: SearchBar(),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {
            showSearch(context: context, delegate: DataSearch(_searchBloc));
          },
        )
      ],
    ));
  }
}

class DataSearch extends SearchDelegate<String> {
  final _scrollController = ScrollController();
  final SearchBloc searchBloc;
  DataSearch(this.searchBloc);

  final recentSearches = [];
  final searches = ["Aranzazu", "Canonical", "Episcopal"];
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
            icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    searchBloc.onSearchInitiated(query, 1);
    return BlocBuilder(
      bloc: searchBloc,
      builder: (BuildContext context, SearchState state) {
        if (state.isInitial) {
          return CenteredMessage(
            message: 'Start searching!',
            icon: Icons.ondemand_video,
          );
        }

        if (state.isLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state.isSuccessful) {
          return _buildResultList(state);
        } else {
          return CenteredMessage(
            message: state.error,
            icon: Icons.error_outline,
          );
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? recentSearches
        : searches.where((p) => p.startsWith(query)).toList();
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          showResults(context);
        },
        leading: Icon(Icons.search),
        title: RichText(
            text: TextSpan(
                text: suggestionList[index].substring(0, query.length),
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                children: [
              TextSpan(
                  text: suggestionList[index].substring(query.length),
                  style: TextStyle(color: Colors.grey))
            ])),
      ),
      itemCount: suggestionList.length,
    );
  }

  Widget _buildResultList(SearchState state) {
    return NotificationListener<ScrollNotification>(
      onNotification: _handleScrollNotification,
      child: ListView.builder(
        itemCount: _calculateListItemCount(state),
        controller: _scrollController,
        itemBuilder: (context, index) {
          return index >= state.searchResults.length
              ? (state.searchResults.length < 10
                  ? null
                  : _buildLoaderListItem())
              : _buildVideoListItem(state.searchResults[index]);
        },
      ),
    );
  }

  int _calculateListItemCount(SearchState state) {
    if (state.hasReachedEndOfResults) {
      return state.searchResults.length;
    } else {
      return state.searchResults.length + 1;
    }
  }

  bool _handleScrollNotification(ScrollNotification notification) {
    if (notification is ScrollEndNotification &&
        _scrollController.position.extentAfter == 0) {
      searchBloc.fetchNextResultPage();
    }
    return false;
  }

  Widget _buildVideoListItem(SearchItem searchItem) {
    return GestureDetector(
      child: ListItemCard(searchItem),
      onTap: () {
        // TODO: add detail view
//        Navigator.push(
//          context,
//          MaterialPageRoute(builder: (_) {
//            return DetailPage(
//              videoId: searchItem.id.videoId,
//            );
//          }),
//        );
      },
    );
  }

  Widget _buildLoaderListItem() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
