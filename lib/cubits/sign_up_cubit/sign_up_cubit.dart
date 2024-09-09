import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/user_model.dart';
import '../../utils/constants.dart';
part 'sign_up_states.dart';

class SignUpCubit extends Cubit<SignUpStates>
{
  SignUpCubit():super(InitialState());

  Future<void> signUpUser({required email, required password})async
  {
    emit(LoadingState());
    try{
      await FirebaseAuth
          .instance
          .createUserWithEmailAndPassword(
          email: email!, password: password!);
      emit(SignUpSuccess());
    }on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        emit(SignUpFailure(message: "Email is already in use!"));
      } else if (e.code == 'weak-password') {
        emit(SignUpFailure(message: "Weak Password!"));
      }
    }
    on Exception catch(e){
      emit(SignUpFailure(message: 'Something went wrong! $e}'));
    }
  }

  Future<void> createUser(UserModel user) async {
    emit(LoadingState());
    try {
      await FirebaseFirestore.instance
          .collection(kUsersCollection)
          .add(user.toJson());
      emit(createUserSuccess());
    } on FirebaseException catch (e) {
      emit(createUserFailure(message: e.toString()));
    } on Exception catch (e) {
      emit(createUserFailure(message: 'Something went wrong! $e'));
    }
  }
}