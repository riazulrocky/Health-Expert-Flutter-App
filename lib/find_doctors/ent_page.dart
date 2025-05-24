import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Required for calling

class EntPage extends StatelessWidget {
  EntPage({super.key});

  final List<Map<String, String>> _doctors = [
    {
      'name': 'Prof. Dr. AKMA Sobhan',
      'qualification': 'MBBS, BCS(Health), DLO, MS(Endocrinology)',
      'specialty': 'EMT & Head Neck Surgeon',
      'contact': '8053469',
      'location': 'Mirpur, Dhaka',
      'clinic': 'Monowara Hospital'
    },
    {
      'name': 'Dr. A K M Saiful Uddin',
      'qualification': 'MBBS, MS(ENT)',
      'specialty': 'EMT & Head Neck Surgeon',
      'contact': '01992346632',
      'location': 'Mirpur, Dhaka',
      'clinic': 'Sir Salimullah Medical College & Mitford Hospital'
    },
    {
      'name': 'Dr. A A M Nafis',
      'qualification': 'MBBS, BCS, FCPS',
      'specialty': 'ENT Specialist',
      'contact': '01721812118',
      'location': 'Uttara, Dhaka',
      'clinic': 'Digilab Kishoreganj'
    },
    {
      'name': 'Asst. Prof. Dr. A F M Akramuddoula',
      'qualification': 'MBBS',
      'specialty': 'ENT Specialist',
      'contact': '27640216',
      'location': 'Chashara, Narayanganj',
      'clinic': 'Prescription Point Diagnostic & Health Care'
    },
    {
      'name': 'Dr. A M A I Robbani',
      'qualification': 'MBBS, MS(ENT)',
      'specialty': 'EMT Specialist',
      'contact': '01712586795',
      'location': 'Dhap, Rangpur',
      'clinic': 'Ibn Sina Diagnostic & Consultation Center'
    },
    {
      'name': 'Assoc. Prof. Dr. A Alam Chowdhury',
      'qualification': 'MBBS, MS, FCPS(ENT)',
      'specialty': 'EMT Specialist',
      'contact': '01839995566',
      'location': 'Panthapath, Dhaka',
      'clinic': ''
    },
    {
      'name': 'Prof. Dr. A K M Hafiz',
      'qualification': 'MBBS, MCPS, DLO, WHO Fellow',
      'specialty': 'EMT Specialist',
      'contact': '821724441',
      'location': 'South Surma, Sylhet',
      'clinic': 'National Institute of Kidney Disease & Urology (NIKDU)'
    },
    {
      'name': 'Prof. Dr. Abdul Mannan Patwary',
      'qualification': 'MBBS, FCPS, DLO',
      'specialty': 'EMT Specialist',
      'contact': '01776606262',
      'location': 'Kaliakair, Gazipur',
      'clinic': 'Islamia General Hospital'
    },
    {
      'name': 'Dr. Ali Hossain',
      'qualification': 'MBBS, DLO(BSMMU)',
      'specialty': 'EMT Specialist',
      'contact': '01711576121',
      'location': 'Bindu Basini Girls Road, Tangail',
      'clinic': 'Erina Diagnostic Center and Nursing Home'
    },
    {
      'name': 'Dr. Emran Talukder',
      'qualification': 'MBBS(RMC), BCS(Health), MS(ENT)',
      'specialty': 'EMT Specialist',
      'contact': '9613787821',
      'location': 'KDA Avenue, Khulna',
      'clinic': 'Popular Diagnostic Center Ltd.'
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
        title: const Text('ENT Specialists', style: TextStyle(color: Colors.white)),
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