import 'package:flutter/cupertino.dart';
import 'package:hamon_student_pro/module/classRooms/model/room_argument.dart';
import 'package:hamon_student_pro/module/student/model/screen_arguments.dart';

import '../module/subject/model/subject_arguments.dart';

void navigator(BuildContext context, String route) {
  Navigator.pushNamed(context, route);
}

void navigatorReplacement(BuildContext context, String route) {
  Navigator.pushReplacementNamed(context, route);
}

RoomArgument? getArgument(BuildContext context) {
  final mod = ModalRoute.of(context);
  RoomArgument? args;
  if (mod?.settings.arguments != null) {
    args = mod?.settings.arguments as RoomArgument;
  }
  return args;
}

SubjectArguments? getSubjectArgument(BuildContext context) {
  final mod = ModalRoute.of(context);
  SubjectArguments? args;
  if (mod?.settings.arguments != null) {
    args = mod?.settings.arguments as SubjectArguments;
  }
  return args;
}

ScreenArguments? getStudentArgument(BuildContext context) {
  final mod = ModalRoute.of(context);
  ScreenArguments? args;
  if (mod?.settings.arguments != null) {
    args = mod?.settings.arguments as ScreenArguments;
  }
  return args;
}