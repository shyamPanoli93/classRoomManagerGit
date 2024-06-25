part of 'student_cubit.dart';

@immutable
sealed class StudentState {}

class StudentInitial extends StudentState {
  StudentInitial();
}

class StudentApiLoading extends StudentState {
  StudentApiLoading();
}

class StudentApiLoaded extends StudentState {
  List<Students> listStudentResponse;
  StudentApiLoaded({required this.listStudentResponse});
}

class StudentApiError extends StudentState {
  final String message;
  StudentApiError(this.message);
}
