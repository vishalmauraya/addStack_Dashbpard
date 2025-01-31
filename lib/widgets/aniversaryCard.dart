import 'package:dashboard_app/Consts/Size.dart'; // Assuming this contains your getWidth function
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TodaysAnniversaryWidget extends StatefulWidget {
  @override
  _TodaysAnniversaryWidgetState createState() => _TodaysAnniversaryWidgetState();
}

class _TodaysAnniversaryWidgetState extends State<TodaysAnniversaryWidget> {
  int selectedIndex = 1; // Initially set the middle one as selected

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.black54,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Hearts and title
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'asset/sparkle.svg', // Replace with an anniversary icon
                height: 24,
                width: 24,
              ),
              SizedBox(width: 8),
              Text(
                "Today's Anniversaries", // Change title
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 8),
              SvgPicture.asset(
                'asset/sparkle.svg', // Duplicate for symmetry
                height: 24,
                width: 24,
              ),
            ],
          ),
          SizedBox(height: 16),
          // Horizontally scrollable avatars
          SizedBox(
            height: 80, // Adjust height to fit avatar size
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10, // Adjust the number of avatars
              itemBuilder: (context, index) {
                bool isSelected = selectedIndex == index;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        CircleAvatar(
                          radius: isSelected ? 30 : 25,
                          backgroundColor: isSelected ? Colors.pink[400] : Colors.white,
                          child: CircleAvatar(
                            radius: isSelected ? 29 : 24, // Replace with actual avatar
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Total", style: TextStyle(color: Colors.pink)), // Change color
                Padding(
                  padding: EdgeInsets.only(left: getWidth(context, 4)),
                  child: Row(children: [
                    SizedBox(height: 15, child: VerticalDivider(color: Colors.white)),
                    Text("10", style: TextStyle(color: Colors.white)),
                    SizedBox(height: 15, child: VerticalDivider(color: Colors.white)),
                  ]),
                ),
              ],
            ),
          ),
          // Anniversary Wishing button
          Center(
            child: ElevatedButton(
              onPressed: () {
                // Add your onPressed functionality here
              },
              child: Row(
                spacing: 5,
                children: [
                  Icon(Icons.telegram_sharp, color: Colors.white),
                  Text("Anniversary Wishes", style: TextStyle(color: Colors.white,fontSize: 12)), // Change text
                ],
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink[900], // Change color
                disabledBackgroundColor: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}