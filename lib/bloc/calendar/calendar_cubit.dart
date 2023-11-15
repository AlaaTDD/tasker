import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:tasker/models/calender_Model.dart';

import '../../customs/share_per.dart';
import '../../helper/dio.dart';

part 'calendar_state.dart';

class CalendarCubit extends Cubit<CalendarState> {
  CalendarCubit() : super(CalendarInitial());
  static CalendarCubit get(context) => BlocProvider.of(context);
  Future<CalenderModel?> getCalender(String filterdateId) async {
    final token = await SharePer.getData("token");
    final response = await DioHelper.getData(url: "calender/$filterdateId", token: token);
    if (response.statusCode == 200) {
      print(response.data);
      return CalenderModel.fromJson(response.data);
    }
  }

}
