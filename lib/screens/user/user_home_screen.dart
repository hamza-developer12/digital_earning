import 'package:digital_earning/constants/constants.dart';
import 'package:digital_earning/layouts/user_dashboard_layout.dart';
import 'package:digital_earning/widgets/custom_account_card.dart';
import 'package:digital_earning/widgets/custom_home_card.dart';
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
    final height = MediaQuery.of(context).size.height;
    return  UserDashboardLayout(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            SizedBox(height: height* 0.03,),
            const CustomHomeCard(
              color: Constants.color1,
              text1: "RS 0",
              text2: "RS 2000",
              text3: "Current Earning",
              text4: "Total Earning",
            ),
            SizedBox(height: height * 0.04,),
            const CustomHomeCard(
                color: Constants.color2,
                text1: "0",
                text2: "Rs 2000 ",
                text3: "Member Adding Tips",
                text4: "Earning",
            ),
            SizedBox(height: height * 0.04,),
            const CustomHomeCard(
              color: Constants.color3,
              text1: "0",
              text2: "4",
              text3: "Recent Points",
              text4: "Total Points",
            ),
            SizedBox(height: height * 0.04,),
            const CustomHomeCard(
              color: Constants.color4,
              text1: "7000",
              text2: "2",
              text3: "Pouch",
              text4: "Activated Level",
            ),
             SizedBox(height: height* 0.04),

          ],
        ),
      ),
    );
  }
}

// Card(
// color: Colors.white,
// elevation: 5,
// child: Column(
// children: [
// Container(
// padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
// child: const Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// Column(
// mainAxisAlignment: MainAxisAlignment.start,
// crossAxisAlignment: CrossAxisAlignment.start,
// children:  [
// Text("RS 0", style: TextStyle(color: Colors.red),),
// Text("Current Earning"),
// ],
// ),
// Column(
// mainAxisAlignment: MainAxisAlignment.start,
// crossAxisAlignment: CrossAxisAlignment.end,
// children: [
// Text("RS 2000", style: TextStyle(color: Colors.red),),
// Text("Total Earning"),
// ],
// ),
// ],
// ),
// ),
// AspectRatio(
// aspectRatio: 2.0,
// child: LineChart(
// LineChartData(
//
// lineTouchData: LineTouchData(
// touchTooltipData: LineTouchTooltipData(
// getTooltipColor: (touchedSpot) => Colors.white,
// )
// ),
// borderData: FlBorderData(
// show: false,
// ),
// gridData: const FlGridData(
// show: false,
// ),
// lineBarsData: [
// LineChartBarData(
// dotData: const FlDotData(
// show: false,
// ),
//
// spots: const[
// FlSpot(0, 0),
// FlSpot(1, 2),
// FlSpot(2, 1),
// FlSpot(3, 3),
// FlSpot(4, 1),
// FlSpot(5, 2),
// ],
// color: Colors.red,
// barWidth: 4,
// isCurved: true,
// preventCurveOverShooting: true,
// belowBarData: BarAreaData(
// show: true,
// color: Colors.redAccent.withOpacity(0.7)
// )
// )
// ],
// titlesData: const FlTitlesData(
// show: false,
// ),
// ),
// ),
// ),
// ],
// ),
// )