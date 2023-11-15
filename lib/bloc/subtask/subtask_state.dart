part of 'subtask_cubit.dart';

@immutable
abstract class SubtaskState {}

class SubtaskInitial extends SubtaskState {}
class addpdf extends SubtaskState {}

class addtaskload extends SubtaskState {}
class addtasksucc extends SubtaskState {}
class addtaskerror extends SubtaskState {}


class updatetaskload extends SubtaskState {}
class updatetasksucc extends SubtaskState {}
class updatetasksucc2 extends SubtaskState {}

class updatetaskerror extends SubtaskState {}