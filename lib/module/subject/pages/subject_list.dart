import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hamon_student_pro/module/subject/logic/subject_cubit.dart';
import 'package:hamon_student_pro/utils/common_model.dart';

import '../../../component/custom_card.dart';
import '../../../routes/routes.dart';
import '../model/subject_arguments.dart';
import '../model/subject_details_model.dart';

class SubjectList extends StatelessWidget {
  final Subjects details;

  const SubjectList({
    super.key,
    required this.details,
  });

  void subjectSelect(BuildContext context, CommonModel dataModel,){
    Navigator.pop(context,dataModel);
  }

  @override
  Widget build(BuildContext context) {
    CommonModel dataModel = CommonModel(
      textTitle: details.name,
      textSubTitle: details.teacher,
      count: details.credits,
      textLabel: 'Credit',
    );
    bool isSelected = context.read<SubjectCubit>().isSelected ?? false;
    return CustomCard(
      model: dataModel,
      onTap: () => (isSelected)
          ? subjectSelect(context,dataModel)
          : Navigator.pushNamed(context, Routes.singleSubjectDetailsScreen,
              arguments: SubjectArguments(
                  name: details.name,
                  teacher: details.teacher,
                  credit: details.credits)),
    );
  }
}
