import 'package:bloc/bloc.dart';
import 'package:hamon_student_pro/module/registration/model/registration_model.dart';
import 'package:hamon_student_pro/network/api.dart';
import 'package:meta/meta.dart';

import '../../../network/api_service.dart';

part 'registartion_state.dart';

class RegistrationCubit extends Cubit<RegistrationState> {
  RegistrationCubit() : super(RegistrationInitial()) {
    fetchRegistrationDetails();
  }

  Future<void> fetchRegistrationDetails() async {
    emit(RegistrationApiLoading());
    try {
      final data = await ApiService().get(getRegistrationDetails());
      print("Response:---${data}");
      final registrationDetails = RegistrationModel.fromJson(data);
      print("Results:---${registrationDetails}");
      emit(RegistrationApiLoaded(
          listRegistrationResponse: registrationDetails.registrations));
    } catch (e) {
      print("Error:---$e");
      emit(RegistrationApiError(e.toString()));
    }
  }

}
