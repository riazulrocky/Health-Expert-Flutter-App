import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Required for calling

class ChestPage extends StatelessWidget {
  ChestPage({super.key});

  final List<Map<String, String>> _doctors = [
    {
      'name': 'Dr. A B M Abdul Matin',
      'qualification': 'MBBS (DU)',
      'specialty': 'Surgeon',
      'contact': '01776304620',
      'location': 'Kalyanpur Bus Stand',
      'clinic': 'City Hospital Limited'
    },
    {
      'name': 'Dr. A K M Abdul Hamid',
      'qualification': 'MSSB, FCGP, PGT(Surgery)',
      'specialty': 'General Surgeon',
      'contact': '01711485979',
      'location': 'Zilla Sadar Road, Akur Takur',
      'clinic': 'Care Diagnostic Center'
    },
    {
      'name': 'Dr. A K M Abul Hossain',
      'qualification': 'MBBS, MCPS(Surgery)',
      'specialty': 'Surgeon',
      'contact': '01711545118',
      'location': 'Farmgate, Dhaka',
      'clinic': 'Dhaka Community Hospital'
    },
    {
      'name': 'Dr. A S M Alamgir',
      'qualification': 'MBBS, MS(Child Surgery)',
      'specialty': 'Surgeon',
      'contact': '01711697241',
      'location': 'Mitford, Dhaka',
      'clinic': 'National Institute of Ophthalmology (NIO)'
    },
    {
      'name': 'Assoc. Prof. Dr. A S M Hasanuzzaman',
      'qualification': 'MBBS, MS(Child Surgery)',
      'specialty': 'General Surgeon',
      'contact': '01711544314',
      'location': 'Jatrabari, Dhaka',
      'clinic': 'Bangabondhu Sheikh Mujib Medical University (BSMMU)'
    },
    {
      'name': 'Assoc. Prof. Dr. A Z M Mahfuzur Rahman',
      'qualification': 'MBBS, MS(Surgery)',
      'specialty': 'General Surgeon',
      'contact': '01839995566',
      'location': 'Shyamoli, Dhaka',
      'clinic': 'Shaheed Suhrawardy Medical College & Hospital, Dhaka (SSMCH)'
    },
    {
      'name': 'Prof Dr. A E Md Abdul Wasi',
      'qualification': 'MBBS, FCPS(Surgery)',
      'specialty': 'General Surgeon',
      'contact': '01778455951',
      'location': 'Sonadanga, Khulna',
      'clinic': 'Combined Military Hospital (CMH)'
    },
    {
      'name': 'Dr. A H M Mushiur Rahaman',
      'qualification': 'MBBS, DS(Vienna)',
      'specialty': 'General Surgeon',
      'contact': '5173445',
      'location': 'Sheujgari, Bogura',
      'clinic': 'Uttara Adhunik Medical College'
    },
    {
      'name': 'Prof. Dr. A M Shahidullah',
      'qualification': 'MBBS, FCPS(Surgery), FICS',
      'specialty': 'General Surgeon',
      'contact': '01678344200',
      'location': 'Moghbazar, Dhaka',
      'clinic': 'United Hospital Limited'
    },
    {
      'name': 'Prof. Dr. A Z M Mostaque Hossain',
      'qualification': 'MBBS, FCPS',
      'specialty': 'Surgeon',
      'contact': '10652',
      'location': 'Dhanmondi, Dhaka',
      'clinic': 'Bangladesh Medical College & Hospital'
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
                    softWrap: false,
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
        title: const Text('Chest Specialists', style: TextStyle(color: Colors.white)),
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