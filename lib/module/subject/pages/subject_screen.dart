import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hamon_student_pro/module/subject/logic/subject_cubit.dart';
import 'package:hamon_student_pro/module/subject/pages/subject_body.dart';

class SubjectScreen extends StatelessWidget {
  const SubjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SubjectCubit(),
      child: const SubjectBody(),
    );
  }
}
