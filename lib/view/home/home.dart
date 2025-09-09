import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:fitnest/widgets/grad_button.dart';
import 'package:fitnest/utils/color_extention.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: TColor.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            width: media.width,
            padding: EdgeInsets.symmetric(horizontal: media.width * 0.05, vertical: media.width * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome Back,',
                          style: TextStyle(color: TColor.gray, fontSize: 12),
                        ),
                        Text(
                          'John Doe',
                          style: TextStyle(
                            color: TColor.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Placeholder(),
                          ),
                        );
                      },
                      icon: Image.asset(
                        "assets/img/notification.png",
                        width: 25,
                        height: 25,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: media.width * 0.05),
                Container(
                  height: media.width * 0.4,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: TColor.primaryGrad),
                    borderRadius: BorderRadius.circular(media.width * 0.075)
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(
                        "assets/img/bg_dots.png",
                        height: media.width * 0.4,
                        width: double.maxFinite,
                        fit: BoxFit.fitHeight,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'BMI(Body Mass Index)',
                                  style: TextStyle(
                                    color: TColor.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(height: media.width * 0.01),
                                Text(
                                  'You have a normal weight',
                                  style: TextStyle(
                                    color: TColor.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(height: media.width * 0.05),
                                SizedBox(
                                  width: 120,
                                  height: 35,
                                  child: GradButton(
                                    title: "View More",
                                    type: GradButtonType.bgSGradient,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    onPressed: () {}
                                  ),
                                ),
                              ],
                            ),
                            AspectRatio(
                              aspectRatio: 1,
                              child: PieChart(
                                PieChartData(
                                  pieTouchData: PieTouchData(
                                    touchCallback:
                                        (FlTouchEvent event, pieTouchResponse) {},
                                  ),
                                  startDegreeOffset: 250,
                                  borderData: FlBorderData(
                                    show: false,
                                  ),
                                  sectionsSpace: 1,
                                  centerSpaceRadius: 0,
                                  sections: showingSections(),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),  
                    ],
                  ),
                ),
                SizedBox(height: media.width * 0.05),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  decoration: BoxDecoration(
                    color: TColor.primaryColor2.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Today Target",
                        style: TextStyle(
                            color: TColor.black,
                            fontSize: 18,
                          ),
                      ),
                      SizedBox(
                        width: 80,
                        height: 30,
                        child: GradButton(
                          title: 'Check',
                          type: GradButtonType.bgGradient,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ),
                // SizedBox(height: media.width * 0.05),
                // Text(
                //   "Activity Status",
                //   style: TextStyle(
                //     color: TColor.black,
                //     fontSize: 16,
                //     fontWeight: FontWeight.w700,
                //   ),
                // ),
                // SizedBox(height: media.width * 0.02),
                // Container(
                //   padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                //   decoration: BoxDecoration(
                //     color: TColor.primaryColor2.withOpacity(0.3),
                //     borderRadius: BorderRadius.circular(15),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

List<PieChartSectionData> showingSections() {
  return List.generate(
    2,
    (i) {
      switch (i) {
        case 0:
          return PieChartSectionData(
            gradient: LinearGradient(colors: TColor.secondaryGrad),
            value: 33,
            title: '',
            radius: 50,
            titlePositionPercentageOffset: 0.55,
            badgeWidget: Text(
              "20,1",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: TColor.white,
              ),
            ),
          );
        case 1:
          return PieChartSectionData(
            color: TColor.white,
            value: 75,
            title: '',
            radius: 42,
            titlePositionPercentageOffset: 0.55,
          );
        default:
          throw Error();
      }
    },
  );
}