import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'login_states.dart';

class LoginCubit extends Cubit<LoginStates>
{
  LoginCubit():super(LoginInitial());

 Future<void> loginUser({required email, required password})async
  {
    emit(LoginLoading());
    try{
       await FirebaseAuth
          .instance.signInWithEmailAndPassword(
          email: email, password: password);
      emit(LoginSuccess());
    }on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(LoginFailure(message: "User not found!"));
      } else if (e.code == 'wrong-password') {
        emit(LoginFailure(message: "Wrong Password!"));
      }
      else {
        emit(LoginFailure(message: "Oops! $e"));
      }
    }
    on Exception catch(e){
      emit(LoginFailure(message: 'Something went wrong! $e'));
    }
  }
}