import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:tasker/customs/constants.dart';
import 'package:tasker/screens/splash_screen/splash_screen.dart';
import '../../customs/need_bloc.dart';

import '../../customs/share_per.dart';
import '../../helper/dio.dart';
import '../../models/models_user_data.dart';
import '../../models/user_model.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  static AuthCubit get(context) => BlocProvider.of(context);

  Future Login(String email, String password,BuildContext context) async {
      emit(SigninLoadingState());
      await DioHelper.postData1(
          url: "auth/login",
          data: {"email": email, "password": password}).then((value)
      {
        print(value.data);
        emit(SigninSuccessState(value.data["data"]["phone"],value.data["data"]["name"],value.data["data"]["email"],value.data["token"],value.data["data"]["role"]));
      }).catchError((error){
        emit(SigninErrorState());
        NeedBloc.showshowSnackBar("رقم الهاتف او كلمة السر خطأ");
      });

  }
  Future Otp(String phone) async {
    emit(otpLoadingState());
    await DioHelper.postData1(
        url: "users/otp",
        data: {"phone": phone}).then((value)
    {
      emit(otpSuccessState(value.data["OTP"]));
    }).catchError((error){
      emit(otpErrorState());
    });

  }
  Future verifyOtp(String number,String otp) async {
    emit(verifyLoadingState());
    await DioHelper.postData1(
        url: "users/verify",
        data: {"number": number,"otp": otp}).then((value)
    {
      print(value.data);
      emit(verifySuccessState(value.data["otp"]["phone"],value.data["otp"]["name"],value.data["otp"]["email"],value.data["token"],value.data["otp"]["role"]));
    }).catchError((error){
      emit(verifyErrorState());
    });

  }
  Future changePassLoged(String password) async {
   final token=await SharePer.getData("token");
    emit(updateLoadingState());
    await DioHelper.updateData(
        url: "users/changeMyPassword",
        token: token,
        data: { "password":password}).then((value)
    {
      emit(updateSuccessState(value.data["token"],value.data["data"]["role"]));
    }).catchError((error){
      emit(updateErrorState());
    });

  }

   saveData(String name,String phone,String email,String token,String role){
     SharePer.saveData("name", name);
     SharePer.saveData("phone", phone);
     SharePer.saveData("email", email);
     SharePer.saveData("token", token);
     SharePer.saveData("role", role);
   }
 late UserData userData;
  addData()async{
 final name=await SharePer.getData("name");
 final phone=await   SharePer.getData("phone");
 final email=await   SharePer.getData("email");
 userData=UserData(name: name, email: email, phone: phone);
  }
  addDataa(String name,String email,String phone){
    userData=UserData(name: name, email: email, phone: phone);
  }
  removeData(BuildContext context)async{
    SharePer.removeData("name");
    SharePer.removeData("phone");
    SharePer.removeData("email");
    SharePer.removeData("token");
    SharePer.removeData("role");
    navigatToandfinish(context, SplashScreen());
  }
  Future<UserModel?> getDataoneUser() async {
    final token = await SharePer.getData("token");
    final response = await DioHelper.getData(url: "users/getMe", token: token);
    if (response.statusCode == 200) {
      return UserModel.fromJson(response.data);
    }
  }


}
