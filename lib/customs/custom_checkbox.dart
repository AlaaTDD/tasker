import 'package:tasker/resources/color_management.dart';
import 'package:flutter/material.dart';
class CheckboxCustom extends StatefulWidget {
  const CheckboxCustom({super.key});

  @override
  State<CheckboxCustom> createState() => _CheckboxCustomState();
}

class _CheckboxCustomState extends State<CheckboxCustom> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return ColorManager.mainColor;
      }
      return ColorManager.greenColor;
    }

    return Checkbox(
      checkColor: Colors.white,
      fillColor: MaterialStateProperty.resolveWith(getColor),
      value: isChecked,
      onChanged: (bool? value) {
        setState(() {
          isChecked = value!;
        });
      },
    );
  }
}

class CheckboxCustomTask extends StatefulWidget {
  const CheckboxCustomTask({super.key});
  @override
  State<CheckboxCustomTask> createState() => _CheckboxCustomTaskState();
}
class _CheckboxCustomTaskState extends State<CheckboxCustomTask> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return ColorManager.whiteColor;
      }
      return ColorManager.whiteColor;
    }
    return Checkbox(
      checkColor: ColorManager.blackColor,
      fillColor: MaterialStateProperty.resolveWith(getColor),
      value: isChecked,
      side: BorderSide(
        width: 0
      ),
      onChanged: (bool? value) {
        setState(() {
          isChecked = value!;
        });
      },
    );
  }
}
