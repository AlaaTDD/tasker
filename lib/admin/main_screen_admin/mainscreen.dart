import 'package:tasker/admin/main_screen_admin/personscreen.dart';
import 'package:tasker/admin/main_screen_admin/switch_screen.dart';
import 'package:tasker/admin/main_screen_admin/tablescreen.dart';
import 'package:tasker/resources/color_management.dart';
import 'package:tasker/widgets/buildbottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/page_mode.dart';




class MainscreenAdmin extends StatelessWidget {
   MainscreenAdmin({super.key});
   List<Widget>screens=[SwitchScreen(),TableScreenAdmin(),PersonScreenAdmin()];
  @override
  Widget build(BuildContext context) {
    final page=Provider.of<PageMode>(context).page;
    return Scaffold(
       body: screens[page],
      bottomNavigationBar:buildbottomNavigationBar() ,
    );
  }

}
