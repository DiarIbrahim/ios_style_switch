import 'package:flutter/material.dart';

import 'IosSwitch.dart';

//ignore: must_be_immutable
class IosSwitchButton extends StatelessWidget {
  Color switchActiveBackgroundColor;
  Color switchDisableBackgroundColor;

  // main border
  Color switchActiveBorderColor;
  Color switchDisableBorderColor;
  double switchActiveBorderWidth;
  double switchDisableBorderWidth;

  double switchMainBorderRadiusValue;

  RoundedRectangleBorder buttonShape ;

// dot
  Color switchDotActiveColor;
  Color switchDotdisableColor;


  /// height width
  double height ;
  double width ;
  
  
  Color color ;

  // duration
  Duration duration;

  // pading
  EdgeInsets padding ;

  Function(bool) onChanged;
  double iosSwitchSize;
  bool isActive;
  bool alignSwitchToRight;
  Widget bodyWidget;
  IosSwitchButton({
   
    @required this.onChanged,
    this.color = const Color(0xfff5f5f5), 
    this.buttonShape = const RoundedRectangleBorder() ,
    this.padding = const EdgeInsets.symmetric(horizontal:0),
    this.iosSwitchSize = 28,
    this.isActive = true,
    this.height = 50 ,
    this.width = double.infinity ,
    this.bodyWidget,
    this.alignSwitchToRight = true,
    this.duration = const Duration(milliseconds: 150),
    this.switchActiveBackgroundColor = const Color(0xff00e676),
    this.switchDisableBackgroundColor = const Color(0xffe0e0e0),
    this.switchActiveBorderColor = Colors.grey,
    this.switchDisableBorderColor = Colors.transparent,
    this.switchActiveBorderWidth = 0,
    this.switchDisableBorderWidth = 1,
    this.switchMainBorderRadiusValue = 150,
    this.switchDotActiveColor = Colors.white,
    this.switchDotdisableColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setState) {
        return body(setState, context);
      },
    );
  }

  body(setState, context) {
    return MaterialButton(
      onPressed: () {
        setState(() {
          isActive = !isActive;
          onChanged.call(isActive);
        });
      },
      minWidth: width,
      shape: buttonShape,
      height: height,
      color: color ,
      elevation: 0,
      highlightElevation: 0,
      child: Container(
        padding: padding ,
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            !alignSwitchToRight
                ? IosSwitch(
                    duration: duration,
                    activeBackgroundColor: switchActiveBackgroundColor,
                    disableBackgroundColor: switchDisableBackgroundColor,
                    dotActiveColor: switchDotActiveColor,
                    dotdisableColor: switchDotdisableColor,
                    activeBorderColor: switchActiveBorderColor,
                    disableBorderColor: switchDisableBorderColor,
                    activeBorderWidth: switchActiveBorderWidth,
                    disableBorderWidth: switchDisableBorderWidth,
                    mainBorderRadiusValue: switchMainBorderRadiusValue,
                    size: iosSwitchSize,
                    isActive: isActive,
                    onChanged: (v) {
                      setState(() {
                        isActive = !isActive;
                      });
                    },
                  )
                : Center(),
            SizedBox(
              width: !alignSwitchToRight ? 6 : 0,
            ),
            Expanded(
                child: Container(
              child: bodyWidget,
            )),
            alignSwitchToRight
                ? IosSwitch(
                    duration: duration,
                    activeBackgroundColor: switchActiveBackgroundColor,
                    disableBackgroundColor: switchDisableBackgroundColor,
                    dotActiveColor: switchDotActiveColor,
                    dotdisableColor: switchDotdisableColor,
                    activeBorderColor: switchActiveBorderColor,
                    disableBorderColor: switchDisableBorderColor,
                    activeBorderWidth: switchActiveBorderWidth,
                    disableBorderWidth: switchDisableBorderWidth,
                    mainBorderRadiusValue: switchMainBorderRadiusValue,
                    size: iosSwitchSize,
                    isActive: isActive,
                    onChanged: (v) {
                      setState(() {
                        isActive = !isActive;
                      });
                    },
                  )
                : Center()
          ],
        ),
      ),
    );
  }
}
