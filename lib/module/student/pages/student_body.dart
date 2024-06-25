import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hamon_student_pro/module/student/logic/student_cubit.dart';
import 'package:hamon_student_pro/module/student/pages/student_list.dart';

import '../../../component/comonAppBar.dart';

class StudentBody extends StatefulWidget {
  const StudentBody({super.key});

  @override
  State<StudentBody> createState() => _StudentBodyState();
}

class _StudentBodyState extends State<StudentBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:const CommonAppBar(
          title: 'Students' ,
      ),
      body: BlocBuilder<StudentCubit, StudentState>(
        builder: (context, state) {
          if (state is StudentApiLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is StudentApiLoaded) {
            final studentList = state.listStudentResponse;
            if (studentList.isEmpty) {
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
                    itemCount: studentList.length,
                    itemBuilder: (context, index) {
                      final details = studentList[index];
                      return BuildStudentList(details: details);
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
