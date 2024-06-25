import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hamon_student_pro/module/student/logic/student_cubit.dart';
import 'package:hamon_student_pro/module/student/pages/student_body.dart';
import 'package:hamon_student_pro/utils/common_method.dart';

class StudentScreen extends StatelessWidget {
  const StudentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var args = getArgument(context);
    return BlocProvider(
      create: (context) => StudentCubit() ..setFormMode(args),
      child:const StudentBody(),
    );
  }
}
