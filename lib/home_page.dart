import 'package:flutter/material.dart';
import 'package:health_app/bmi_calculator.dart';
import 'package:health_app/ibw_calculator.dart';
import 'package:health_app/ambulance_page.dart'; // ✅ Added import for AmbulancePage

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Health Expert',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),

            // Health Tips Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Health Tips',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  _buildHealthTipCard('Drink at least 8 glasses of water daily.'),
                  _buildHealthTipCard('Include more fruits and vegetables in your diet.'),
                  _buildHealthTipCard('Exercise for 30 minutes every day.'),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Quick Actions Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Quick Actions',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: quickActions.length,
                    itemBuilder: (context, index) {
                      final action = quickActions[index];
                      return _buildQuickActionCard(context, action['icon']!, action['label']!);
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Footer
            Padding(
              padding: const EdgeInsets.all(16),
              child: Center(
                child: Wrap(
                  spacing: 16,
                  alignment: WrapAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text('Settings', style: TextStyle(color: Colors.teal)),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text('FAQs', style: TextStyle(color: Colors.teal)),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text('Contact Us', style: TextStyle(color: Colors.teal)),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to build health tip cards
  Widget _buildHealthTipCard(String tip) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 10),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Icon(Icons.lightbulb, color: Colors.teal),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                tip,
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to build quick action cards
  Widget _buildQuickActionCard(BuildContext context, IconData icon, String label) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: () {
          if (label.contains('BMI')) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => BMICalculatorScreen()),
            );
          } else if (label.contains('IBW')) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => IBWCalculatorScreen()),
            );
          }
          // ✅ Added ambulance navigation
          else if (label.contains('Ambulance')) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => AmbulancePage()),
            );
          }
          else {
            print('Tapped: $label');
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 30, color: Colors.teal),
              const SizedBox(height: 8),
              Text(
                label,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// List of quick actions with icons and labels
final List<Map<String, dynamic>> quickActions = [
  {'icon': Icons.calculate, 'label': 'BMI\nCalculator'},
  {'icon': Icons.line_weight, 'label': 'IBW\nCalculator'},
  {'icon': Icons.bloodtype, 'label': 'Blood\nBank'},
  {'icon': Icons.search, 'label': 'Medi\nSearch'},
  {'icon': Icons.local_hospital, 'label': 'Hospital'},
  {'icon': Icons.airport_shuttle, 'label': 'Ambulance'}, // ✅ Already has "Ambulance" label
  {'icon': Icons.medical_services, 'label': 'Find\nDoctors'},
  {'icon': Icons.sick, 'label': 'Disease &\nSymptoms'},
  {'icon': Icons.restaurant, 'label': 'Food &\nNutrition'},
];