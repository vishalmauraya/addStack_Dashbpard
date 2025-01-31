import 'package:dashboard_app/Consts/Size.dart';
import 'package:dashboard_app/widgets/combinedContainers.dart';
import 'package:dashboard_app/widgets/performanceChart.dart';
import 'package:flutter/material.dart';
import 'package:dashboard_app/widgets/responsiveContent.dart';
import 'package:dashboard_app/widgets/projectHighlight.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:dashboard_app/widgets/rightPanel.dart';

class MainContent extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    double baseFontSize = MediaQuery.of(context).size.width / 100;
    final screenWidth = MediaQuery.of(context).size.width;
    bool isDesktop = screenWidth >= 1000;
    bool isTablet = screenWidth >= 600 && screenWidth < 1000;

    return Padding(
      padding: EdgeInsets.only(left: 8.0,top: 10),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end
          ,
          children: [
            // 🔹 Top Row: Search bar, icons, and profile
            Column(
          crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Home",
                      style: GoogleFonts.aBeeZee(
                        textStyle: TextStyle(color: Colors.white70,fontSize: getHeight(context, 4)),
                      ),
                    ),
                    Row(
                      children: [
                        SearchBar(fontSize: baseFontSize * 1.6),
                        SizedBox(width:  getWidth(context, 2.5)),
                        Icon(Icons.message_outlined, color: Colors.white),
                        SizedBox(width:  getWidth(context, 2)),
                        Badge(
                          child: Icon(Icons.notifications_active),
                          backgroundColor: Colors.orange,
                        ),
                        SizedBox(width: getWidth(context, 2)),
                        SvgPicture.asset(
                          "asset/switchoff.svg",
                          height: 15,
                          width: 30,
                          color: Colors.white,
                        ),
                        SizedBox(width: getWidth(context, 4)),
                        CircleAvatar(backgroundColor: Colors.white),
                        SizedBox(width: getWidth(context, 3)),

                      ],
                    ),
                  ],
                ),
                SizedBox(height: getHeight(context, 1)),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(

                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ProjectHighlight(fontSize: baseFontSize),
                        SizedBox(height: 20),
                        CombinedContainers(),
                        SizedBox(height: 10,),
                        PerformanceChart()
                        // ResponsiveContent(fontSize: baseFontSize),
                      ],
                    ),
                    if (isDesktop)
                      SizedBox(width:250,child: RightPanel())
                  ],
                )

              ],
            ),

            SizedBox(height: 20),

            // 🔹 Calendar Widget Below Row
            // CalendarWidget(),



          ],
        ),
      ),
    );
  }
}

// 🔹 Search Bar Widget
class SearchBar extends StatelessWidget {
  final double fontSize;

  SearchBar({required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      child: TextField(
        style: TextStyle(color: Colors.white, fontSize: fontSize),
        decoration: InputDecoration(
          filled: true,
          fillColor: Color(0xff000080),
          hintText: "Search",
          hintStyle: TextStyle(color: Colors.white54, fontSize: fontSize),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          // Move the search icon to the right
          suffixIcon: Icon(Icons.search, color: Colors.white),
        ),
      ),
    );
  }
}


// 🔹 Calendar Widget Below Row

