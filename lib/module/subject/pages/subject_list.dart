import 'package:flutter/material.dart';

import '../../../routes/routes.dart';
import '../model/subject_arguments.dart';
import '../model/subject_details_model.dart';

class SubjectList extends StatelessWidget {
  final Subjects details;

  const SubjectList({
    super.key,
    required this.details,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(
          context, Routes.singleSubjectDetailsScreen,
          arguments: SubjectArguments(
              name: details.name,
              teacher: details.teacher,
              credit: details.credits)),
      child: Container(
        width: 358,
        height: 66,
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: const Color(0xffD1D1D1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 10, 10, 0),
                  child: Text(
                    details.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontFamily: 'sf_display',
                      fontSize: 17,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 10, 0),
                  child: Text(
                    details.teacher,
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontFamily: 'sf_display',
                      fontSize: 13,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(right: 15, top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '${details.credits}',
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontFamily: 'sf_display',
                      fontSize: 17,
                    ),
                  ),
                  const Text(
                    'Credit',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontFamily: 'sf_display',
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
