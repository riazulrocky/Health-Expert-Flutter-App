import 'package:flutter/material.dart';
import 'package:health_app/bmi_calculator.dart';
import 'package:health_app/ibw_calculator.dart';
import 'package:health_app/hospital_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // ✅ Make quickActions static const
  static const List<Map<String, dynamic>> quickActions = [
    // ✅ Use const for each map
    {'icon': Icons.calculate, 'label': 'BMI\nCalculator'},
    {'icon': Icons.line_weight, 'label': 'IBW\nCalculator'},
    {'icon': Icons.local_hospital, 'label': 'Hospital'},
    {'icon': Icons.airport_shuttle, 'label': 'Ambulance'},
    {'icon': Icons.bloodtype, 'label': 'Blood\nBank'},
    {'icon': Icons.restaurant, 'label': 'Food &\nNutrition'},
    {'icon': Icons.medical_services, 'label': 'Find\nDoctors'},
    {'icon': Icons.sick, 'label': 'Disease &\nSymptoms'},
    {'icon': Icons.search, 'label': 'Medi\nSearch'},
  ];

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
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Health Tips',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  _HealthTipCard(tip: 'Drink at least 8 glasses of water daily.'),
                  _HealthTipCard(tip: 'Include more fruits and vegetables in your diet.'),
                  _HealthTipCard(tip: 'Exercise for 30 minutes every day.'),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Quick Actions Section
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Quick Actions',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  _QuickActionsGrid(),
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
                  children: const [
                    TextButton(
                      onPressed: null,
                      child: Text('Settings', style: TextStyle(color: Colors.teal)),
                    ),
                    TextButton(
                      onPressed: null,
                      child: Text('FAQs', style: TextStyle(color: Colors.teal)),
                    ),
                    TextButton(
                      onPressed: null,
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
}

// ✅ Helper widget for health tip cards
class _HealthTipCard extends StatelessWidget {
  final String tip;

  const _HealthTipCard({required this.tip});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 10),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Icon(Icons.lightbulb, color: Colors.teal),
            SizedBox(width: 10),
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
}

// ✅ Helper widget for quick action grid
class _QuickActionsGrid extends StatelessWidget {
  const _QuickActionsGrid();

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: HomePage.quickActions.length,
      itemBuilder: (context, index) {
        final action = HomePage.quickActions[index];
        return _QuickActionCard(icon: action['icon'] as IconData, label: action['label'] as String);
      },
    );
  }
}

// ✅ Helper widget for quick action card
class _QuickActionCard extends StatelessWidget {
  final IconData icon;
  final String label;

  const _QuickActionCard({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: InkWell(
        onTap: () {
          if (label.contains('BMI')) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => BMICalculatorScreen()), // Avoid const here if not needed
            );
          } else if (label.contains('IBW')) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => IBWCalculatorScreen()),
            );
          } else if (label.contains('Hospital')) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => HospitalPage()),
            );
          } else {
            print('Tapped: $label');
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 30, color: Colors.teal),
              SizedBox(height: 8),
              Text(
                label,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}