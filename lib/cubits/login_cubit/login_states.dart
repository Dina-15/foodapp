part of 'login_cubit.dart';

abstract class LoginStates{}
class LoginInitial extends LoginStates{}
class LoginLoading extends LoginStates{}
class LoginSuccess extends LoginStates{}
class LoginFailure extends LoginStates{
  String message;
  LoginFailure({required this.message});
}