import 'package:dashboard_app/Consts/Size.dart';
import 'package:flutter/material.dart';

class TopCreatorsCard extends StatelessWidget {
  final List<Map<String, dynamic>> creators = [
    {"name": "@maddison_c21", "artworks": 9821, "rating": 0.8, "image": "https://i.pravatar.cc/50?img=1"},
    {"name": "@karl.will02", "artworks": 7032, "rating": 0.6, "image": "https://i.pravatar.cc/50?img=2"},
    {"name": "@maddison_c21", "artworks": 9821, "rating": 0.7, "image": "https://i.pravatar.cc/50?img=3"},
    {"name": "@maddison_c21", "artworks": 9821, "rating": 0.75, "image": "https://i.pravatar.cc/50?img=4"},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Color(0xFF1E2451), // Dark blue background
        borderRadius: BorderRadius.circular(15),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Text(
              "Top Creators",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            // Table Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(width: 125, child: Text("Name", style: TextStyle(color: Colors.white54,fontSize: getHeight(context, 1.4)),textAlign: TextAlign.center,)),
                SizedBox(width: 50, child: Text("Artworks", style: TextStyle(color: Colors.white54,fontSize: getHeight(context, 1.4)))),
                SizedBox(width: 50, child: Text("Rating", style: TextStyle(color: Colors.white54,fontSize: getHeight(context, 1.4)))),
              ],
            ),
            Divider(color: Colors.white30),

            // Creator List
            Column(
              children: creators.map((creator) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical:2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Profile Image & Name
                      SizedBox(
                        width: 130,
                        child: Row(
                          children: [
                            CircleAvatar(
                              // backgroundImage: NetworkImage(creator["image"]),
                              radius: 10,
                            ),
                            SizedBox(width: 5),
                            Text(
                              creator["name"],
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500,fontSize: getHeight(context, 1.4)),
                            ),
                          ],
                        ),
                      ),
                      // Artworks Count
                      SizedBox(
                        width: 50,
                        child: Text(
                          creator["artworks"].toString(),
                          style: TextStyle(color: Colors.white,fontSize: getHeight(context, 1.4)),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      // Rating Progress Bar
                      SizedBox(
                        width: 30,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: LinearProgressIndicator(
                            value: creator["rating"],
                            backgroundColor: Colors.white24,
                            valueColor: AlwaysStoppedAnimation<Color>(Colors.purpleAccent),
                            minHeight: getHeight(context, 0.5),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
