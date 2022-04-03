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

  const TaskTile.homework({
    required this.actionPath,
    required this.leadingPath,
    required this.title,
    required this.isLast,
  }) : color = kPurpleColor;

  const TaskTile.lateHomework({
    required this.actionPath,
    required this.leadingPath,
    required this.title,
    required this.isLast,
  }) : color = kRedColor;

  const TaskTile.rework({
    required this.actionPath,
    required this.leadingPath,
    required this.title,
    required this.isLast,
  }) : color = kOrangeColor;

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

          return TaskTile.homework(
            actionPath: actionPath,
            leadingPath: leadingPath,
            title: model.label,
            isLast: last,
          );
        }
      case TaskStatus.lateHomework:
        {
          actionPath = "assets/icons/late_homework_icon.svg";

          return TaskTile.lateHomework(
            actionPath: actionPath,
            leadingPath: leadingPath,
            title: model.label,
            isLast: last,
          );
        }
      case TaskStatus.rework:
        {
          actionPath = "assets/icons/rework_icon.svg";

          return TaskTile.rework(
            actionPath: actionPath,
            leadingPath: leadingPath,
            title: model.label,
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
          width: double.infinity,
          height: _myAnimation.value.height,
          margin: widget.isLast ? null : const EdgeInsets.only(bottom: 17.0),
          padding: const EdgeInsets.only(
            left: 16.0,
            right: 20.0,
          ),
          decoration: BoxDecoration(
            color: widget.color,
            borderRadius: BorderRadius.circular(12.0),
            border: Border.all(color: kBorderWhiteColor),
          ),
          child: Row(
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
              SvgPicture.asset(widget.actionPath),
            ],
          ),
        ),
      ),
    );
  }
}
