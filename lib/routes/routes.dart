import 'package:flutter/material.dart';
import 'package:hamon_student_pro/module/classRooms/pages/class_room_details.dart';
import 'package:hamon_student_pro/module/classRooms/pages/classroom_screen.dart';
import 'package:hamon_student_pro/module/registration/pages/new_registration_form.dart';
import 'package:hamon_student_pro/module/registration/pages/registration_screen.dart';
import 'package:hamon_student_pro/module/student/pages/student_screen.dart';
import 'package:hamon_student_pro/module/student/pages/student_single_details.dart';
import 'package:hamon_student_pro/module/subject/pages/single_subject_details_screen.dart';
import 'package:hamon_student_pro/module/subject/pages/subject_screen.dart';

import '../module/home/pages/home_screen.dart';

final Map<String, WidgetBuilder> routes = {
  Routes.homeScreen: (context) => const HomeScreen(),
  Routes.studentScreen: (context) => const StudentScreen(),
  Routes.subjectScreen: (context) => const SubjectScreen(),
  Routes.classRoomScreen: (context) => const ClassroomScreen(),
  Routes.registrationScreen: (context) => const RegistrationScreen(),
  Routes.singleDetailsScreen: (context) => const StudentSingleDetails(),
  Routes.singleSubjectDetailsScreen: (context) => const SingleSubjectDetailsScreen(),
  Routes.classRoomDetailScreen: (context) => const ClassRoomDetails(),
  Routes.newRegistrationForm: (context) => const NewRegistrationForm(),
};

class Routes {
  static const String homeScreen = '/homeScreen';
  static const String studentScreen = '/studentScreen';
  static const String subjectScreen = '/subjectScreen';
  static const String registrationScreen = '/registrationScreen';
  static const String classRoomScreen = '/classRoomScreen';
  static const String singleDetailsScreen = '/singleDetailsScreen';
  static const String singleSubjectDetailsScreen = '/singleSubjectDetailsScreen';
  static const String classRoomDetailScreen = '/classRoomDetailScreen';
  static const String newRegistrationForm = '/newRegistrationForm';
}
