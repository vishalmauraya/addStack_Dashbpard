import 'package:dashboard_app/Consts/Size.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // For date formatting

class CalendarWidget extends StatefulWidget {
  const CalendarWidget({Key? key}) : super(key: key);

  @override
  State<CalendarWidget> createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  DateTime _currentDate = DateTime.now();
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getHeight(context, 34),
      width: getWidth(context, 35),
      child: Card( // Use a Card for the rounded corners and shadow
        elevation: 4,
        color: Colors.white,// Add a subtle shadow
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10), // Rounded corners
        ),
        child: Column(
          children: [
            _buildHeader(),
            _buildWeekDays(),
            _buildDays(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(padding:EdgeInsets.all(2),child: _buildMonthDropdown(),decoration: BoxDecoration(color: Colors.blue.shade50,borderRadius: BorderRadius.circular(15)),), // Month dropdown
        _buildYearDropdown(), // Year dropdown
      ],
    );
  }

  Widget _buildMonthDropdown() {
    return DropdownButton<String>(
      value: DateFormat('MMM').format(_currentDate),
      onChanged: (String? newValue) {
        if (newValue != null) {
          setState(() {
            _currentDate = DateTime(_currentDate.year, DateFormat('MMM').parse(newValue).month, 1);
          });
        }
      },
      isDense: true,
      isExpanded: false,
      items: [
        for (int i = 1; i <= 12; i++) // Loop through months 1 to 12
          DropdownMenuItem<String>(
            value: DateFormat('MMM').format(DateTime(DateTime.now().year, i, 1)), // Get month name
            child: Text(DateFormat('MMM').format(DateTime(DateTime.now().year, i, 1))),
          ),
      ],
      underline: Container(color: Colors.black,),
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      icon:  Icon(Icons.arrow_drop_down,color: Colors.black,),
    );
  }

  Widget _buildYearDropdown() {
    int currentYear = DateTime.now().year;
    int startYear = currentYear - 10; // Start from 10 years ago
    int endYear = currentYear + 10;   // End 10 years in the future

    List<int> years = List.generate(endYear - startYear + 1, (index) => startYear + index);

    return DropdownButton<int>(
      value: _currentDate.year, // Current year as initial value
      onChanged: (int? newValue) {
        if (newValue != null) {
          setState(() {
            _currentDate = DateTime(newValue, _currentDate.month, 1);
          });
        }
      },
      items: years.map<DropdownMenuItem<int>>((int value) {
        return DropdownMenuItem<int>(
          value: value,
          child: Text(value.toString()),
        );
      }).toList(),
      underline: Container(), // Remove underline
      style: const TextStyle(
        color: Colors.grey, // Text color
      ),
      icon: const Icon(Icons.arrow_drop_down), // Customize icon
    );
  }

  Widget _buildWeekDays() {
    return Row(
      children: [
        for (var weekday in ['Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa', 'Su'])
          Expanded(
            child: Center(
              child: Text(
                weekday,
                style: TextStyle(color: Colors.grey,fontSize: getHeight(context, 1.4)),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildDays() {
    final firstDayOfMonth = DateTime(_currentDate.year, _currentDate.month, 1);
    final daysInMonth = DateTime(_currentDate.year, _currentDate.month + 1, 0).day;
    final firstDayWeekday = firstDayOfMonth.weekday;

    return Expanded(
      child: GridView.builder(
        padding: EdgeInsets.zero,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 7,
        ),
        itemCount: daysInMonth + firstDayWeekday - 1, // Account for offset
        itemBuilder: (context, index) {
          if (index < firstDayWeekday - 1) {
            return Container(); // Empty cells before the first day
          } else {
            final day = index - firstDayWeekday + 2; // Calculate day number
            final date = DateTime(_currentDate.year, _currentDate.month, day);
            final isSelected = _selectedDate.year == date.year &&
                _selectedDate.month == date.month &&
                _selectedDate.day == date.day;

            return GestureDetector(
              onTap: () {
                setState(() {
                  _selectedDate = date;
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  color: isSelected ? Colors.blue : Colors.transparent,
                  shape: BoxShape.circle, // Make the selection indicator a circle
                ),
                child: Center(
                  child: Text(
                    day.toString(),
                    style: TextStyle(
                      color: isSelected ? Colors.white : Colors.black,
                        fontSize: getHeight(context, 1.4)
                    ),
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}