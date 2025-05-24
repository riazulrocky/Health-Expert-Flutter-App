import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Required for calling

class LegFootPage extends StatelessWidget {
  LegFootPage({Key? key}) : super(key: key);

  final List<Map<String, String>> _doctors = [
    {
      'name': 'Dr. A K M Obaidul Haque (Sabbir)',
      'qualification': 'MBBS (DU), BCS (Health), MS (Orthopedics Surgery)',
      'specialty': 'Orthopaedic Surgeon',
      'contact': '018141222033',
      'location': 'Badda, Dhaka',
      'clinic': 'Popular Diagnostic Center Ltd.'
    },
    {
      'name': 'Dr. A K M Obaydul Haque',
      'qualification': 'MBBS, D-Ortho, MS',
      'specialty': 'Orthopaedic Surgeon',
      'contact': '01713333235',
      'location': 'Badda, Dhaka',
      'clinic': 'Prescription Point Diagnostic & Health Care'
    },
    {
      'name': 'Asst. Prof. Dr. A K M Shaharul Islam',
      'qualification': 'MBBS, D-Ortho',
      'specialty': 'Orthopaedic Surgeon',
      'contact': '01990376538',
      'location': 'Sherpur Road',
      'clinic': 'Ibn Sina Diagnostic & Consultation Center'
    },
    {
      'name': 'Dr. A K M Shahjahan',
      'qualification': 'MBBS, BCS, D-Ortho, MS (Orthopedics)',
      'specialty': 'Orthopaedic Surgeon',
      'contact': '01991980546',
      'location': 'Savar, Dhaka',
      'clinic': 'Ibn Sina Diagnostic & Consultation Center'
    },
    {
      'name': 'Assoc. Prof. Dr. A K M Zahir Uddin',
      'qualification': 'MBBS, MS (Orthopedics), AO Fellow (India), ROS (Japan), WHO Fellow (Thailand), AO Trauma (USA/Europe)',
      'specialty': 'Orthopaedic Surgeon',
      'contact': '01991980547',
      'location': 'Badda, Dhaka',
      'clinic': 'Prescription Point Diagnostic & Health Care'
    },
    {
      'name': 'Dr. A B M Fazlur Rahman',
      'qualification': 'MBBS (DMC), MS (Ortho), FICS',
      'specialty': 'Orthopaedic Surgeon',
      'contact': '01756173765',
      'location': 'Farmgate, Dhaka',
      'clinic': 'Al-Raji Hospital (Pvt.) Ltd.'
    },
    {
      'name': 'Asst. Prof. Dr. A B M Jakir Uddin',
      'qualification': 'MBBS, D-Ortho, MS (Ortho)',
      'specialty': 'Orthopaedic Surgeon',
      'contact': '01714047686',
      'location': 'English Road, Dhaka',
      'clinic': 'Popular Diagnostic Center Ltd'
    },
    {
      'name': 'Asst. Prof. Dr. A B M Marshed Gani',
      'qualification': 'MBBS, MS (Orth-Surgery)',
      'specialty': 'Orthopaedic Surgeon',
      'contact': '01750151042',
      'location': 'Dhap, Rangpur',
      'clinic': 'Popular Diagnostic Center Ltd.'
    },
    {
      'name': 'Dr. A B M Rashedul Amir',
      'qualification': 'MBBS, BCS, D-Ortho',
      'specialty': 'Orthopaedic Surgeon',
      'contact': '01759063634',
      'location': 'Dhap, Rangpur',
      'clinic': 'Central Laboratory'
    },
    {
      'name': 'Prof. Dr. A F M Ruhul Haque',
      'qualification': 'MBBS, FRCS, FICS',
      'specialty': 'Orthopaedic Surgeon',
      'contact': '028116969',
      'location': 'Shyamoli, Dhaka',
      'clinic': 'Trauma Center'
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
        title: const Text('Leg & Foot Specialists', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.teal,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: _doctors.map((doctor) => _buildDoctorCard(context, doctor)).toList(),
          ),
        ),
      ),
    );
  }
}