import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hamon_student_pro/module/classRooms/logic/room_cubit.dart';
import 'package:hamon_student_pro/module/classRooms/pages/classRoom_body.dart';

class ClassroomScreen extends StatelessWidget {
  const ClassroomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RoomCubit(),
      child: const ClassroomBody(),
    );
  }
}
