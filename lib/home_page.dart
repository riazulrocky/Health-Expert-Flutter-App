import 'package:flutter/material.dart';
import 'package:health_app/blood_bank/blood_bank_page.dart';
import 'package:health_app/bmi_calculator.dart';
import 'package:health_app/disease%20symptoms/disease%20symptoms%20page.dart';
import 'package:health_app/food_&_nutrition/food_nutrition_page.dart';
import 'package:health_app/ibw_calculator.dart';
import 'package:health_app/hospital_page.dart';
import 'package:health_app/ambulance_page.dart';

import 'find_doctors/ai_chat.dart';
import 'find_doctors/find_doctors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const List<Map<String, dynamic>> quickActions = [
    {'icon': Icons.calculate, 'label': 'BMI\nCalculator'},
    {'icon': Icons.line_weight, 'label': 'IBW\nCalculator'},
    {'icon': Icons.local_hospital, 'label': 'Hospital'},
    {'icon': Icons.airport_shuttle, 'label': 'Ambulance'},
    {'icon': Icons.bloodtype, 'label': 'Blood\nBank'},
    {'icon': Icons.restaurant, 'label': 'Food &\nNutrition'},
    {'icon': Icons.medical_services, 'label': 'Find\nDoctors'},
    {'icon': Icons.sick, 'label': 'Disease &\nSymptoms'},
    {'icon': Icons.smart_toy, 'label': 'AI\nChat'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Health Expert',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.teal,
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            SizedBox(height: 20),
            _HealthTipsSection(),
            SizedBox(height: 20),
            _QuickActionsGrid(),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class _HealthTipsSection extends StatelessWidget {
  const _HealthTipsSection();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Health Tips',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          _HealthTipCard(tip: 'Drink at least 8 glasses of water daily.'),
          _HealthTipCard(tip: 'Include more fruits and vegetables in your diet.'),
          _HealthTipCard(tip: 'Exercise for 30 minutes every day.'),
        ],
      ),
    );
  }
}

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
            Expanded(child: Text(tip, style: TextStyle(fontSize: 16))),
          ],
        ),
      ),
    );
  }
}

class _QuickActionsGrid extends StatelessWidget {
  const _QuickActionsGrid();

  @override
  Widget build(BuildContext context) {
    return Padding(
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
            itemCount: HomePage.quickActions.length,
            itemBuilder: (context, index) {
              final action = HomePage.quickActions[index];
              return _QuickActionCard(
                icon: action['icon'],
                label: action['label'],
              );
            },
          ),
        ],
      ),
    );
  }
}

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
              MaterialPageRoute(builder: (_) => BMICalculatorScreen()),
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
          } else if (label.contains('Ambulance')) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => AmbulancePage()),
            );
          } else if (label.contains('Blood')) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => BloodBankPage()),
            );
          } else if (label.contains('Food')) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => FoodNutritionPage()),
            );
          } else if (label.contains('Find')) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => FindDoctorsPage()),
            );
          } else if (label.contains('Disease')) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => DiseaseSymptomsPage()),
            );
          } else if (label.contains('AI')) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => AiChatPage()),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('$label is under development')),
            );
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
