import 'package:dashboard_app/Consts/Size.dart';
import 'package:dashboard_app/widgets/ReusableCard.dart';
import 'package:dashboard_app/widgets/aniversaryCard.dart';
import 'package:flutter/material.dart';
import 'package:dashboard_app/Widgets/calenderWidget.dart';


class RightPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double fontSize = MediaQuery.of(context).size.width / 100;

    return Container(
      height:800,
      color: Color(0xff000080),
      padding: EdgeInsets.all(10),
      child: SingleChildScrollView(
        // Handles overflow
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "General 10:00 AM - 7:00 PM",
              style: TextStyle(
                fontSize: getHeight(context, 2),
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            CalendarWidget(),
            SizedBox(height: 20),
            TodaysBirthdayWidget(),
            SizedBox(height: 20),
            TodaysAnniversaryWidget()
            // BirthdayWidget(totalBirthdays: 5, birthdayImages: [])
          ],
        ),
      ),
    );
  }
}
