import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tz_laborato/widgets/utils/colors.dart';
import 'package:tz_laborato/widgets/utils/curcular_notched_navbar.dart';

// list with generated tasks for AnimatedList
final List<Map<String, dynamic>> _list = [
  {
    "title": "Приседания 4 по 20",
    "leading": "assets/icons/fitnes_icon.svg",
    "action": "assets/icons/late_homework_icon.svg",
    "color": kRedColor,
  },
  {
    "title": "Основы командной игры",
    "leading": "assets/icons/fitnes_icon.svg",
    "action": "assets/icons/late_homework_icon.svg",
    "color": kOrangeColor,
  },
  {
    "title": "Правильная техника владения математическими формулами",
    "leading": "assets/icons/fitnes_icon.svg",
    "action": "assets/icons/late_homework_icon.svg",
    "color": kPurpleColor,
  },
  {
    "title": "Приседания 4 по 20",
    "leading": "assets/icons/fitnes_icon.svg",
    "action": "assets/icons/late_homework_icon.svg",
    "color": kRedColor,
  },
  {
    "title": "Приседания 4 по 20",
    "leading": "assets/icons/fitnes_icon.svg",
    "action": "assets/icons/late_homework_icon.svg",
    "color": kRedColor,
  },
  {
    "title": "Приседания 4 по 20",
    "leading": "assets/icons/fitnes_icon.svg",
    "action": "assets/icons/late_homework_icon.svg",
    "color": kRedColor,
  },
  {
    "title": "Приседания 4 по 20",
    "leading": "assets/icons/fitnes_icon.svg",
    "action": "assets/icons/late_homework_icon.svg",
    "color": kRedColor,
  },
  {
    "title": "Приседания 4 по 20",
    "leading": "assets/icons/fitnes_icon.svg",
    "action": "assets/icons/late_homework_icon.svg",
    "color": kRedColor,
  },
  {
    "title": "Приседания 4 по 20",
    "leading": "assets/icons/fitnes_icon.svg",
    "action": "assets/icons/late_homework_icon.svg",
    "color": kRedColor,
  },
  {
    "title": "Приседания 4 по 20",
    "leading": "assets/icons/fitnes_icon.svg",
    "action": "assets/icons/late_homework_icon.svg",
    "color": kRedColor,
  },
  {
    "title": "Приседания 4 по 20",
    "leading": "assets/icons/fitnes_icon.svg",
    "action": "assets/icons/late_homework_icon.svg",
    "color": kRedColor,
  },
  {
    "title": "Приседания 4 по 20",
    "leading": "assets/icons/fitnes_icon.svg",
    "action": "assets/icons/late_homework_icon.svg",
    "color": kRedColor,
  },
];

/// Screen with task board user.
///
/// [_buildItem] return instance of _ListItem class for list tasks.
class TasksScreen extends StatefulWidget {
  const TasksScreen({Key? key}) : super(key: key);

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  Widget _buildItem(
    BuildContext context,
    int index,
    Animation<double> animation,
  ) {
    return _ListItem(
      animation: animation,
      title: _list[index]["title"],
      actionPath: _list[index]["action"],
      leadingPath: _list[index]["leading"],
      color: _list[index]["color"],
      isLast: index == (_list.length - 1) ? true : false,
      onTap: () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              style: Theme.of(context)
                  .textTheme
                  .subtitle1!
                  .copyWith(color: kWhiteColor50, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 17.0,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const _HeaderMenuSection(),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(top: 17.0),
                child: AnimatedList(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  key: _listKey,
                  initialItemCount: _list.length,
                  itemBuilder: _buildItem,
                ),
              ),
            ),
            const SizedBox(
              height: 57.0,
            ),
          ],
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
  Widget menuElement({
    required Color color,
    required String pathIcon,
    required String perTask,
  }) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.267,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12.0),
      ),
      padding: const EdgeInsets.only(
        top: 14.0,
        bottom: 14.0,
        left: 16.0,
        right: 12,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            perTask,
            style: GoogleFonts.jua(
              textStyle: const TextStyle(fontSize: 30.0, color: kWhiteColor50),
            ),
          ),
          SvgPicture.asset(pathIcon),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 17.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          menuElement(
            perTask: '5',
            pathIcon: 'assets/icons/homework_icon.svg',
            color: kPurpleColor,
          ),
          menuElement(
            perTask: '1',
            pathIcon: 'assets/icons/late_homework_icon.svg',
            color: kRedColor,
          ),
          menuElement(
            perTask: '2',
            pathIcon: 'assets/icons/rework_icon.svg',
            color: kOrangeColor,
          ),
        ],
      ),
    );
  }
}

/// Element of list tasks.
///
/// [isLast] use for deleted margin to last element since AnimatedList class
/// not have constructor with divider attribute as List class.
class _ListItem extends StatelessWidget {
  const _ListItem({
    Key? key,
    required this.animation,
    required this.onTap,
    required this.color,
    required this.leadingPath,
    required this.actionPath,
    required this.title,
    required this.isLast,
  }) : super(key: key);

  final Animation<double> animation;
  final VoidCallback onTap;
  final Color color;
  final String leadingPath;
  final String actionPath;
  final String title;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor: animation,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          height: 67.0,
          margin: isLast ? null : const EdgeInsets.only(bottom: 17.0),
          padding: const EdgeInsets.only(
            left: 16.0,
            right: 20.0,
          ),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(12.0),
            border: Border.all(color: kBorderWhiteColor),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset(leadingPath),
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
                    title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2!
                        .copyWith(color: kTextBlueColor),
                  ),
                ),
              ),
              SvgPicture.asset(actionPath),
            ],
          ),
        ),
      ),
    );
  }
}
