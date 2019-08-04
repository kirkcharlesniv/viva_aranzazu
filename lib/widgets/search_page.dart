import 'package:flutter/material.dart';
import 'package:kiwi/kiwi.dart' as kiwi;
import 'package:viva_aranzazu/model/search.dart';
import 'package:viva_aranzazu/bloc/search/bloc.dart';
import 'package:viva_aranzazu/bloc/search/search_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:viva_aranzazu/widgets/search/centered_message.dart';
import 'package:viva_aranzazu/widgets/search/search_bar.dart';

class SearchPage extends StatefulWidget {
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _searchBloc = kiwi.Container().resolve<SearchBloc>();
  final _scrollController = ScrollController();

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
        title: SearchBar(),
      ),
      body: BlocBuilder(
        bloc: _searchBloc,
        builder: (context, SearchState state) {
          if (state.isInitial) {
            print('state initial');
            return CenteredMessage(
              message: 'Start searching!',
              icon: Icons.ondemand_video,
            );
          }

          if (state.isLoading) {
            print('state loading');
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state.isSuccessful) {
            print('state success');
            return _buildResultList(state);
          } else {
            print('state failed');
            return CenteredMessage(
              message: state.error,
              icon: Icons.error_outline,
            );
          }
        },
      ),
    );
  }

  Widget _buildResultList(SearchState state) {
    return NotificationListener<ScrollNotification>(
      onNotification: _handleScrollNotification,
      child: ListView.builder(
        itemCount: _calculateListItemCount(state),
        controller: _scrollController,
        itemBuilder: (context, index) {
//          return index >= state.searchResults.length
//              ? _buildLoaderListItem()
//              : _buildVideoListItem(state.searchResults[index]);
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
      _searchBloc.fetchNextResultPage();
    }
    return false;
  }

  Widget _buildVideoListItem(SearchItem searchItem) {
    return GestureDetector(
      child: _buildVideoListItemCard(searchItem),
      onTap: () {
        print('ah sarado');
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

  Widget _buildVideoListItemCard(SearchItem article) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Image.network(
                article.thumbnail,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 5),
            Text(
              article.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            SizedBox(height: 5),
            Text(
              article.excerpt,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoaderListItem() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
