import 'dart:developer';

import 'package:hamon_student_pro/network/endpoints.dart';


/*String postPanelItemList() {
  log("PanelItemList URL:---${Endpoints.baseUrl}${Endpoints.getPanelItems}");
  return "${Endpoints.baseUrl}${Endpoints.getPanelItems}";
}

String postCartItemList() {
  log("CartItemList URL:---${Endpoints.baseUrl}${Endpoints.getCartItems}");
  return "${Endpoints.baseUrl}${Endpoints.getCartItems}";
}*/

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