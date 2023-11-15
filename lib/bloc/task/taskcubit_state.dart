part of 'taskcubit_cubit.dart';

@immutable
abstract class TaskState {}

class TaskcubitInitial extends TaskState {}

class addtaskload extends TaskState {}
class addtasksucc extends TaskState {}
class addtaskerror extends TaskState {}

class addpdf extends TaskState {}

class num extends TaskState {}
class udatetaskload extends TaskState {}
class udatetasksucc extends TaskState {}
class udatetaskerror extends TaskState {}