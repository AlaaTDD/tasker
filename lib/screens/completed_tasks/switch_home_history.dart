import 'package:tasker/screens/completed_tasks/history_taskes.dart';
import 'package:tasker/screens/main_screen/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/switchhomehismode.dart';

class SwitchHomeHistory extends StatelessWidget {
  const SwitchHomeHistory({super.key});
  @override
  Widget build(BuildContext context) {
    final switcH=Provider.of<SwitchHomeHisMode>(context).switchscreen;
    if(switcH){
      return HomeScreen();
    }else{
      return HistoryTaskes();
    }
  }
}
