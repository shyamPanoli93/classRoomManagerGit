import 'package:flutter/material.dart';
import 'package:hamon_student_pro/module/subject/model/subject_arguments.dart';

import '../../../component/comonAppBar.dart';
import '../../../utils/assets.dart';

class SingleSubjectDetailsScreen extends StatelessWidget {
  const SingleSubjectDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as SubjectArguments;
    return Scaffold(
      appBar: const CommonAppBar(title: 'Subject Details'),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(demo_sub,fit: BoxFit.cover,width: 132.16,height: 132.16,),
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
              args.teacher,
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
              'Credit:${args.credit}',
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
