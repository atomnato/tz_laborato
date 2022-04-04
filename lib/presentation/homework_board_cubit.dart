import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tz_laborato/data/homework_repository.dart';
import 'package:tz_laborato/domain/entity/task.dart';
import 'package:tz_laborato/domain/entity/task_dto_view.dart';

part 'homework_board_state.dart';

class HomeworkBoardCubit extends Cubit<HomeworkBoardState> {
  HomeworkBoardCubit(this.homeworkRepository)
      : super(const HomeworkBoardScreenInitial());

  final HomeworkRepository homeworkRepository;

  /// Status of task selected tab bar.
  TaskStatus? selectedState;

  /// DTO Model for homework board screen.
  late TaskDTOView modelView;

  Future fetchData() async {
    emit(const HomeworkBoardScreenLoading());
    final List<Task> tasks = await homeworkRepository.fetchData();
    modelView = TaskDTOView(tasks);

    emit(const HomeworkBoardScreenDefault());
  }

  Future selectTaskStatus(TaskStatus status) async {
    if (selectedState == status) {
      emit(const HomeworkBoardScreenDefault());
      selectedState = null;
      return;
    }
    selectedState = status;

    switch (status) {
      case TaskStatus.homework:
        emit(
          HomeworkBoardScreenTypeSelected(
            TaskStatus.homework,
            modelView.taskHomework,
          ),
        );
        break;
      case TaskStatus.lateHomework:
        emit(
          HomeworkBoardScreenTypeSelected(
            TaskStatus.lateHomework,
            modelView.taskLateHomework,
          ),
        );
        break;
      case TaskStatus.rework:
        emit(
          HomeworkBoardScreenTypeSelected(
            TaskStatus.rework,
            modelView.taskRework,
          ),
        );
    }
  }
}
