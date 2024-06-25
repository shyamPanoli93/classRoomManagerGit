import 'package:bloc/bloc.dart';
import 'package:hamon_student_pro/module/classRooms/model/room_argument.dart';
import 'package:hamon_student_pro/module/subject/model/subject_details_model.dart';
import 'package:hamon_student_pro/network/api.dart';
import 'package:meta/meta.dart';

import '../../../network/api_service.dart';

part 'subject_state.dart';

class SubjectCubit extends Cubit<SubjectState> {
  SubjectCubit() : super(SubjectInitial()){
    fetchSubjectDetails();
  }

  bool? isSelected;
  void setFormMode(RoomArgument? args) {
    if (args == null) return;
    isSelected = args.isSelection;
  }

  Future<void> fetchSubjectDetails()async{
    emit(SubjectApiLoading());
    try{
      final data = await ApiService().get(getSubjectDetails());
      print("Response:---${data}");
      final subjectDetails = SubjectDetailsModel.fromJson(data);
      print("Results:---${subjectDetails}");
      emit(SubjectApiLoaded(listSubjectResponse: subjectDetails.subjects));
    }catch(e){
      print("Error:---$e");
      emit(SubjectApiError(e.toString()));
    }
  }
}
