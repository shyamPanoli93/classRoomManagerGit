import 'package:flutter/material.dart';
import 'package:hamon_student_pro/module/classRooms/model/room_details_model.dart';

import '../../../component/custom_card.dart';
import '../../../routes/routes.dart';
import '../../../utils/common_model.dart';

class RoomList extends StatelessWidget {
  final Classrooms rooms;
  const RoomList({super.key,required this.rooms});

  @override
  Widget build(BuildContext context) {
    CommonModel dataModel = CommonModel(
      textTitle: rooms.name,
      textSubTitle: rooms.layout,
      count: rooms.size,
      textLabel: 'Seats',
    );
    return CustomCard(
      model: dataModel,
      onTap: () => Navigator.pushNamed(
          context, Routes.classRoomDetailScreen,
          arguments: dataModel),
    );
  }
}
