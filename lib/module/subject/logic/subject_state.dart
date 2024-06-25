part of 'subject_cubit.dart';

@immutable
sealed class SubjectState {}

class SubjectInitial extends SubjectState {}

class SubjectApiLoading extends SubjectState {
  SubjectApiLoading();
}

class SubjectApiLoaded extends SubjectState {
  List<Subjects> listSubjectResponse;
  SubjectApiLoaded({required this.listSubjectResponse});
}

class SubjectApiError extends SubjectState {
  final String message;
  SubjectApiError(this.message);
}

