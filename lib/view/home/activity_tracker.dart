import 'package:fitnest/widgets/latest_activity.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:fitnest/utils/color_extention.dart';
import 'package:fitnest/widgets/custom_button.dart';

class ActivityTracker extends StatefulWidget {
  const ActivityTracker({super.key});

  @override
  State<ActivityTracker> createState() => _ActivityTrackerState();
}

class _ActivityTrackerState extends State<ActivityTracker> {
  int touchedIndex = -1;
  String? selectedValue;

  List latestArr = [
    {
      "image": "assets/img/pic_4.png",
      "title": "Drinking 300ml Water",
      "time": "About 1 minutes ago"
    },
    {
      "image": "assets/img/pic_5.png",
      "title": "Eat Snack (Fitbar)",
      "time": "About 3 hours ago"
    },
  ];

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: TColor.white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: TColor.white,
        shadowColor: Colors.black38,
        surfaceTintColor: Colors.transparent,
        leading: CustomButton(
          icon: 'assets/img/back_icon.png',
          onPressed: () {
            Navigator.pop(context);
          }
        ),
        title: Text(
          'Activity Tracker',
          style: TextStyle(
            color: TColor.black,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          CustomButton(
            icon: 'assets/img/more_icon.png',
            onPressed: () {},
            iconSize: 12,
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: media.width,
            padding: EdgeInsets.symmetric(horizontal: media.width * 0.05, vertical: media.width * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Today target
                ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Container(
                    width: double.maxFinite,
                    height: media.width * 0.4,
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    decoration: BoxDecoration(
                      color: TColor.primaryColor2.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Today Target',
                              style: TextStyle(
                                color: TColor.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: Container(
                                margin: const EdgeInsets.all(8),
                                height: 40,
                                width: 40,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(colors: TColor.primaryGrad),
                                  borderRadius: BorderRadius.circular(10)
                                ),
                                child: Image.asset(
                                  'assets/img/plus_icon.png',
                                  width: 15,
                                  height: 15,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: TColor.white,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Row(
                                children: [
                                  Image.asset(
                                    'assets/img/h2o.png',
                                    width: 30,
                                    height: 30,
                                    fit: BoxFit.fitHeight,
                                  ),
                                  const SizedBox(width: 10),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      ShaderMask(
                                        blendMode: BlendMode.srcIn,
                                        shaderCallback: (bounds) {
                                          return LinearGradient(
                                            colors: TColor.primaryGrad,
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight,
                                          ).createShader(Rect.fromLTRB(0, 0, bounds.width, bounds.height));
                                        },
                                        child: Text(
                                          "8L",
                                          style: TextStyle(
                                            color: TColor.white.withOpacity(0.7),
                                            fontWeight: FontWeight.w700,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        "Water Intake",
                                        style: TextStyle(
                                            color: TColor.gray,
                                            fontSize: 16,
                                          ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: TColor.white,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Row(
                                children: [
                                  Image.asset(
                                    'assets/img/shoes.png',
                                    width: 30,
                                    height: 30,
                                    fit: BoxFit.fitHeight,
                                  ),
                                  const SizedBox(width: 10),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      ShaderMask(
                                        blendMode: BlendMode.srcIn,
                                        shaderCallback: (bounds) {
                                          return LinearGradient(
                                            colors: TColor.primaryGrad,
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight,
                                          ).createShader(Rect.fromLTRB(0, 0, bounds.width, bounds.height));
                                        },
                                        child: Text(
                                          "2400",
                                          style: TextStyle(
                                            color: TColor.white.withOpacity(0.7),
                                            fontWeight: FontWeight.w700,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        "Foot Steps",
                                        style: TextStyle(
                                            color: TColor.gray,
                                            fontSize: 16,
                                          ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: media.width * 0.05),
                // Activity progress
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Activity Progress',
                      style: TextStyle(
                        color: TColor.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Container(
                      width: 130,
                      padding: const EdgeInsets.only(left: 12, right: 8),
                      decoration: BoxDecoration(
                        color: TColor.primaryColor1,
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 8,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: selectedValue,
                          isExpanded: true,
                          dropdownColor: Colors.black87,
                          borderRadius: BorderRadius.circular(15),
                          elevation: 8,
                          icon: Icon(
                            Icons.keyboard_arrow_down_rounded, 
                            size: 24, 
                            color: TColor.white,
                          ),
                          style: TextStyle(
                            color: TColor.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                          items: ['Daily', 'Weekly', 'Monthly'].map((String obj) {
                            return DropdownMenuItem<String>(
                              value: obj,
                              child: Text(
                                obj,
                                style: TextStyle(
                                  color: TColor.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            );
                          }).toList(),
                          hint: Text(
                            "Weekly",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: TColor.white, fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                          onChanged: (String? value) {
                            setState(() {
                              selectedValue = value;
                            });
                          },
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: media.width * 0.03),
                Container(
                  height: media.width * 0.5,
                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 0),
                  decoration: BoxDecoration(
                      color: TColor.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 3)],
                  ),
                  child: BarChart(
                    BarChartData(
                      barTouchData: BarTouchData(
                        touchTooltipData: BarTouchTooltipData(
                          getTooltipColor: (group) {
                            return Colors.grey;
                          },
                          tooltipHorizontalAlignment: FLHorizontalAlignment.right,
                          tooltipMargin: 10,
                          getTooltipItem: (group, groupIndex, rod, rodIndex) {
                            String weekDay;
                            switch (group.x) {
                              case 0:
                                weekDay = 'Monday';
                                break;
                              case 1:
                                weekDay = 'Tuesday';
                                break;
                              case 2:
                                weekDay = 'Wednesday';
                                break;
                              case 3:
                                weekDay = 'Thursday';
                                break;
                              case 4:
                                weekDay = 'Friday';
                                break;
                              case 5:
                                weekDay = 'Saturday';
                                break;
                              case 6:
                                weekDay = 'Sunday';
                                break;
                              default:
                                throw Error();
                            }
                            return BarTooltipItem(
                              '$weekDay\n',
                              const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: (rod.toY - 1).toString(),
                                  style: TextStyle(
                                    color: TColor.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                        touchCallback: (FlTouchEvent event, barTouchResponse) {
                          setState(() {
                            if (!event.isInterestedForInteractions || barTouchResponse == null || barTouchResponse.spot == null) {
                              touchedIndex = -1;
                              return;
                            }
                            touchedIndex = barTouchResponse.spot!.touchedBarGroupIndex;
                          });
                        },
                      ),
                      titlesData: FlTitlesData(
                        show: true,
                        rightTitles: AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        topTitles: AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            getTitlesWidget: getTitles,
                            reservedSize: 38,
                          ),
                        ),
                        leftTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: false,
                          ),
                        ),
                      ),
                      borderData: FlBorderData(
                        show: false,
                      ),
                      barGroups: showingGroups(),
                      gridData: FlGridData(show: false),
                    ),
                  ),
                ),
                SizedBox(height: media.width * 0.05),
                // Latest activity
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Latest Activity',
                      style: TextStyle(
                        color: TColor.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'see more',
                        style: TextStyle(
                          color: TColor.gray,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: media.width * 0.03),
                ListView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: latestArr.length,
                  itemBuilder: (context, index) {
                    var wObj = latestArr[index] as Map? ?? {};
                    return InkWell(
                      onTap: () {
                        // Navigator.push(context, MaterialPageRoute(builder: (context) => const Placeholder()));
                      },
                      child: LatestActivity(wObj: wObj),
                    );
                  },
                ),
                SizedBox(height: media.width * 0.05),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget getTitles(double value, TitleMeta meta) {
    var style = TextStyle(
      color: TColor.gray,
      fontWeight: FontWeight.w500,
      fontSize: 12,
    );
    Widget text;
    switch (value.toInt()) {
      case 0:
        text =  Text('Sun', style: style);
        break;
      case 1:
        text =  Text('Mon', style: style);
        break;
      case 2:
        text =  Text('Tue', style: style);
        break;
      case 3:
        text =  Text('Wed', style: style);
        break;
      case 4:
        text =  Text('Thu', style: style);
        break;
      case 5:
        text =  Text('Fri', style: style);
        break;
      case 6:
        text =  Text('Sat', style: style);
        break;
      default:
        text =  Text('', style: style);
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 16,
      child: text,
    );
  }

  List<BarChartGroupData> showingGroups() => List.generate(7, (i) {
    switch (i) {
      case 0:
        return makeGroupData(0, 5, TColor.primaryGrad,
          isTouched: i == touchedIndex
        );
      case 1:
        return makeGroupData(1, 10.5, TColor.secondaryGrad,
          isTouched: i == touchedIndex
        );
      case 2:
        return makeGroupData(2, 5, TColor.primaryGrad,
          isTouched: i == touchedIndex
        );
      case 3:
        return makeGroupData(3, 7.5, TColor.secondaryGrad,
          isTouched: i == touchedIndex
        );
      case 4:
        return makeGroupData(4, 15, TColor.primaryGrad,
          isTouched: i == touchedIndex
        );
      case 5:
        return makeGroupData(5, 5.5, TColor.secondaryGrad,
          isTouched: i == touchedIndex
        );
      case 6:
        return makeGroupData(6, 8.5, TColor.primaryGrad,
          isTouched: i == touchedIndex
        );
      default:
        return throw Error();
    }
  });

  BarChartGroupData makeGroupData(
    int x,
    double y,
    List<Color> barColor, {
    bool isTouched = false,
    double width = 22,
    List<int> showTooltips = const [],
  }) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: isTouched ? y + 1 : y,
          gradient: LinearGradient(
              colors: barColor,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
          width: width,
          borderSide: isTouched
              ? const BorderSide(color: Colors.green)
              : const BorderSide(color: Colors.white, width: 0),
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            toY: 20,
            color: TColor.lightGray,
          ),
        ),
      ],
      showingTooltipIndicators: showTooltips,
    );
  }
}