import 'package:flutter/material.dart';
import 'package:hamon_student_pro/component/common_button.dart';
import 'package:hamon_student_pro/component/comonAppBar.dart';
import 'package:hamon_student_pro/module/student/model/studentDetailsModel.dart';
import 'package:hamon_student_pro/network/api.dart';
import 'package:hamon_student_pro/routes/routes.dart';

import '../../../network/api_service.dart';
import '../../../utils/common_model.dart';
import '../../classRooms/model/room_argument.dart';

class NewRegistrationForm extends StatefulWidget {
  const NewRegistrationForm({super.key});

  @override
  State<NewRegistrationForm> createState() => _NewRegistrationFormState();
}

class _NewRegistrationFormState extends State<NewRegistrationForm> {
  String selectedStudent = "";
  String selectedSubject = "";
  int? studentId;
  int? subjectId;

  void registration()async{
    try{
      Map<String, dynamic> requestData = {
        "student":studentId,
        "subject":subjectId
      };
      final data = await ApiService().post(postRegistration(),requestData );
      print("Response:---${data}");
    }catch(e){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("${e.toString()}")));
      print("Error:---${e}");
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(
        title: 'New Registration',
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            CommonButton(
              label:
                  selectedStudent == "" ? 'Select a Student' : selectedStudent,
              onTap: () async {
                final result = await Navigator.pushNamed(
                    context, Routes.studentScreen,
                    arguments: RoomArgument(isSelection: true));
                if (result != null) {
                  setState(() {
                    result as Students;
                    selectedStudent = result.name;
                    studentId = result.id;
                  });
                }
              },
            ),
            const SizedBox(height: 15),
            CommonButton(
              label:
                  selectedSubject == "" ? 'Select a Subject' : selectedSubject,
              onTap: () async {
                final subjectResult = await Navigator.pushNamed(
                    context, Routes.subjectScreen,
                    arguments: RoomArgument(isSelection: true));
                if (subjectResult != null) {
                  setState(() {
                    subjectResult as CommonModel;
                    selectedSubject = subjectResult.textTitle;
                    studentId = subjectResult.count;
                  });
                }
              },
            ),
            const SizedBox(height: 25),
            GestureDetector(
              onTap:() => registration(),
              child: Container(
                width: 107,
                height: 48,
                decoration: BoxDecoration(
                  color: const Color(0xff0FAB76),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Text(
                    'Register',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
