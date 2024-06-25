import 'package:flutter/material.dart';
import 'package:hamon_student_pro/constant/constant.dart';
import '../../../utils/assets.dart';

class CardDetails {
  final String icon;
  final String title;
  final Color color;

  const CardDetails({required this.icon, required this.title, required this.color});
}

class Constants {
  static const List<CardDetails> cardDetails = [
    CardDetails(icon: icon_student, title: CARD_ONE, color: Color(0xffAAC9BF)),
    CardDetails(icon: icon_book, title: CARD_TWO, color: Color(0xffD8EBFD)),
    CardDetails(icon: icon_room, title: CARD_THREE, color: Color(0xffFFE0DD)),
    CardDetails(icon: icon_pen, title: CARD_FOUR, color: Color(0xffFFF3D9)),
  ];
}
