part of 'room_cubit.dart';

@immutable
sealed class RoomState {}

class RoomInitial extends RoomState {}

class RoomApiLoading extends RoomState {
  RoomApiLoading();
}

class RoomApiLoaded extends RoomState {
  List<Classrooms> listRoomResponse;
  RoomApiLoaded({required this.listRoomResponse});
}

class RoomApiError extends RoomState {
  final String message;
  RoomApiError(this.message);
}

