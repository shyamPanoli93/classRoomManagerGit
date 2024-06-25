import 'package:bloc/bloc.dart';
import 'package:hamon_student_pro/module/student/model/studentDetailsModel.dart';
import 'package:hamon_student_pro/network/api.dart';
import 'package:hamon_student_pro/network/api_service.dart';
import 'package:meta/meta.dart';

import '../../classRooms/model/room_argument.dart';

part 'student_state.dart';

class StudentCubit extends Cubit<StudentState> {
  StudentCubit() : super(StudentInitial()){
    fetchStudentDetails();
  }
  bool? isSelected;
  void setFormMode(RoomArgument? args) {
    if (args == null) return;
    isSelected = args.isSelection;
  }

  Future<void> fetchStudentDetails()async{
    emit(StudentApiLoading());
    try{
      final data = await ApiService().get(getStudentDetails());
      print("Response:---${data}");
      final studentDetails = StudentDetailsModel.fromJson(data);
      print("Results:---${studentDetails}");
      emit(StudentApiLoaded(listStudentResponse: studentDetails.students));
    }catch(e){
      print("Error:---$e");
      emit(StudentApiError(e.toString()));
    }
  }
}
