part of 'tracks_bloc.dart';

abstract class TracksState {
  const TracksState();
}

class TracksInitial extends TracksState implements Loadable {}

class TracksSuccessState extends TracksState {
  Album album;
  TracksSuccessState(this.album);
}
