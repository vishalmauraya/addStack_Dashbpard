import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class PerformanceChart extends StatefulWidget {
  @override
  State<PerformanceChart> createState() => _PerformanceChartState();
}

class _PerformanceChartState extends State<PerformanceChart> {
  List<FlSpot> _pendingData = [
    FlSpot(0, 20),
    FlSpot(1, 30),
    FlSpot(2, 15),
    FlSpot(3, 45),
    FlSpot(4, 30),
    FlSpot(5, 25),
  ];

  List<FlSpot> _projectDoneData = [
    FlSpot(0, 10),
    FlSpot(1, 15),
    FlSpot(2, 30),
    FlSpot(3, 40),
    FlSpot(4, 25),
    FlSpot(5, 30),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 495,
      height: 300, // Increased height
      padding: const EdgeInsets.all(16), // Added padding
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12), // Rounded corners
        color: Colors.white, // Background color
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  const Text(
                    'Over All Performance',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  _buildLegendItem(color: const Color(0xFFF28482), label: 'Pending'),
                  const SizedBox(width: 32),
                  _buildLegendItem(color: const Color(0xFF6A82FB), label: 'Project Done'),
                ],
              ),
            ],
          ),
          Text(
            'The Years',
            style: TextStyle(
              color: Colors.black,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 16),
          Expanded( // Use Expanded to fill available space
            child: LineChart(
              LineChartData(
                gridData: FlGridData(
                  show: false,
                  drawVerticalLine: false,
                  horizontalInterval: 10,
                  verticalInterval: 1,
                  getDrawingHorizontalLine: (value) {
                    return FlLine(
                      color: const Color(0xff4e4965), // Grid line color
                      strokeWidth: 1,
                    );
                  },
                  getDrawingVerticalLine: (value) {
                    return FlLine(
                      color: const Color(0xff4e4965), // Grid line color
                      strokeWidth: 1,
                    );
                  },
                ),
                titlesData: FlTitlesData(
                  show: true,
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 30,
                      interval: 1,// Increased reserved size
                      getTitlesWidget: (value, meta) {
                        String text;
                        switch (value.toInt()) {
                          case 0:
                            text = '2015';
                            break;
                          case 1:
                            text = '2016';
                            break;
                          case 2:
                            text = '2017';
                            break;
                          case 3:
                            text = '2018';
                            break;
                          case 4:
                            text = '2019';
                            break;
                          case 5:
                            text = '2020';
                            break;
                          default:
                            text = '';
                        }
                        return Padding( // Added padding for better spacing
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            text,
                            style: const TextStyle(
                              color: Color(0xff75729e),
                              fontWeight: FontWeight.bold,
                              fontSize: 14, // Increased font size
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      interval: 10,
                      reservedSize: 40, // Increased reserved size
                      getTitlesWidget: (value, meta) => Padding( // Added padding
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Text(
                          value.toInt().toString(),
                          style: const TextStyle(
                            color: Color(0xff75729e),
                            fontWeight: FontWeight.bold,
                            fontSize: 10, // Increased font size
                          ),
                        ),
                      ),
                    ),
                  ),
                  topTitles: AxisTitles( // Hide top titles
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  rightTitles: AxisTitles( // Hide right titles
                    sideTitles: SideTitles(showTitles: false),
                  ),
                ),
                borderData: FlBorderData(
                  show: true,
                  border: const Border(
                    bottom: BorderSide(
                      color: Color(0xff4e4965), // Border color
                      width: 1,
                    ),
                    left: BorderSide(
                      color: Color(0xff4e4965), // Border color
                      width: 1,
                    ),
                    right: BorderSide(color: Colors.transparent),
                    top: BorderSide(color: Colors.transparent),
                  ),
                ),
                minX: 0,
                maxX: 5,
                minY: 0,
                maxY: 50,
                lineBarsData: [
                  LineChartBarData(
                    spots: _pendingData,
                    isCurved: true,
                    color: const Color(0xFFF28482), // Updated color
                    barWidth: 2,
                      shadow: Shadow( // Add shadow to the line
                        color: const Color(0xFFF28482).withOpacity(0.5), // Shadow color and opacity
                        offset: Offset(0, 5), // Offset for the shadow
                        blurRadius: 3, // Blur radius for the shadow
                      ),
                  // Increased bar width
                    dotData:FlDotData(
                      show: false
                      ,
                      getDotPainter: (FlSpot spot, double xPercentage, LineChartBarData bar, int index, {double? size}) {
                        return FlDotCirclePainter(
                          color: const Color(0xFF6A82FB),
                          radius: size ?? 4, // Ensure the size is properly handled
                        );
                      },
                    )

                  ),
                  LineChartBarData(
                    spots: _projectDoneData,
                    isCurved: true,
                    color: const Color(0xFF6A82FB), // Updated color
                    barWidth:2,
                      shadow: Shadow( // Add shadow to the line
                        color: const Color(0xFFF28482).withOpacity(0.5), // Shadow color and opacity
                        offset: Offset(0, 5), // Offset for the shadow
                        blurRadius: 4, // Blur radius for the shadow
                      ),// Increased bar width
                    dotData: FlDotData(
                      show: false,
                      getDotPainter: (FlSpot spot, double xPercentage, LineChartBarData bar, int index, {double? size}) {
                        return FlDotCirclePainter(
                          color: const Color(0xFF6A82FB),
                          radius: size ?? 4, // Ensure the size is properly handled
                        );
                      },
                    )

                  ),
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }

  Widget _buildLegendItem({required Color color, required String label}) {
    return Row(
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
        ),
        const SizedBox(width: 5),
        Text(
          label,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 8
          ),
        ),
      ],
    );
  }
}