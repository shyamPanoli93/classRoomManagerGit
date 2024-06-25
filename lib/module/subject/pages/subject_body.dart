import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hamon_student_pro/module/subject/logic/subject_cubit.dart';
import 'package:hamon_student_pro/module/subject/pages/subject_list.dart';

import '../../../component/comonAppBar.dart';

class SubjectBody extends StatefulWidget {
  const SubjectBody({super.key});

  @override
  State<SubjectBody> createState() => _SubjectBodyState();
}

class _SubjectBodyState extends State<SubjectBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:const CommonAppBar(
        title: 'Subjects' ,
      ),
      body: BlocBuilder<SubjectCubit, SubjectState>(
        builder: (context, state) {
          if (state is SubjectApiLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is SubjectApiLoaded) {
            final subjectList = state.listSubjectResponse;
            if (subjectList.isEmpty) {
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
                        itemCount: subjectList.length,
                        itemBuilder: (context, index) {
                          final details = subjectList[index];
                          return SubjectList(details: details);
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
