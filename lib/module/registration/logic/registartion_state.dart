part of 'registartion_cubit.dart';

@immutable
sealed class RegistrationState {}

class RegistrationInitial extends RegistrationState {}

class RegistrationApiLoading extends RegistrationState {
  RegistrationApiLoading();
}

class RegistrationApiLoaded extends RegistrationState {
  List<Registrations> listRegistrationResponse;
  RegistrationApiLoaded({required this.listRegistrationResponse});
}

class RegistrationApiError extends RegistrationState {
  final String message;
  RegistrationApiError(this.message);
}
