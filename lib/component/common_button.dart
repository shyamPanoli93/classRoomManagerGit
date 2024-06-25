import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ic.dart';

class CommonButton extends StatelessWidget {
  String label;
  Function() onTap;

  CommonButton({super.key, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 356,
        height: 66,
        decoration: BoxDecoration(
          color: const Color(0xffD1D1D1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                label,
                style: const TextStyle(
                  fontSize: 17.0,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'sf_display',
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 20),
              child: Iconify(
                Ic.keyboard_arrow_right,
                color: Colors.black,
                size: 32,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
