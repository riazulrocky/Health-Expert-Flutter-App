import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Required for calling

class AbdomenPage extends StatelessWidget {
  AbdomenPage({Key? key}) : super(key: key);

  final List<Map<String, String>> _doctors = [
    {
      'name': 'Dr. A B M Abdul Matin',
      'qualification': 'MBBS (DU), FCPS (Surgery)',
      'specialty': 'Surgeon',
      'contact': '01711609616',
      'location': 'Kalyanpur Bus Stand, Mirpur Road, Dhaka',
      'clinic': 'Ibn Sina Diagnostic & Consultation Center'
    },
    {
      'name': 'Prof.Dr A B M Abdullah',
      'qualification': 'MBBS, MRCP(UK), FRCP',
      'specialty': 'Medicine Specialist',
      'contact': '029660015',
      'location': 'Green Road',
      'clinic': 'Central Hospital Limited'
    },
    {
      'name': 'Prof.Dr A A Motaleb',
      'qualification': 'MBBS, DTM&H, FRCP',
      'specialty': 'Medicine Specialist',
      'contact': '01711390984',
      'location': 'Armanitola',
      'clinic': 'Kalikunnesa General Hospital'
    },
    {
      'name': 'Dr. A B Siddique',
      'qualification': 'MBBS, BCS(health), MD',
      'specialty': 'Internal Medicine Specialist',
      'contact': '01711457226',
      'location': 'Hospital Road',
      'clinic': 'Abid Consultation Center'
    },
    {
      'name': 'Dr. A K M Kaisarul Islam',
      'qualification': 'MBBS, MD, CCD',
      'specialty': 'Medicine & Diabetics Specialist',
      'contact': '01736686347',
      'location': 'Mitford',
      'clinic': 'Medisun Hospital'
    },
    {
      'name': 'Dr. A K Azad',
      'qualification': 'MBBS, DEM, FCPS, MACE',
      'specialty': 'Medicine & Diabetics Specialist',
      'contact': '010615',
      'location': 'Dhanmondi',
      'clinic': 'Ibn Sina Diagnostic & Imaging Center'
    },
    {
      'name': 'Prof. Dr. A H M Rowshon',
      'qualification': 'MBBS, FCPS, MD',
      'specialty': 'Medicine & Gastroenterologist',
      'contact': '029666480',
      'location': 'Dhanmondi',
      'clinic': 'Popular Diagnostic Center Ltd.'
    },
    {
      'name': 'Dr. A K M Abdul Hamid',
      'qualification': 'MBBS, FCGP, PGT, CC Ulra',
      'specialty': 'General Surgeon',
      'contact': '092162943',
      'location': 'Akur Takur Para',
      'clinic': 'Dholesshori Hospital'
    },
    {
      'name': 'Dr. A S M Alamgir',
      'qualification': 'MBBS, MS',
      'specialty': 'Surgeon',
      'contact': '01711697241',
      'location': 'Mitford',
      'clinic': 'New Dhaka Modern Clinic'
    },
    {
      'name': 'Dr. A S M Nazmul Islam',
      'qualification': 'MBBS, BCS(health), MD(BSMMU)',
      'specialty': 'Gastroenterologist',
      'contact': '027343759',
      'location': 'Mitford',
      'clinic': 'Medisun Hospital'
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
                const Icon(Icons.person, size: 16, color: Colors.teal),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    '${doctor['qualification']}, ${doctor['specialty']}',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.teal.shade700,
                      fontWeight: FontWeight.w600,
                    ),
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
                  ),
                ),
                TextButton.icon(
                  onPressed: () async {
                    final number = doctor['contact']!;
                    final Uri launchUri = Uri.parse('tel:$number');
                    if (await canLaunchUrl(launchUri)) {
                      await launchUrl(launchUri);
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
        title: const Text('Abdomen Specialists', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
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