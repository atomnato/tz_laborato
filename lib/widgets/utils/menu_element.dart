import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tz_laborato/widgets/utils/colors.dart';

///Custom tab bar for homework board screen
class MenuElement extends StatelessWidget {
  const MenuElement({
    Key? key,
    required this.color,
    required this.pathIcon,
    required this.perTask,
    required this.onTap,
    this.selected = true,
  }) : super(key: key);

  final Color color;
  final String pathIcon;
  final String perTask;
  final Function()? onTap;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedOpacity(
        opacity: selected ? 1.0 : 0.2,
        duration: const Duration(milliseconds: 100),
        child: Container(
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
                  textStyle:
                      const TextStyle(fontSize: 30.0, color: kWhiteColor50),
                ),
              ),
              SvgPicture.asset(pathIcon),
            ],
          ),
        ),
      ),
    );
  }
}
