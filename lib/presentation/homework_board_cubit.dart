import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tz_laborato/data/homework_repository.dart';
import 'package:tz_laborato/domain/entity/task.dart';
import 'package:tz_laborato/domain/entity/task_dto_view.dart';

part 'homework_board_state.dart';

class HomeworkBoardCubit extends Cubit<HomeworkBoardState> {
  final HomeworkRepository homeworkRepository;

  HomeworkBoardCubit(this.homeworkRepository)
      : super(const HomeworkBoardScreenInitial());

  Future fetchData() async {
    emit(const HomeworkBoardScreenLoading());
    final List<Task> tasks = await homeworkRepository.fetchData();

    emit(HomeworkBoardScreenLoaded(TaskDTOView(tasks: tasks)));
  }
}
