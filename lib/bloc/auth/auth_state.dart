part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}
class SigninLoadingState extends AuthState {}
class SigninSuccessState extends AuthState {
  final String phone;
  final String name;
  final String email;
  final String token;
  final String role;
  SigninSuccessState(this.phone,this.name,this.email,this.token,this.role);
}
class SigninErrorState extends AuthState {}




class updateLoadingState extends AuthState {}
class updateSuccessState extends AuthState {
  final String token;
  final String role;
  updateSuccessState(this.token,this.role);
}
class updateErrorState extends AuthState {}

class otpLoadingState extends AuthState {}
class otpSuccessState extends AuthState {
  final String otp;
  otpSuccessState(this.otp);
}
class otpErrorState extends AuthState {}

class verifyLoadingState extends AuthState {}
class verifySuccessState extends AuthState {
  final String phone;
  final String name;
  final String email;
  final String token;
  final String role;
  verifySuccessState(this.phone,this.name,this.email,this.token,this.role);
}
class verifyErrorState extends AuthState {}

class updateAnyLoadingState extends AuthState {}
class updateAnySuccessState extends AuthState {
  final String phone;
  final String name;
  final String email;
  final String token;
  final String role;
  updateAnySuccessState(this.phone,this.name,this.email,this.token,this.role);
}

class updateAnyErrorState extends AuthState {}

class AddFriendLoadingState extends AuthState {}
class AddFriendSuccessState extends AuthState {}
class AddFriendErrorState extends AuthState {}