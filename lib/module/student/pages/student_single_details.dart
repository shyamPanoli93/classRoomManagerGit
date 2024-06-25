import 'package:flutter/material.dart';
import 'package:hamon_student_pro/component/comonAppBar.dart';
import 'package:hamon_student_pro/module/student/model/screen_arguments.dart';
import 'package:hamon_student_pro/utils/assets.dart';

class StudentSingleDetails extends StatelessWidget {
  const StudentSingleDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as ScreenArguments;
    return Scaffold(
      appBar: const CommonAppBar(title: 'Student Details'),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(demo_profile,fit: BoxFit.cover,width: 132.16,height: 132.16,),
          const SizedBox(height: 10),
          Center(
            child: Text(
              args.name,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontFamily: 'sf_display',
                fontSize: 22.47,
              ),
            ),
          ),
          const SizedBox(height: 5),
          Center(
            child: Text(
              'Age:${args.age}',
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontFamily: 'sf_display',
                fontSize: 22.47,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Center(
            child: Text(
              args.email,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontFamily: 'sf_display',
                fontSize: 17.18,
              ),
            ),
          ),
        ],
      ),
    );
  }

}
