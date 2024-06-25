import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hamon_student_pro/module/registration/logic/registartion_cubit.dart';
import 'package:hamon_student_pro/module/registration/pages/registration_body.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegistartionCubit(),
      child:const RegistrationBody(),
    );
  }
}
