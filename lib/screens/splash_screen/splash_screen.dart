import 'dart:async';
import 'package:tasker/admin/main_screen_admin/mainscreen.dart';
import 'package:tasker/bloc/auth/auth_cubit.dart';
import 'package:tasker/customs/constants.dart';
import 'package:tasker/customs/share_per.dart';
import 'package:tasker/screens/main_screen/mainscreen.dart';
import 'package:tasker/screens/splash_screen/spashscreen.dart';
import 'package:flutter/material.dart';
import '../../widgets/image_logo.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;
  initTimer(){
    _timer=Timer(Duration(seconds: 3), goNext);
  }
  goNext()async{
    final token=await SharePer.getData("token");
    final role=await SharePer.getData("role");
    if(token!="NA"){
      AuthCubit.get(context).addData();
       if(role=="admin"){
         navigatToandfinish(context, MainscreenAdmin());
       }else{
         navigatToandfinish(context, Mainscreen());
       }
    }else{
      navigatToandfinish(context, SplashView());
    }

  }
  @override
  void initState() {
    initTimer();
    super.initState();
  }
  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ImageLogo(context)),
    );
  }
}
