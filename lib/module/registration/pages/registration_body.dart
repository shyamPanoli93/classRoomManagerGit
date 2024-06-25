import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hamon_student_pro/component/comonAppBar.dart';
import 'package:hamon_student_pro/module/registration/logic/registartion_cubit.dart';
import 'package:hamon_student_pro/routes/routes.dart';
import 'package:hamon_student_pro/utils/common_method.dart';

class RegistrationBody extends StatefulWidget {
  const RegistrationBody({super.key});

  @override
  State<RegistrationBody> createState() => _RegistrationBodyState();
}

class _RegistrationBodyState extends State<RegistrationBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(
        title: 'Registration',
      ),
      body: BlocBuilder<RegistrationCubit, RegistrationState>(
        builder: (context, state) {
          if (state is RegistrationApiLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is RegistrationApiLoaded) {
            final subjectList = state.listRegistrationResponse;
            if (subjectList.isEmpty) {
              return _buildEmptyPage();
            } else {
              return Container();
              /*return Expanded(
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: subjectList.length,
                      itemBuilder: (context, index) {
                        final details = subjectList[index];
                        return SubjectList(details: details);
                      },
                    ),
                  ),
                ),
              );*/
            }
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget _buildEmptyPage() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(
            flex: 2,
          ),
          const Center(
            child: Text(
              'No data ',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 17.0,
                fontFamily: 'sf_display',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          const Spacer(
            flex: 2,
          ),
          GestureDetector(
            onTap: () => navigator(context, Routes.newRegistrationForm),
            child: Container(
              width: 177,
              height: 48,
              decoration: BoxDecoration(
                color: const Color(0xff007AFF).withOpacity(0.3),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(
                  child: Text(
                'New Registration',
                style: TextStyle(
                  color: Color(0xff007AFF),
                  fontSize: 17,
                  fontFamily: 'sf_display',
                  fontWeight: FontWeight.w600,
                ),
              )),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
/*Container(
            width: 177,
            height: 48,
            color: const Color(0xff007AFF),
            child: const Text(
              'New Registration',
              style: TextStyle(
                color: Color(0xff007AFF),
              ),
            ),
          ),*/
