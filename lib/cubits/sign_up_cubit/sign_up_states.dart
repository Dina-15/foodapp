part of 'sign_up_cubit.dart';

abstract class SignUpStates{}
class InitialState extends SignUpStates{}
class LoadingState extends SignUpStates{}
class SignUpSuccess extends SignUpStates{}
class createUserSuccess extends SignUpStates{}
class SignUpFailure extends SignUpStates{
  String message;
  SignUpFailure({required this.message});
}
class createUserFailure extends SignUpStates{
  String message;
  createUserFailure({required this.message});
}
