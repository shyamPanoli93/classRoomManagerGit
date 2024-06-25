import 'package:bloc/bloc.dart';
import 'package:hamon_student_pro/module/student/model/studentDetailsModel.dart';
import 'package:hamon_student_pro/network/api.dart';
import 'package:hamon_student_pro/network/api_service.dart';
import 'package:meta/meta.dart';

part 'student_state.dart';

class StudentCubit extends Cubit<StudentState> {
  StudentCubit() : super(StudentInitial()){
    fetchStudentDetails();
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
