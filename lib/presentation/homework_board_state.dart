part of 'homework_board_cubit.dart';

abstract class HomeworkBoardState extends Equatable {
  const HomeworkBoardState();

  @override
  List<Object?> get props => throw UnimplementedError();
}

/// Initial application status.
class HomeworkBoardScreenInitial extends HomeworkBoardState {
  const HomeworkBoardScreenInitial();
}

/// Loading application status.
///
/// Use every time a request is made.
class HomeworkBoardScreenLoading extends HomeworkBoardState {
  const HomeworkBoardScreenLoading();
}

/// Default application status.
///
/// Use when none of the tab bars selected.
class HomeworkBoardScreenDefault extends HomeworkBoardState {
  const HomeworkBoardScreenDefault();
}

/// Selected application status.
///
/// Use when one of the tab bars selected.
class HomeworkBoardScreenTypeSelected extends HomeworkBoardState {
  final List<Task> tasks;
  final TaskStatus status;

  const HomeworkBoardScreenTypeSelected(this.status, this.tasks);

  @override
  List<Object?> get props => [status, tasks];
}
