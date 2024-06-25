import 'package:flutter/material.dart';
import 'package:hamon_student_pro/module/student/model/screen_arguments.dart';

import '../../../routes/routes.dart';
import '../model/studentDetailsModel.dart';

class BuildStudentList extends StatelessWidget {
  const BuildStudentList({
    super.key,
    required this.details,
  });

  final Students details;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, Routes.singleDetailsScreen,
          arguments: ScreenArguments(email: details.email, name: details.name, age: details.age)),
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
                    details.email,
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
              padding: const EdgeInsets.only(right: 15),
              child: Text(
                'Age:${details.age}',
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontFamily: 'sf_display',
                  fontSize: 17,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
