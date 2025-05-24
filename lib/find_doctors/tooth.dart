
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Required for calling

class ToothPage extends StatelessWidget {
  ToothPage({Key? key}) : super(key: key);

  final List<Map<String, String>> _doctors = [
    {
      'name': 'Prof. Dr. A K M Asifuzzaman',
      'qualification': 'BDS (Raj), PGT (Oral Surgery), Advanced Endodontic Training (Malaysia)',
      'specialty': 'Dental Surgeon',
      'contact': '01737231109',
      'location': 'Dhap, Rangpur',
      'clinic': 'Oral And Dental Care'
    },
    {
      'name': 'Asst. Prof. Dr. A K M Salahuddin (Sowpan)',
      'qualification': 'BDS, MS',
      'specialty': 'Dentist',
      'contact': '01840145355',
      'location': 'O.R. Nizam Road, Dhaka',
      'clinic': 'Core Dental'
    },
    {
      'name': 'Dr. A K M Shamsuzzaman',
      'qualification': 'DDTS, SMF',
      'specialty': 'Dental Oral & Maxillofacial Surgeon',
      'contact': '01710400292',
      'location': 'Station Road',
      'clinic': 'Erina Diagnostic Center and Nursing Home'
    },
    {
      'name': 'Dr. A R Khan',
      'qualification': 'BDS, PGT',
      'specialty': 'Dental Surgeon',
      'contact': '01718881897',
      'location': 'Bogra Sadar',
      'clinic': 'Maleka Nursing Home & Diagnostic Center'
    },
    {
      'name': 'Dr. A K M Arifur Rahman',
      'qualification': 'BDS, Dental Surgeon',
      'specialty': 'Dental Surgeon',
      'contact': '031620634',
      'location': 'O.R. Nizam Road, Dhaka',
      'clinic': 'Chittagong Metropolitan Hospital'
    },
    {
      'name': 'Dr. A K M Mujibur Rahman',
      'qualification': 'BDS, BCS',
      'specialty': 'Dental Oral & Maxillofacial Surgeon',
      'contact': '01711331286',
      'location': 'Shibbari Mor, Sylhet',
      'clinic': 'Asha Dental Hospital'
    },
    {
      'name': 'Dr. Md. Talal Mamun',
      'qualification': 'BDS, PGT, FCPS',
      'specialty': 'Dentist',
      'contact': '0821729981',
      'location': 'Subhani Ghat Point',
      'clinic': 'Al Haramain Hospital'
    },
    {
      'name': 'Dr. Md. Tariqul Islam Rabin',
      'qualification': 'BDS (DU), PGT (Oral & Maxillofacial Surgery)',
      'specialty': 'Dentist',
      'contact': '01844141715',
      'location': 'Savar, Dhaka',
      'clinic': 'Ibn Sina Diagnostic & Consultation Center'
    },
    {
      'name': 'Dr. Md. Tohidul Islam (Milon)',
      'qualification': 'BDS (Dhaka Dental College), PGT (Oral & Maxillofacial Surgery)',
      'specialty': 'Dentist',
      'contact': '0856567882',
      'location': 'Lakshmipur',
      'clinic': 'Dina Dent-2'
    },
    {
      'name': 'Dr. Md. Towfique Shahid',
      'qualification': 'BDS (DDCH), BCS (Health), PGT (Oral & Maxillofacial Surgery)',
      'specialty': 'Dental Surgeon',
      'contact': '01716590053',
      'location': 'Jamal Khan Road, Chittagong',
      'clinic': 'Diasonic Diagnostic Center'
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
        title: const Text('Tooth Specialists', style: TextStyle(color: Colors.white)),
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