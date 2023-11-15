import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasker/bloc/auth/auth_cubit.dart';
import 'package:tasker/bloc/calendar/calendar_cubit.dart';
import 'package:tasker/bloc/subtask/subtask_cubit.dart';
import 'package:tasker/bloc/task/taskcubit_cubit.dart';
import 'package:tasker/helper/dio.dart';
import 'package:tasker/provider/choise_task_mode.dart';
import 'package:tasker/provider/confirm_task.dart';
import 'package:tasker/provider/get_days.dart';
import 'package:tasker/provider/menu_mode.dart';
import 'package:tasker/provider/page_mode.dart';
import 'package:tasker/provider/settingmode.dart';
import 'package:tasker/provider/switch_screen.dart';
import 'package:tasker/provider/switchhomehismode.dart';
import 'package:tasker/provider/switchscreenmode.dart';
import 'package:tasker/provider/theme_provider.dart';
import 'package:tasker/provider/time_mode.dart';
import 'package:tasker/provider/time_picker_mode.dart';
import 'package:tasker/screens/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'resources/color_management.dart';

Future<void> main() async {
  DioHelper.init();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: ColorManager.whiteColor,
    statusBarColor: ColorManager.whiteColor,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarIconBrightness: Brightness.light,
  ));
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AuthCubit()),
        BlocProvider(create: (_) => TaskCubit()),
        BlocProvider(create: (_) => SubtaskCubit()),
        BlocProvider(create: (_) => CalendarCubit()),
      ],
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider<PageMode>(
            create: (context) => PageMode(),
          ),
          ChangeNotifierProvider<SettingMode>(
            create: (context) => SettingMode(),
          ),
          ChangeNotifierProvider<SwitchScreenMode>(
            create: (context) => SwitchScreenMode(),
          ),
          ChangeNotifierProvider<TimeMode>(
            create: (context) => TimeMode(),
          ),
          ChangeNotifierProvider<SwitchMainScreen>(
            create: (context) => SwitchMainScreen(),
          ),
          ChangeNotifierProvider<MenuMode>(
            create: (context) => MenuMode(),
          ),
          ChangeNotifierProvider<ChoiseTaskMode>(
            create: (context) => ChoiseTaskMode(),
          ),
          ChangeNotifierProvider<TimePickerMode>(
            create: (context) => TimePickerMode(),
          ),
          ChangeNotifierProvider<GetDays>(
            create: (context) => GetDays(),
          ),
          ChangeNotifierProvider<SwitchHomeHisMode>(
            create: (context) => SwitchHomeHisMode(),
          ),
          ChangeNotifierProvider<ThemeProvider>(
            create: (context) => ThemeProvider(),
          ),
          ChangeNotifierProvider<Confirm>(
            create: (context) => Confirm(),
          ),

        ],
        child:  Builder(
            builder: (context) {
              return MaterialApp(
                title: "Tasker",
                theme: Mythemes.lightTheme,
                darkTheme: Mythemes.darkTheme,
                themeMode: Provider.of<ThemeProvider>(context).isDark?ThemeMode.dark:ThemeMode.light,
                debugShowCheckedModeBanner: false,
                home: SplashScreen(),
              );
            }
        ),
      ),
    );
  }
}


