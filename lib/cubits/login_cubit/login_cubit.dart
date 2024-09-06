import 'package:flutter_bloc/flutter_bloc.dart';
part 'login_states.dart';

class LoginCubit extends Cubit<LoginStates>
{
  LoginCubit():super(LoginInitialState());

}