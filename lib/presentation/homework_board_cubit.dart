import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tz_laborato/data/homework_repository.dart';

import 'package:tz_laborato/domain/entity/task.dart';
import 'package:tz_laborato/widgets/utils/task_tile.dart';

part 'homework_board_state.dart';

class HomeworkBoardCubit extends Cubit<HomeworkBoardState> {
  final HomeworkRepository homeworkRepository;

  HomeworkBoardCubit(this.homeworkRepository)
      : super(const HomeworkBoardScreenInitial());

  List<TaskTile> _taskWidgetBuilder(List<Task> model){
    final List<TaskTile> listWidget = <TaskTile>[];

    for(int index = 0; index < model.length; index++){
      final bool isLast = index == (_list.length - 1) ? true : false;

      listWidget.add(TaskTile.parseTypes(model[index], last: isLast));
    }

    return listWidget;
  }

  Future fetchData() async{
    emit(const HomeworkBoardScreenLoading());
    final List<Task> tasks = await homeworkRepository.fetchData();

    emit (HomeworkBoardScreenLoaded(_taskWidgetBuilder(tasks)));
  }
}
