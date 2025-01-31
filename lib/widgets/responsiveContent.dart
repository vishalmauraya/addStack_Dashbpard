import 'package:flutter/material.dart';

class ResponsiveContent extends StatelessWidget {
  final double fontSize;

  ResponsiveContent({required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 600) {
          return Row(
            children: [
              Expanded(
                child: Text(
                  "Project List",
                  style: TextStyle(
                    fontSize: fontSize * 1.8,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                child: Text(
                  "Top Creator",
                  style: TextStyle(
                    fontSize: fontSize * 1.8,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          );
        } else {
          // Stack vertically on small screens
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Project List",
                style: TextStyle(
                  fontSize: fontSize * 1.8,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Top Creator",
                style: TextStyle(
                  fontSize: fontSize * 1.8,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          );
        }
      },
    );
  }
}
