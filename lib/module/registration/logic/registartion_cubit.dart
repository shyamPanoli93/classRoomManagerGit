import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'registartion_state.dart';

class RegistartionCubit extends Cubit<RegistartionState> {
  RegistartionCubit() : super(RegistartionInitial());
}
