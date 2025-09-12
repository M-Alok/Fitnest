import 'package:flutter/material.dart';
import 'package:fitnest/utils/color_extention.dart';

class LatestActivity extends StatelessWidget {
  final Map wObj;
  const LatestActivity({super.key, required this.wObj});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 2),
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      decoration: BoxDecoration(
        color: TColor.white,
        borderRadius: BorderRadius.circular(25),
        // boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 2)]
        border: Border.all(color: TColor.gray.withOpacity(0.2)),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(30),
            child: Image.asset(
              wObj['image'].toString(),
              width: 60,
              height: 60,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  wObj['title'].toString(),
                  style: TextStyle(color: TColor.black, fontSize: 12),
                ),
                Text(
                  "${wObj['time']}",
                  style: TextStyle(color: TColor.gray, fontSize: 10),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Image.asset(
              "assets/img/menu.png",
              width: 15,
              height: 15,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}