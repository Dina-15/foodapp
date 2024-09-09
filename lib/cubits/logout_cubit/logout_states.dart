part of 'logout_cubit.dart';

abstract class LogoutStates{}
class LogoutInitial extends LogoutStates{}
class LogoutLoading extends LogoutStates{}
class LogoutSuccess extends LogoutStates{}
class LogoutFailure extends LogoutStates{
  String message;
  LogoutFailure({required this.message});
}