import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'logout_states.dart';

class LogoutCubit extends Cubit<LogoutStates>
{
  LogoutCubit():super(LogoutInitial());

  Future<void> logoutUser()async
  {
    emit(LogoutLoading());
    try{
      await FirebaseAuth.instance.signOut();
      emit(LogoutSuccess());
    }on FirebaseAuthException catch (e) {
      emit(LogoutFailure(message: "Oops! $e"));
    }
    on Exception catch(e){
      emit(LogoutFailure(message: 'Something went wrong! $e'));
    }
  }
}