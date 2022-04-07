import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tz_laborato/data/homework_repository.dart';
import 'package:tz_laborato/domain/entity/task.dart';
import 'package:tz_laborato/presentation/homework_board_cubit.dart';
import 'package:tz_laborato/widgets/utils/colors.dart';
import 'package:tz_laborato/widgets/utils/curcular_notched_navbar.dart';
import 'package:tz_laborato/widgets/utils/menu_element.dart';
import 'package:tz_laborato/widgets/utils/task_tile.dart';

/// Screen with task board user.
///
/// [_buildItem] return instance of _ListItem class for list tasks.
class HomeworkBoardScreen extends StatefulWidget {
  const HomeworkBoardScreen({Key? key}) : super(key: key);

  @override
  State<HomeworkBoardScreen> createState() => _HomeworkBoardScreenState();
}

class _HomeworkBoardScreenState extends State<HomeworkBoardScreen> {
  //Cubit
  late HomeworkBoardCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = HomeworkBoardCubit(HomeworkRepository());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _cubit..fetchData(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: kBlackColor20,
          ),
          title: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Новые задания",
                style: Theme.of(context)
                    .textTheme
                    .subtitle1!
                    .copyWith(fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                width: 12.0,
              ),
              Text(
                "Мои оценки",
                style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      color: kWhiteColor50,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 17.0,
          ),
          child: BlocBuilder<HomeworkBoardCubit, HomeworkBoardState>(
            builder: (context, state) {
              if (state is HomeworkBoardScreenLoading ||
                  state is HomeworkBoardScreenInitial) {
                return const Center(
                  child: SizedBox(
                    width: 40.0,
                    child: CircularProgressIndicator(),
                  ),
                );
              }
              if (state is HomeworkBoardScreenDefault) {
                final List<Task> list = _cubit.modelView.tasks;

                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const _HeaderMenuSection(),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 17.0),
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: list.length,
                          itemBuilder: (
                            BuildContext context,
                            int index,
                          ) {
                            bool lastElem =
                                index == (list.length - 1) ? true : false;
                            return TaskTile.parseTypes(
                              list[index],
                              last: lastElem,
                            );
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 57.0,
                    ),
                  ],
                );
              }

              if (state is HomeworkBoardScreenTypeSelected) {
                final List<Task> list = state.tasks;

                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const _HeaderMenuSection(),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 17.0),
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: list.length,
                          itemBuilder: (
                            BuildContext context,
                            int index,
                          ) {
                            bool lastElem =
                                index == (list.length - 1) ? true : false;
                            return TaskTile.parseTypes(
                              list[index],
                              last: lastElem,
                            );
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 57.0,
                    ),
                  ],
                );
              }

              return const AlertDialog(title: Text("Critical error"));
            },
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          clipBehavior: Clip.antiAlias,
          shape: const CircularNotchedNavBar(),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: [
              BottomNavigationBarItem(
                label: '',
                icon: SvgPicture.asset('assets/icons/navbar_home_icon.svg'),
              ),
              BottomNavigationBarItem(
                label: '',
                icon: SvgPicture.asset('assets/icons/navbar_calendar_icon.svg'),
              ),
              BottomNavigationBarItem(
                label: '',
                icon: SvgPicture.asset('assets/icons/navbar_tasks_icon.svg'),
              ),
              BottomNavigationBarItem(
                label: '',
                icon: SvgPicture.asset('assets/icons/navbar_profile_icon.svg'),
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: kLightBlueColor,
          child: SvgPicture.asset('assets/icons/add_icon.svg'),
        ),
      ),
    );
  }
}

/// Header section with custom tab bar
///
/// [menuElement] create tab bar element.
class _HeaderMenuSection extends StatefulWidget {
  const _HeaderMenuSection({Key? key}) : super(key: key);

  @override
  State<_HeaderMenuSection> createState() => _HeaderMenuSectionState();
}

class _HeaderMenuSectionState extends State<_HeaderMenuSection> {
  late HomeworkBoardCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = BlocProvider.of<HomeworkBoardCubit>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 17.0),
      child: BlocBuilder<HomeworkBoardCubit, HomeworkBoardState>(
        builder: (context, state) {
          if (state is HomeworkBoardScreenDefault) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MenuElement(
                  color: kPurpleColor,
                  pathIcon: 'assets/icons/homework_icon.svg',
                  perTask: '${_cubit.modelView.taskHomework.length}',
                  onTap: () {
                    _cubit.selectTaskStatus(
                      _cubit.modelView.taskHomework.first.status,
                    );
                  },
                ),
                MenuElement(
                  color: kPurpleColor,
                  pathIcon: 'assets/icons/late_homework_icon.svg',
                  perTask: '${_cubit.modelView.taskLateHomework.length}',
                  onTap: () {
                    _cubit.selectTaskStatus(
                      _cubit.modelView.taskLateHomework.first.status,
                    );
                  },
                ),
                MenuElement(
                  color: kPurpleColor,
                  pathIcon: 'assets/icons/rework_icon.svg',
                  perTask: '${_cubit.modelView.taskRework.length}',
                  onTap: () {
                    _cubit.selectTaskStatus(
                      _cubit.modelView.taskRework.first.status,
                    );
                  },
                ),
              ],
            );
          }
          if (state is HomeworkBoardScreenTypeSelected) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MenuElement(
                  color: kPurpleColor,
                  pathIcon: 'assets/icons/homework_icon.svg',
                  perTask: '${_cubit.modelView.taskHomework.length}',
                  onTap: () {
                    _cubit.selectTaskStatus(
                      _cubit.modelView.taskHomework.first.status,
                    );
                  },
                  selected: state.status ==
                      _cubit.modelView.taskHomework.first.status,
                ),
                MenuElement(
                  color: kPurpleColor,
                  pathIcon: 'assets/icons/late_homework_icon.svg',
                  perTask: '${_cubit.modelView.taskLateHomework.length}',
                  onTap: () {
                    _cubit.selectTaskStatus(
                      _cubit.modelView.taskLateHomework.first.status,
                    );
                  },
                  selected: state.status ==
                      _cubit.modelView.taskLateHomework.first.status,
                ),
                MenuElement(
                  color: kPurpleColor,
                  pathIcon: 'assets/icons/rework_icon.svg',
                  perTask: '${_cubit.modelView.taskRework.length}',
                  onTap: () {
                    _cubit.selectTaskStatus(
                      _cubit.modelView.taskRework.first.status,
                    );
                  },
                  selected:
                      state.status == _cubit.modelView.taskRework.first.status,
                ),
              ],
            );
          }
          return Container();
        },
      ),
    );
  }
}
