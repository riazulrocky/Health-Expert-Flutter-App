import 'package:flutter/material.dart';

class HospitalPage extends StatelessWidget {
  HospitalPage({Key? key}) : super(key: key);

  // Emergency banner widget
  Widget _buildEmergencyBanner(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: const LinearGradient(
          colors: [Colors.red, Colors.redAccent],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.red.withOpacity(0.3),
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: ListTile(
        leading: const Icon(Icons.add_call, color: Colors.white, size: 32),
        title: const Text(
          '999',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        subtitle: const Text(
          'NATIONAL EMERGENCY SERVICE\nCall for ambulance, police, or fire',
          style: TextStyle(
            fontSize: 14,
            color: Colors.white70,
          ),
        ),
      ),
    );
  }

  // Static hospital data
  final List<Map<String, String>> _hospitals = [
    {
      'name': 'Aalok Health Care Ltd',
      'type': 'Diagnostic Center',
      'location': '21, Darus Salam Road, Mirpur - 1, Dhaka'
    },
    {
      'name': 'Apollo Hospitals Dhaka',
      'type': 'Multi-Specialty Hospital',
      'location': 'Plot # 81, Block # E, Bashundhara, Dhaka'
    },
    {
      'name': 'Square Hospitals Ltd',
      'type': 'Private Hospital',
      'location': '18F, Bir Uttam A.K. Khandaker Road, Dhaka'
    },
    {
      'name': 'Bangladesh Specialized Hospital',
      'type': 'General Hospital',
      'location': 'Nikunja-2, Khilkhet, Dhaka'
    },
    {
      'name': 'Labaid Specialized Hospital',
      'type': 'Private Hospital',
      'location': 'A/2, Kuril, Dhaka'
    },
    {
      'name': 'United Hospital Limited',
      'type': 'Tertiary Care Hospital',
      'location': 'Plot 15, Rd No 71, Gulshan-2, Dhaka'
    },
    {
      'name': 'Holy Family Red Crescent Medical College',
      'type': 'Medical College Hospital',
      'location': 'Tejgaon, Dhaka'
    },
    {
      'name': 'Ibn Sina Diagnostic Center',
      'type': 'Diagnostic Center',
      'location': 'House 15, Road 8/A, Baridhara, Dhaka'
    },
    {
      'name': 'Evercare Hospital Dhaka',
      'type': 'Critical Care Hospital',
      'location': 'Plot 81, Block E, Bashundhara R/A, Dhaka'
    },
    {
      'name': 'Bangabandhu Sheikh Mujib Medical University',
      'type': 'Medical University Hospital',
      'location': 'Shahbag, Dhaka'
    },
  ];

  // Build individual hospital cards
  Widget _buildHospitalCard(BuildContext context, Map<String, String> hospital) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              hospital['name']!,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              hospital['type']!,
              style: TextStyle(
                fontSize: 14,
                color: Colors.teal.shade700,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.location_on, size: 16, color: Colors.teal),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    hospital['location']!,
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Hospitals & Diagnostic Centers',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.teal,
        centerTitle: true,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white), // White back arrow
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.teal.shade50, Colors.white],
          ),
        ),
        child: ListView(
          children: [
            _buildEmergencyBanner(context),
            ..._hospitals.map((hospital) => _buildHospitalCard(context, hospital)),
          ],
        ),
      ),
    );
  }
}