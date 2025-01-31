import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final double fontSize;

  CustomContainer({required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      // Adjust the height as needed
      height: 150,
      decoration: BoxDecoration(
        color: Colors.orangeAccent,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Custom Container Title',
            style: TextStyle(
              fontSize: fontSize * 1.2,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'This is your custom container content. Adjust it as needed.',
            style: TextStyle(
              fontSize: fontSize * 0.9,
              color: Colors.white,
            ),
          ),
          Spacer(),
          ElevatedButton(
            onPressed: () {
              // Add your onPressed functionality here
            },
            child: Text('Action'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              // onPrimary: Colors.orangeAccent,
            ),
          ),
        ],
      ),
    );
  }
}
