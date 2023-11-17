import 'package:coders/consts/colors.dart';
import 'package:coders/consts/styles.dart';
import 'package:flutter/material.dart';

class GoldenEmployees extends StatelessWidget {
  const GoldenEmployees({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Employee> employees = [
      Employee('John Doe', 'Marketing', 'assets/images/add-pic.png', 500, 3),
      Employee('Jane Smith', 'Finance', 'assets/images/add-pic.png', 600, 4),
      Employee('Jane Smith', 'HR', 'assets/images/add-pic.png', 300, 4),
      Employee('Jane Smith', 'HR', 'assets/images/add-pic.png', 300, 4),
      // Add more employees...
    ];
    employees.sort((a, b) => b.points.compareTo(a.points));
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Golden Member",
          style: TextStyle(fontSize: 17, fontFamily: AppStyles.semibold),
        ),
      ),
      body: ListView.builder(
        itemCount: employees.length,
        itemBuilder: (BuildContext context, int index) {
          return _buildEmployeeItem(employees[index]);
        },
      ),
    );
  }

  Widget _buildEmployeeItem(Employee employee) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Stack(
          children: [
            Column(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage(employee.imagePath),
                ),
                SizedBox(height: 8),
                Text(
                  employee.name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 4),
                Text(employee.department),
                SizedBox(height: 4),
                Text('Level ${employee.level}'),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Points',
                      style: TextStyle(
                          color: AppColors.secondaryColor,
                          fontFamily: AppStyles.semibold),
                    ),
                    Text(
                      '${employee.points}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: AppColors.mainColor, // Golden color for points
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Employee {
  final String name;
  final String department;
  final String imagePath;
  final int points;
  final int level;

  Employee(this.name, this.department, this.imagePath, this.points, this.level);
}
