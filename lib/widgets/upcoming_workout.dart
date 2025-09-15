import 'package:flutter/material.dart';
import 'package:fitnest/utils/color_extention.dart';
import 'package:animated_toggle_switch/animated_toggle_switch.dart';

class UpcomingWorkout extends StatefulWidget {
  final Map wObj;

  const UpcomingWorkout({super.key, required this.wObj});

  @override
  State<UpcomingWorkout> createState() => _UpcomingWorkoutState();
}

class _UpcomingWorkoutState extends State<UpcomingWorkout> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 2),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        decoration: BoxDecoration(
          color: TColor.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 1)]
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(25),
              child: Image.asset(
                widget.wObj['image'],
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.wObj["title"].toString(),
                    style: TextStyle(
                      color: TColor.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    widget.wObj["time"].toString(),
                    style: TextStyle(color: TColor.gray, fontSize: 12),
                  ),
                ],
              ),
            ),
            CustomAnimatedToggleSwitch<bool>(
              current: widget.wObj["complete"],
              values: [false, true],
              dif: 0.0,
              indicatorSize: const Size.square(30.0),
              animationDuration: const Duration(milliseconds: 200),
              animationCurve: Curves.linear,
              onChanged: (b) => setState(() => widget.wObj["complete"] = b),
              iconBuilder: (context, local, global) {
                return const SizedBox();
              },
              defaultCursor: SystemMouseCursors.click,
              onTap: () => setState(() => widget.wObj["complete"] = !widget.wObj["complete"]),
              iconsTappable: false,
              wrapperBuilder: (context, global, child) {
                return Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      left: 10.0,
                      right: 10.0,
                      height: 30.0,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: widget.wObj["complete"] ? TColor.secondaryGrad : [TColor.gray.withOpacity(0.5), TColor.gray.withOpacity(0.5)],
                          ),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(50.0),
                          ),
                        ),
                      ),
                    ),
                    child,
                  ],
                );
              },
              foregroundIndicatorBuilder: (context, global) {
                return SizedBox.fromSize(
                  size: const Size(10, 10),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: TColor.white,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(50.0),
                      ),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black38,
                          spreadRadius: 0.05,
                          blurRadius: 1.1,
                          offset: Offset(0.0, 0.8),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
