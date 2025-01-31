import 'package:dashboard_app/Consts/Size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TodaysBirthdayWidget extends StatefulWidget {
  @override
  _TodaysBirthdayWidgetState createState() => _TodaysBirthdayWidgetState();
}

class _TodaysBirthdayWidgetState extends State<TodaysBirthdayWidget> {
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
          // Sparkle and title
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'asset/sparkle.svg', // Ensure this file exists in your assets
                height: 24,
                width: 24,
              ),
              SizedBox(width: 8),
              Text(
                "Today's Birthday",
                textAlign: TextAlign.center,
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
                          backgroundColor: isSelected ? Colors.purple[600] : Colors.white,
                          child: CircleAvatar(
                            radius: isSelected ? 29 : 24,
                            // Replace with actual avatar
                          ),
                        ),
                        Positioned(
                          top: 5,
                          right: -5,
                          child: CircleAvatar(
                            radius: 12,
                            backgroundColor: Colors.red,
                            child: Icon(
                              Icons.cake,
                              size: 16,
                              color: Colors.white,
                            ),
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
                Text("Total",style: TextStyle(color: Colors.purple),),
                Padding(
                  padding: EdgeInsets.only(left: getWidth(context, 4)),
                  child: Row(children: [SizedBox(height: 15,child: VerticalDivider(color: Colors.white),),
                    Text("10", style: TextStyle(color: Colors.white)),
                    SizedBox(height: 15,child: VerticalDivider(color: Colors.white),),],),
                )


              ],
            ),
          ),
          // Birthday Wishing button
          Center(
            child: ElevatedButton(
              onPressed: () {
                // Add your onPressed functionality here
              },
              child: Row(
                spacing: 5,
                children: [
                  Icon(Icons.telegram_sharp,color: Colors.white,),
                  Text("Birthday Wishing",style: TextStyle(color: Colors.white,fontSize: 12),),
                ],
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple[900],
                disabledBackgroundColor: Colors.white,
                side: BorderSide(width: 1)

              ),
            ),
          ),
        ],
      ),
    );
  }
}
