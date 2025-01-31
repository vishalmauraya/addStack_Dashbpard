import 'package:flutter/material.dart';
import 'package:dashboard_app/Widgets/sideMenu.dart';
import 'package:dashboard_app/Widgets/centreContent.dart';
import 'package:dashboard_app/Widgets/rightPanel.dart';
// import 'package:dashboard_app/Widgets/projectHighlight.dart';
// import 'package:dashboard_app/Widgets/customContainer.dart';


class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  // Keep track of the selected sidebar item
  int selectedIndex = 0;

  // Sidebar items
  final List<String> sidebarItems = [
    'Home',
    'Employees',
    'Attendance',
    'Summary',
    'Information',
  ];

  @override
  Widget build(BuildContext context) {
    // Determine the screen size
    final screenWidth = MediaQuery.of(context).size.width;
    bool isDesktop = screenWidth >= 1000;
    bool isTablet = screenWidth >= 600 && screenWidth < 1000;

    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Side Menu
          if (isDesktop || isTablet)
            SizedBox(
              width: isDesktop ? 250 : 200,
              child: SideMenu(
                selectedIndex: 0,
                onItemSelected: (index) {},
                items: ['Home', 'Employees', 'Attendance', 'Summary', 'Information'],
              ),
            ),
          // Main Content
          Expanded(
            child: MainContent(),
          ),
          // Right Panel
          // if (isDesktop)
          //   SizedBox(
          //     width: 250,
          //     child: RightPanel(),
          //   ),
        ],
      ),

      drawer: isDesktop || isTablet
          ? null
          : Drawer(
        child: SideMenu(
          isMobile: true,
          selectedIndex: selectedIndex,
          onItemSelected: (index) {
            setState(() {
              selectedIndex = index;
            });
            Navigator.of(context).pop(); // Close the drawer
          },
          items: sidebarItems,
        ),
      ),
      appBar: isDesktop || isTablet
          ? null
          : AppBar(
        title: Text('Dashboard'),
      ),
    );
  }
}
