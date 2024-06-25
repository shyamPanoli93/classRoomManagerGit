import 'package:flutter/material.dart';
import 'package:hamon_student_pro/utils/common_model.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key, required this.model, required this.onTap});
  final CommonModel model;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
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
                    model.textTitle,
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
                    model.textSubTitle,
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
                    '${model.count}',
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontFamily: 'sf_display',
                      fontSize: 17,
                    ),
                  ),
                    Text(
                    model.textLabel,
                    style:const TextStyle(
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