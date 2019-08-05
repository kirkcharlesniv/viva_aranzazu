import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:viva_aranzazu/bloc/dashboard/bloc.dart';
import 'package:viva_aranzazu/model/search/SearchItem.dart';
import 'package:viva_aranzazu/widgets/search/centered_message.dart';
import 'package:viva_aranzazu/widgets/templates/ListItemCard.dart';

class DataDashboard extends StatelessWidget {
  final _scrollController = ScrollController();
  final DashboardBloc dashboardBloc;
  DataDashboard(this.dashboardBloc);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: dashboardBloc,
        builder: (BuildContext context, DashboardState state) {
          if (state.isInitial) {
            return CenteredMessage(
              message: 'Gathering data...',
              icon: Icons.ondemand_video,
            );
          }

          if (state.isLoading) {
            print(state);
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
        });
  }

  Widget _buildResultList(DashboardState state) {
    return NotificationListener<ScrollNotification>(
      onNotification: _handleScrollNotification,
      child: ListView.builder(
        itemCount: _calculateListItemCount(state),
        controller: _scrollController,
        itemBuilder: (context, index) {
          return index >= state.items.length
              ? (state.items.length < 10 ? null : _buildLoaderListItem())
              : _buildVideoListItem(state.items[index]);
        },
      ),
    );
  }

  int _calculateListItemCount(DashboardState state) {
    if (state.hasReachedEndOfResults) {
      return state.items.length;
    } else {
      return state.items.length + 1;
    }
  }

  bool _handleScrollNotification(ScrollNotification notification) {
    if (notification is ScrollEndNotification &&
        _scrollController.position.extentAfter == 0) {
      dashboardBloc.fetchNextResultPage();
    }
    return false;
  }

  Widget _buildVideoListItem(SearchItem searchItem) {
    return GestureDetector(
      child: ListItemCard(searchItem),
      onTap: () {
        // TODO: add detail view\
      },
    );
  }

  Widget _buildLoaderListItem() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
