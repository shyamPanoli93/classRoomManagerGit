import 'dart:developer';

import 'package:hamon_student_pro/network/endpoints.dart';

String getStudentDetails(){
  log("StudentDetails URL:---${Endpoints.baseUrl}${Endpoints.getStudent}?api_key=${Endpoints.api_key}");
  return '${Endpoints.baseUrl}${Endpoints.getStudent}?api_key=${Endpoints.api_key}';
}
String getClassRooms(){
  log("ClassRoom URL:---${Endpoints.baseUrl}${Endpoints.getClassRooms}?api_key=${Endpoints.api_key}");
  return '${Endpoints.baseUrl}${Endpoints.getClassRooms}?api_key=${Endpoints.api_key}';
}
String getSubjectDetails(){
  log("SubjectDetail URL:---${Endpoints.baseUrl}${Endpoints.getSubject}?api_key=${Endpoints.api_key}");
  return '${Endpoints.baseUrl}${Endpoints.getSubject}?api_key=${Endpoints.api_key}';
}

String getRegistrationDetails(){
  log("RegistrationDetails URL:---${Endpoints.baseUrl}${Endpoints.getRegistration}?api_key=${Endpoints.api_key}");
  return '${Endpoints.baseUrl}${Endpoints.getRegistration}?api_key=${Endpoints.api_key}';
}

String postRegistration() {
  log("Registration URL:---${Endpoints.baseUrl}${Endpoints.getRegistration}?api_key=${Endpoints.api_key}");
  return "${Endpoints.baseUrl}${Endpoints.getRegistration}?api_key=${Endpoints.api_key}";
}

String putUpdateSubject() {
  log("Registration URL:---${Endpoints.baseUrl}${Endpoints.getRegistration}?api_key=${Endpoints.api_key}");
  return "${Endpoints.baseUrl}${Endpoints.getRegistration}?api_key=${Endpoints.api_key}";
}