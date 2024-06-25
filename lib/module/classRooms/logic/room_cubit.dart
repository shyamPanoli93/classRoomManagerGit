import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:hamon_student_pro/module/classRooms/model/room_details_model.dart';
import 'package:hamon_student_pro/network/api.dart';
import 'package:meta/meta.dart';

import '../../../network/api_service.dart';

part 'room_state.dart';


class RoomCubit extends Cubit<RoomState> {
  RoomCubit() : super(RoomInitial()) {
    fetchRoomDetails();
  }

  Future<void> fetchRoomDetails() async {
    emit(RoomApiLoading());
    try {
      final data = await ApiService().get(getClassRooms());
      print("Response:---${data}");
      final roomDetails = RoomDetailsModel.fromJson(data);
      print("Results:---${roomDetails}");
      emit(RoomApiLoaded(listRoomResponse: roomDetails.classrooms));
    } catch (e) {
      print("Error:---$e");
      emit(RoomApiError(e.toString()));
    }
  }

}
