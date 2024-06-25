import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hamon_student_pro/module/classRooms/logic/room_cubit.dart';
import 'package:hamon_student_pro/module/classRooms/pages/room_list.dart';

import '../../../component/comonAppBar.dart';

class ClassroomBody extends StatefulWidget {
  const ClassroomBody({super.key});

  @override
  State<ClassroomBody> createState() => _ClassroomBodyState();
}

class _ClassroomBodyState extends State<ClassroomBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:const CommonAppBar(
        title: 'Class Rooms' ,
      ),
      body: BlocBuilder<RoomCubit, RoomState>(
        builder: (context, state) {
          if (state is RoomApiLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is RoomApiLoaded) {
            final roomList = state.listRoomResponse;
            if (roomList.isEmpty) {
              return const Center(
                  child: Text(
                    'No data available',
                    textAlign: TextAlign.center,
                  ));
            } else {
              return Expanded(
                  child: SafeArea(
                    child: Padding(
                      padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: roomList.length,
                        itemBuilder: (context, index) {
                          final details = roomList[index];
                          return RoomList(rooms: details);
                        },
                      ),
                    ),
                  ));
            }
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
