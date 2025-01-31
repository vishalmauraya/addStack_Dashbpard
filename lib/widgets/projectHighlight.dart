import 'package:dashboard_app/Consts/Size.dart';
import 'package:flutter/material.dart';
class ProjectHighlight extends StatelessWidget {
  final double fontSize;

  ProjectHighlight({required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Container(
      height:getHeight(context, 30),
      width:getWidth(context, 49),

      // Adjust as needed
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.bottomLeft,
        end: Alignment.topRight,
        colors: [Colors.purple.shade900,Colors.blue, Colors.pink.shade400], // Blue to Pink gradient
      ),
        borderRadius: BorderRadius.circular(15),
      ),
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Ethereum 2.0",
            style: TextStyle(
              fontSize: fontSize * 1.2,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 10),
          Text(
            "Top Rating Project",
            style: TextStyle(
              fontSize: fontSize * 1.5,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Spacer(),
          ElevatedButton(
            onPressed: () {},
            child: Text("Learn More."),
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xff000080),
              textStyle: TextStyle(color: Colors.purple),
              side: BorderSide(color: Color(0xff000080)
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8), // Border radius for rounded corners
              ),
            ),
          )

        ],
      ),
    );
  }
}
