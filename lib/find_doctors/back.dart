import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Required for calling

class BackPage extends StatelessWidget {
  BackPage({Key? key}) : super(key: key);

  final List<Map<String, String>> _doctors = [
    {
      'name': 'Dr. A B M Fazlur Rahman',
      'qualification': 'MBBS, MS(ortho), FICS',
      'specialty': 'Orthopaedic specialist',
      'contact': '9033563',
      'location': 'Farmgate',
      'clinic': 'Al-Raji Hospital (Pvt.) Ltd.'
    },
    {
      'name': 'Dr. Ahsan Kabir',
      'qualification': 'MBBS, FCPS',
      'specialty': 'Urologist & Andrologist',
      'contact': '028318135',
      'location': 'Moghbazar',
      'clinic': 'Monowara Hospital (Pvt.) Ltd.'
    },
    {
      'name': 'Dr. Golam Nabi Azad',
      'qualification': 'MBBS, FCPS (Physical medicine)',
      'specialty': 'Physical medicine specialist',
      'contact': '032163016',
      'location': 'Maijdee',
      'clinic': 'Prime Hospital Limited'
    },
    {
      'name': 'Prof. Dr. Golam Faruque',
      'qualification': 'MBBS, MS(ortho)',
      'specialty': 'Orthopaedic Surgeon',
      'contact': '10633',
      'location': 'Lalmatia',
      'clinic': 'City Hospital Limited'
    },
    {
      'name': 'Dr. Gazi Enamul Kabir',
      'qualification': 'MBBS, BCS, MS(ortho)',
      'specialty': 'Orthopaedic Surgeon',
      'contact': '01708889344',
      'location': 'Maijdee',
      'clinic': 'Care Diagnostic Center'
    },
    {
      'name': 'Dr. H. A. Rashid',
      'qualification': 'MBBS, FCPS, MS',
      'specialty': 'Orthopaedic Surgeon',
      'contact': '028157660',
      'location': 'Mohammadpur',
      'clinic': 'Dhaka Diagnostic Center'
    },
    {
      'name': 'Dr. H. R. Habib',
      'qualification': 'MBBS, D-ortho(DU)',
      'specialty': 'Orthopaedic Surgeon',
      'contact': '01777595969',
      'location': 'Station Road',
      'clinic': 'Health Aid Diagnostic Center & Hospital'
    },
    {
      'name': 'Dr. Hasan Mahbub',
      'qualification': 'MBBS, BCS, MS',
      'specialty': 'Neurosurgeon',
      'contact': '02224444588',
      'location': 'Savar',
      'clinic': 'Savar Care Hospital'
    },
    {
      'name': 'Dr. Himadri Barua',
      'qualification': 'MBBS, D-ortho(C), MS',
      'specialty': 'Orthopaedic specialist',
      'contact': '031654046',
      'location': 'K.B. Fazlul Kader Road',
      'clinic': 'Medi Aid Complex'
    },
    {
      'name': 'Prof. Dr. Hossain Ahmed',
      'qualification': 'MBBS, MS(ortho)',
      'specialty': 'Orthopaedic Surgeon',
      'contact': '0312525850',
      'location': 'Panchlaish R/A',
      'clinic': 'Life Care Center'
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
        title: const Text('Back Specialists', style: TextStyle(color: Colors.white)),
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