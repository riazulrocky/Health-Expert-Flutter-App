import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Required for calling

class SkinPage extends StatelessWidget {
  SkinPage({Key? key}) : super(key: key);

  final List<Map<String, String>> _doctors = [
    {
      'name': 'Prof. Dr. Reza Bin Zaid',
      'qualification': 'MBBS, DDV, PhD',
      'specialty': 'Dermatologist & Venereologist',
      'contact': '01727729528',
      'location': 'Panthapath, Dhaka',
      'clinic': 'Skin Square'
    },
    {
      'name': 'Asst. Prof. Dr. A F M Mizanur Rahman',
      'qualification': 'MBBS, DDV (BSMMU)',
      'specialty': 'Dermatologist & Venereologist',
      'contact': '01841005544',
      'location': 'K.B. Fazlul Kader Road',
      'clinic': 'Medi Aid Complex'
    },
    {
      'name': 'Dr. A G M Shahidul Haque',
      'qualification': 'MBBS(DU), CCD(BIRDEM), DOC',
      'specialty': 'Dermatologist & Venereologist',
      'contact': '01799615802',
      'location': 'Station Road, Dhaka',
      'clinic': 'Seba Shushrusha Hospital Ltd.'
    },
    {
      'name': 'Dr. A H M Arifun Nahar',
      'qualification': 'MBBS(RU), DDV(BSMMU)',
      'specialty': 'Dermatologist & Venereologist',
      'contact': '017777764800',
      'location': 'Panthapath, Dhaka',
      'clinic': 'Gastro Liver Hospital Ltd.'
    },
    {
      'name': 'Asst. Prof. Dr. A J M Shahidul Haque (Babu)',
      'qualification': 'MBBS, BCS(Health), MCPS, FCPS, MD(Dermatology & Venereology)',
      'specialty': 'Dermatologist & Venereologist',
      'contact': '01824228222',
      'location': 'Jatrabari, Dhaka',
      'clinic': 'Islamia General Hospital'
    },
    {
      'name': 'Dr. A K M Jayedul Haque',
      'qualification': 'MBBS, MD(Skin & Sex), CCD(Diabetology)',
      'specialty': 'Dermatologist & Venereologist',
      'contact': '01752561542',
      'location': 'Savar, Dhaka',
      'clinic': 'Savar Prime Hospital'
    },
    {
      'name': 'Prof. Dr. A K M Nurunnabi (Laizu)',
      'qualification': 'MBBS, DDV, FCPS',
      'specialty': 'Dermatologist & Venereologist',
      'contact': '01712225845',
      'location': 'Dhap, Rangpur',
      'clinic': 'AKM Nurunnabi Chamber'
    },
    {
      'name': 'Assoc. Prof. Dr. A K M Rezaul Haque',
      'qualification': 'MBBS, BCS(Health), MD(Dermatology)',
      'specialty': 'Dermatologist & Venereologist',
      'contact': '017666628888',
      'location': 'Mirpur, Dhaka',
      'clinic': 'LabAid Diagnostic'
    },
    {
      'name': 'Prof. Dr. A K M Shariful Islam',
      'qualification': 'MBBS, DCM, DDV',
      'specialty': 'Dermatologist & Venereologist',
      'contact': '01759040693',
      'location': 'Uttara, Dhaka',
      'clinic': 'Popular Diagnostic Center Ltd.'
    },
    {
      'name': 'Dr. A K M Sujaur Rahman',
      'qualification': 'MBBS, MPH, DMU, CVD',
      'specialty': 'Dermatologist & Venereologist',
      'contact': '01997000000',
      'location': 'Mohammadpur, Dhaka',
      'clinic': 'DPRC Specialized Hospital and Rehabilitation Center'
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
        title: const Text('Skin Specialists', style: TextStyle(color: Colors.white)),
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