import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dashboard_app/widgets/WorkshopWidget.dart';

class SideMenu extends StatelessWidget {
  final bool isMobile;
  final int selectedIndex;
  final Function(int) onItemSelected;
  final List<String> items;

  SideMenu({
    this.isMobile = false,
    required this.selectedIndex,
    required this.onItemSelected,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    double avatarRadius = isMobile ? 20 : 30;
    double fontSize = isMobile ? 8 : 14;

    return Container(
      height: double.infinity,
      width: 220, // Ensuring fixed width for better alignment
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("asset/logo.png", height: 50),
            Divider(color: Colors.grey),
            CircleAvatar(
              radius: avatarRadius,
              backgroundColor: Colors.orange,
              child: CircleAvatar(
                radius: avatarRadius - 3,
                backgroundImage: AssetImage("asset/logo.png"),
              ),
            ),
            SizedBox(height: 5),
            Text(
              "Pooja Mishra",
              style: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              margin: EdgeInsets.all(5),
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.lightBlue),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Text(
                "Admin",
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                ),
              ),
            ),
            Divider(color: Colors.grey),

            // Drawer Items
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: items.length,
              itemBuilder: (context, index) {
                bool isSelected = selectedIndex == index;
                return InkWell(
                  onTap: () => onItemSelected(index),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        bottomLeft: Radius.circular(25),
                      ),
                      color: isSelected ? Colors.grey.shade300 : Colors.white,
                    ),
                    child: Row(
                      children: [
                        Icon(
                          _getIconForItem(items[index]),
                          color: isSelected ? Colors.black : Colors.blue,
                        ),
                        SizedBox(width: 20),
                        Text(
                          items[index],
                          style: GoogleFonts.aBeeZee(
                            textStyle: TextStyle(
                              fontSize: fontSize,
                              color: Colors.black,
                              fontWeight:
                              isSelected ? FontWeight.bold : FontWeight.normal,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),

            // Workspaces Widget
            WorkspacesWidget(),
            SizedBox(height: 160,),
            Container(
              padding: EdgeInsets.all(10),
              child: Column(
                spacing: 10,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    spacing:20,
                    children: [
                    Icon(Icons.settings_sharp,color: Colors.black,),
                    Text("Settings",style: GoogleFonts.lato(textStyle: TextStyle(fontWeight: FontWeight.bold,fontSize: 14)),)
                  ],),

                  Row(
                    spacing:20,
                    children: [
                      Icon(Icons.exit_to_app,color: Colors.black,),
                      Text("Logout",style: GoogleFonts.lato(textStyle: TextStyle(fontWeight: FontWeight.bold,fontSize: 14)),)
                    ],),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  IconData _getIconForItem(String item) {
    switch (item) {
      case 'Home':
        return Icons.home;
      case 'Employees':
        return Icons.people;
      case 'Attendance':
        return Icons.timer;
      case 'Summary':
        return Icons.analytics;
      case 'Information':
        return Icons.info;
      default:
        return Icons.circle;
    }
  }
}
