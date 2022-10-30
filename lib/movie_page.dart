import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'feature/bloc/movie_bloc.dart';

class MoviePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MovieBloc(),
      child: Scaffold(
        floatingActionButton: BlocBuilder<MovieBloc, MovieState>(
          builder: (context, state) {
            return FloatingActionButton(onPressed: () {
              context.read<MovieBloc>().add(MovieEvent.fetched('Spider'));
            });
          },
        ),
        body: BlocBuilder<MovieBloc, MovieState>(
          builder: (context, state) {
            return state.map(
              initial: (_) => Center(child: Text('initial')),
              loading: (_) => Center(child: CircularProgressIndicator()),
              loaded: (value) => ListView.builder(
                itemCount: value.movies.length,
                itemBuilder: (context, index) => ListTile(
                  leading: Text(index.toString()),
                  title: Text(value.movies[index].title),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
