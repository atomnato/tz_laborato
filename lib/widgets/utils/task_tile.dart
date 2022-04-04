import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tz_laborato/domain/entity/task.dart';
import 'package:tz_laborato/widgets/utils/colors.dart';

/// Element of list tasks.
///
/// [isLast] use for deleted margin to last element since AnimatedList class
/// not have constructor with divider attribute as List class.
class TaskTile extends StatefulWidget {
  const TaskTile({
    Key? key,
    required this.color,
    required this.title,
    required this.isLast,
    required this.leadingPath,
    required this.actionPath,
  }) : super(key: key);

  factory TaskTile.parseTypes(Task model, {required bool last}) {
    String? leadingPath;
    String? actionPath;

    switch (model.type) {
      case TaskType.fitness:
        leadingPath = "assets/icons/fitness_icon.svg";
        break;
      case TaskType.video:
        leadingPath = "assets/icons/video_icon.svg";
        break;
      case TaskType.reading:
        leadingPath = "assets/icons/reading_icon.svg";
        break;
      case TaskType.creative:
        leadingPath = "assets/icons/lamp_icon.svg";
        break;
      case TaskType.interactive:
        leadingPath = "assets/icons/interactive_icon.svg";
        break;
    }
    switch (model.status) {
      case TaskStatus.homework:
        {
          actionPath = "assets/icons/homework_icon.svg";

          return TaskTile(
            actionPath: actionPath,
            leadingPath: leadingPath,
            title: model.label,
            color: kPurpleColor,
            isLast: last,
          );
        }
      case TaskStatus.lateHomework:
        {
          actionPath = "assets/icons/late_homework_icon.svg";

          return TaskTile(
            actionPath: actionPath,
            leadingPath: leadingPath,
            title: model.label,
            color: kRedColor,
            isLast: last,
          );
        }
      case TaskStatus.rework:
        {
          actionPath = "assets/icons/rework_icon.svg";

          return TaskTile(
            actionPath: actionPath,
            leadingPath: leadingPath,
            title: model.label,
            color: kOrangeColor,
            isLast: last,
          );
        }
    }
  }

  final Color color;
  final String leadingPath;
  final String actionPath;
  final String title;
  final bool isLast;

  @override
  State<TaskTile> createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Size> _myAnimation;
  bool isExpand = false;

  Widget _buttonBuilder(String title, Function()? action) {
    return GestureDetector(
      onTap: action,
      child: Container(
        padding: const EdgeInsets.only(
          top: 15.0,
          left: 56,
          bottom: 14.0,
          right: 55.0,
        ),
        decoration: BoxDecoration(
          color: kWhiteColor10,
          border: Border.all(color: kWhiteColor50),
          borderRadius: BorderRadius.circular(32.0),
        ),
        child: Text(
          title,
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );
    _myAnimation = Tween<Size>(
      begin: const Size.fromHeight(67.0),
      end: const Size.fromHeight(268.0),
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _myAnimation,
      builder: (context, child) => GestureDetector(
        onTap: () {
          isExpand = isExpand == false ? true : false;

          if (isExpand) {
            _controller.forward();
          } else {
            _controller.reverse();
          }
        },
        child: Container(
          clipBehavior: Clip.antiAlias,
          width: double.infinity,
          height: _myAnimation.value.height,
          margin: widget.isLast ? null : const EdgeInsets.only(bottom: 17.0),
          padding: const EdgeInsets.only(
            top: 16.0,
            bottom: 14.0,
            left: 16.0,
            right: 16.0,
          ),
          decoration: BoxDecoration(
            color: widget.color,
            borderRadius: BorderRadius.circular(12.0),
            border: Border.all(color: kWhiteColor10),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(widget.leadingPath),
                  Flexible(
                    child: Container(
                      padding: const EdgeInsets.only(
                        left: 40.0,
                        right: 34.0,
                      ),
                      constraints: const BoxConstraints(
                        minWidth: 151.0,
                      ),
                      child: Text(
                        widget.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context)
                            .textTheme
                            .subtitle2!
                            .copyWith(color: kTextBlueColor),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 5.0),
                    child: SvgPicture.asset(widget.actionPath),
                  ),
                ],
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(top: 18.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset('assets/images/fitness.png'),
                      const SizedBox(
                        width: 16.0,
                      ),
                      Flexible(
                        child: Text(
                          'Здесь текст - описание задания. Для современного мира высокотехнологичная концепция общественного уклада однозначно фиксирует необходимость системы массового участия.',
                          style: Theme.of(context)
                              .textTheme
                              .caption!
                              .copyWith(color: kWhiteColor),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(top: 41.0),
                  child: _buttonBuilder('Начать', () {}),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
