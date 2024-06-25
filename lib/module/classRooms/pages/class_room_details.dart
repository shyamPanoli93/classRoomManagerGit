import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hamon_student_pro/module/classRooms/logic/room_cubit.dart';
import 'package:hamon_student_pro/routes/routes.dart';
import 'package:hamon_student_pro/utils/assets.dart';
import 'package:hamon_student_pro/utils/common_model.dart';

import '../../../component/comonAppBar.dart';
import '../model/room_argument.dart';

class ClassRoomDetails extends StatefulWidget {
  const ClassRoomDetails({super.key});

  @override
  State<ClassRoomDetails> createState() => _ClassRoomDetailsState();
}

class _ClassRoomDetailsState extends State<ClassRoomDetails> {
  String selectedSubject = "";

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as CommonModel;
    return Scaffold(
      appBar: CommonAppBar(
        title: args.textTitle,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildAddSubject(context),
            _buildSeatArrange(),
            selectedSubject == "" ? Container() : _buildSubjectUpdate(context),
          ],
        ),
      ),
    );
  }

  Widget _buildAddSubject(BuildContext context) {
    return Container(
      width: 358,
      height: 66,
      decoration: BoxDecoration(
        color: const Color(0xffD1D1D1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 20),
            child: Text(
              selectedSubject == "" ? 'Add Subject' : selectedSubject,
              style: const TextStyle(
                fontSize: 17.0,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          GestureDetector(
            onTap: () async {
              final result = await Navigator.pushNamed(
                  context, Routes.subjectScreen,
                  arguments: RoomArgument(isSelection: true));
              if (result != null) {
                setState(() {
                  result as CommonModel;
                  selectedSubject = result.textTitle;
                  print("Selected:--${result.count}");
                });
              }
            },
            child: Container(
              width: 88,
              height: 39,
              margin: const EdgeInsets.only(right: 20),
              decoration: BoxDecoration(
                color: const Color(0xffAAC9BF),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Center(
                child: Text(
                  selectedSubject == "" ? 'Add ' : 'Change',
                  style: const TextStyle(
                    color: Color(0xff0FAB76),
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSeatArrange() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: List.generate(
            8,
            (index) {
              return Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: Image.asset(
                  sitting_left,
                  width: 30,
                  height: 30,
                ),
              );
            },
          ),
        ),
        Container(
          width: 142,
          height: 410,
          color: const Color(0xffD9D9D9),
        ),
        Column(
          children: List.generate(
            8,
            (index) {
              return Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: Image.asset(
                  sitting_right,
                  width: 30,
                  height: 30,
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildSubjectUpdate(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 358,
        height: 37,
        color: const Color(0xffAAC9BF),
        child: const Center(
          child: Text(
            'Subject Updated',
            style: TextStyle(
              color: Color(0xff0FAB76),
              fontSize: 20.0,
              fontWeight: FontWeight.w600,
              fontFamily: 'sf_display',
            ),
          ),
        ),
      ),
    );
  }
}
