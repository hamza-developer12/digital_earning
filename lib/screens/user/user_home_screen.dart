import 'package:digital_earning/screens/user/user_dashboard_layout.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';


class UserHomeScreen extends StatefulWidget {
  const UserHomeScreen({super.key});

  @override
  State<UserHomeScreen> createState() => _UserHomeScreenState();
}

class _UserHomeScreenState extends State<UserHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return UserDashboardLayout(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            Card(
              color: Colors.white,
              elevation: 5,
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                         Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:  [
                           Text("RS 0", style: TextStyle(color: Colors.red),),
                            Text("Current Earning"),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text("RS 2000", style: TextStyle(color: Colors.red),),
                            Text("Total Earning"),
                          ],
                        ),
                      ],
                    ),
                  ),
                  AspectRatio(
                    aspectRatio: 2.0,
                    child: LineChart(
                     LineChartData(

                       lineTouchData: LineTouchData(
                         touchTooltipData: LineTouchTooltipData(
                           getTooltipColor: (touchedSpot) => Colors.white,
                         )
                       ),
                       borderData: FlBorderData(
                         show: false,
                       ),
                       gridData: const FlGridData(
                         show: false,
                       ),
                       lineBarsData: [
                         LineChartBarData(
                           dotData: const FlDotData(
                             show: false,
                           ),

                           spots: const[
                             FlSpot(0, 0),
                             FlSpot(1, 2),
                             FlSpot(2, 1),
                             FlSpot(3, 3),
                             FlSpot(4, 1),
                             FlSpot(5, 2),
                           ],
                          color: Colors.red,
                           barWidth: 4,
                           isCurved: true,
                           preventCurveOverShooting: true,
                           belowBarData: BarAreaData(
                             show: true,
                             color: Colors.redAccent.withOpacity(0.7)
                           )
                         )
                       ],
                       titlesData: const FlTitlesData(
                         show: false,
                       ),
                     ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
