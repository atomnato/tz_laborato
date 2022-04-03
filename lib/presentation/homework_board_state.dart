part of 'homework_board_cubit.dart';

abstract class HomeworkBoardState extends Equatable {
  const HomeworkBoardState();

  @override
  List<Object?> get props => throw UnimplementedError();
}

class HomeworkBoardScreenInitial extends HomeworkBoardState {
  const HomeworkBoardScreenInitial();
}

class HomeworkBoardScreenLoading extends HomeworkBoardState {
  const HomeworkBoardScreenLoading();
}

class HomeworkBoardScreenLoaded extends HomeworkBoardState {
  final TaskDTOView taskModel;

  const HomeworkBoardScreenLoaded(this.taskModel);

  @override
  List<Object?> get props => [taskModel];
}

class HomeworkBoardScreenTypeSelected extends HomeworkBoardState {
  const HomeworkBoardScreenTypeSelected();
}
