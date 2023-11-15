import 'package:tasker/admin/main_screen_admin/homescreen.dart';
import 'package:tasker/admin/main_screen_admin/rate_task_screen.dart';
import 'package:tasker/provider/switch_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SwitchScreen extends StatelessWidget {
  const SwitchScreen({super.key});
  @override
  Widget build(BuildContext context) {
    if(Provider.of<SwitchMainScreen>(context).mainscreen){
      return HomeScreenAdmin();
    }else{
      return RateTaskScreen();
    }
  }
}
