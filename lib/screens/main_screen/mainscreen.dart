import 'package:tasker/screens/main_screen/personscreen.dart';
import 'package:tasker/screens/main_screen/tablescreen.dart';
import 'package:tasker/widgets/buildbottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/page_mode.dart';
import '../completed_tasks/switch_home_history.dart';




class Mainscreen extends StatelessWidget {
   Mainscreen({super.key});
   List<Widget>screens=[SwitchHomeHistory(),TableScreen(),PersonScreen()];
  @override
  Widget build(BuildContext context) {
    final page=Provider.of<PageMode>(context).page;
    return Scaffold(
       body: screens[page],
      bottomNavigationBar:buildbottomNavigationBar() ,
    );
  }

}
