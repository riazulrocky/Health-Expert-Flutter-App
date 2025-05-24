import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Required for calling

class ArmPage extends StatelessWidget {
  ArmPage({super.key});

  final List<Map<String, String>> _doctors = [
    {
      'name': 'Dr. A H M Jamal',
      'qualification': 'MBBS, MS',
      'specialty': 'Orthopaedic Surgeon',
      'contact': '0248031065',
      'location': 'Mirpur',
      'clinic': 'Medison Diagnostic Center'
    },
    {
      'name': 'Dr. A H M Rezaul Haque',
      'qualification': 'MBBS, MS(ortho)',
      'specialty': 'Orthopaedic specialist',
      'contact': '10602',
      'location': 'Gendaria',
      'clinic': 'Asgar Ali Hospital'
    },
    {
      'name': 'Dr. A K M Nizamul Islam',
      'qualification': 'MBBS, D-ortho',
      'specialty': 'Orthopaedic specialist',
      'contact': '02143984',
      'location': 'Mirpur Road',
      'clinic': 'Islam Specialized Laser Physiotherapy Hospital'
    },
    {
      'name': 'Dr. A K M Shahjahan',
      'qualification': 'MBBS, BCS, D-ortho, MS',
      'specialty': 'Orthopaedic Surgeon',
      'contact': '10615',
      'location': 'Savar',
      'clinic': 'Ibn Sina Diagnostic & Consultation Center'
    },
    {
      'name': 'Dr. A M Fachiul Alam',
      'qualification': 'MBBS, BCS, MS',
      'specialty': 'Orthopaedic specialist',
      'contact': '88029641146',
      'location': 'Panthapath',
      'clinic': 'Fast Care Hospital'
    },
    {
      'name': 'Dr. A M Fasiul Alam',
      'qualification': 'MBBS, BCS(Health), MS',
      'specialty': 'Orthopaedic Surgeon',
      'contact': '10604',
      'location': 'Shyamoli',
      'clinic': 'Trauma Center'
    },
    {
      'name': 'Dr. A N M Bazlur Rashid',
      'qualification': 'MBBS, D-ortho(D.U)',
      'specialty': 'Orthopaedic Surgeon',
      'contact': '042160071',
      'location': 'Jail Road',
      'clinic': 'Ibn Sina Diagnostic & Consultation Center'
    },
    {
      'name': 'Dr. A R Shimul',
      'qualification': 'MBBS, MS(ortho)',
      'specialty': 'Orthopaedic Surgeon',
      'contact': '01837317000',
      'location': 'Mohammadpur',
      'clinic': 'Dhaka Diagnostic Center'
    },
    {
      'name': 'Dr. A S M Abdullah',
      'qualification': 'MBBS, D-ortho',
      'specialty': 'Orthopaedic Surgeon',
      'contact': '0721861401',
      'location': 'Hospital Road',
      'clinic': 'Padma Clinic & Diagnostic Center'
    },
    {
      'name': 'Dr. A T M Rezaul Karim',
      'qualification': 'MBBS, D-ortho, MS(ortho)',
      'specialty': 'Orthopaedic specialist',
      'contact': '031627913',
      'location': 'Mehedibag',
      'clinic': 'Sigma Lab Limited'
    },
  ];

  Widget _buildDoctorCard(BuildContext context, Map<String, String> doctor) {
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
              doctor['name']!,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),
            Row(
              children: [
                Icon(Icons.medical_services, size: 16, color: Colors.teal.shade700),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    '${doctor['qualification']}, ${doctor['specialty']}',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.teal.shade700,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 2,
                    softWrap: true,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.location_on, size: 16, color: Colors.teal),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    doctor['location']!,
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                    maxLines: 2,
                    softWrap: true,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.local_hospital, size: 16, color: Colors.teal),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    doctor['clinic']!,
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                    maxLines: 2,
                    softWrap: true,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.phone, size: 16, color: Colors.teal),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    doctor['contact']!,
                    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                TextButton.icon(
                  onPressed: () async {
                    final number = doctor['contact']!;
                    final Uri launchUri = Uri.parse('tel:$number');
                    if (await canLaunchUrl(launchUri)) {
                      await launchUrl(launchUri); // Opens dial pad
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Could not dial $number')),
                      );
                    }
                  },
                  icon: const Icon(Icons.call, size: 16),
                  label: const Text('Call'),
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    backgroundColor: Colors.teal.withOpacity(0.1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
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
          'Arm Specialists',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.teal,
        centerTitle: true,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: _doctors.map((doctor) => _buildDoctorCard(context, doctor)).toList(),
          ),
        ),
      ),
    );
  }
}