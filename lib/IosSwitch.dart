import 'package:flutter/material.dart';

//ignore: must_be_immutable
class IosSwitch extends StatelessWidget {
  double size;

  //color
  Color activeBackgroundColor;
  Color disableBackgroundColor;

  // main border
  Color activeBorderColor;
  Color disableBorderColor;
  double activeBorderWidth;
  double disableBorderWidth;

  double mainBorderRadiusValue;

// dot
  Color dotActiveColor;
  Color dotdisableColor;

  bool isActive;

  // function
  Function(bool) onChanged;

  // duration
  Duration duration;

  IosSwitch({
    @required this.onChanged ,
    this.duration = const Duration(milliseconds: 150),
    this.isActive = true,
    this.size = 35,
    this.activeBackgroundColor = const Color(0xff00e676),
    this.disableBackgroundColor = const Color(0xffe0e0e0),
    this.activeBorderColor = Colors.grey,
    this.disableBorderColor = Colors.transparent,
    this.activeBorderWidth = 0,
    this.disableBorderWidth = 1,
    this.mainBorderRadiusValue = 150,
    this.dotActiveColor = Colors.white,
    this.dotdisableColor = Colors.white,
  });
  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: (co, setstate) {
      return body(setstate);
    });
  }

  body(setstate) {
    return GestureDetector(
      onTap: () {
        setstate(() {
          isActive = !isActive;
          onChanged.call(isActive);
        });
      },
      child: AnimatedContainer(
        width: size + size * 0.7,
        height: size + size * 0.1,
        duration: duration,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(mainBorderRadiusValue),
          border: Border.all(
              width: isActive ? activeBorderWidth : disableBorderWidth,
              color: isActive ? activeBorderColor : disableBorderColor),
          color: isActive ? activeBackgroundColor : disableBackgroundColor,
        ),
        child: dot(),
      ),
    );
  }

  dot() {
    return Center(
      child: SizedBox(
        width: size + size * 0.5,
        height: size ,
        child: AnimatedAlign(
            duration: duration,
            alignment: isActive ? Alignment.centerRight : Alignment.centerLeft,
            child: AnimatedContainer(
                duration: duration,
                width: size - 0.2 * size,
                height: size - 0.2 * size,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 5,
                          spreadRadius: 2,
                          color: isActive ? Colors.grey[400] : Colors.grey[600].withOpacity(0.6),
                          offset: Offset(1, 1))
                    ],
                    color: isActive ? dotActiveColor : dotdisableColor,
                    borderRadius:
                        BorderRadius.circular(mainBorderRadiusValue)))),
      ),
    );
  }
}
