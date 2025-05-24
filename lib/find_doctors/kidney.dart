import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Required for calling

class KidneyPage extends StatelessWidget {
  KidneyPage({super.key});

  final List<Map<String, String>> _doctors = [
    {
      'name': 'Dr. ABM Habibullah',
      'qualification': 'MBBS, BCS(Health)',
      'specialty': 'Surgeon',
      'contact': '01707700839',
      'location': 'Mirpur Road',
      'clinic': 'Trauma Center'
    },
    {
      'name': 'Dr. A.B Shariar Ahmed',
      'qualification': 'MBBS, FCPS(Surgery)',
      'specialty': 'Surgeon',
      'contact': '01778833299',
      'location': 'Tongi, Gazipur',
      'clinic': 'Abeda Memorial Hospital'
    },
    {
      'name': 'Asst. Prof. Dr. AB Siddique',
      'qualification': 'MBBS, MRCS',
      'specialty': 'Urologist and Surgeon',
      'contact': '01776304620',
      'location': 'Dhanmondi, Dhaka',
      'clinic': 'Popular Diagnostic Center Ltd'
    },
    {
      'name': 'Dr. A H M Monzurul Islam',
      'qualification': 'MBBS, Phd(Japan)',
      'specialty': 'Urologist',
      'contact': '52153891',
      'location': 'Dhap, Rangpur',
      'clinic': 'Rangpur Medical College & Hospital'
    },
    {
      'name': 'Asst. Prof. Dr. A K M Akramul Bari',
      'qualification': 'MBBS, BCS(Health)',
      'specialty': 'Urologist',
      'contact': '01955567001',
      'location': 'Uttara, Dhaka',
      'clinic': 'Radical Hospital'
    },
    {
      'name': 'Prof. Dr. M K M Kurshedul Alam',
      'qualification': 'MBBS, MCPS(Surgery)',
      'specialty': 'Urologist & Surgeon',
      'contact': '01712586795',
      'location': 'Green Road',
      'clinic': 'Dhaka Hospital'
    },
    {
      'name': 'Dr. Ahidujjaman',
      'qualification': 'MBBS, MS(Urology)',
      'specialty': 'Urologist',
      'contact': '58155938',
      'location': 'Farmgate, Dhaka',
      'clinic': 'Al-Raji Hospital'
    },
    {
      'name': 'Dr. Ahsan Kabir',
      'qualification': 'MBBS, MCPS',
      'specialty': 'Urologist & Andrologist',
      'contact': '283181350',
      'location': 'Moghbazar, Dhaka',
      'clinic': 'Monowara Hospital'
    },
    {
      'name': 'Dr. Aminul Islam',
      'qualification': 'MBBS, DMUD',
      'specialty': 'Urologist',
      'contact': '27343825',
      'location': 'Midford, Dhaka',
      'clinic': 'Badhon Hospital'
    },
    {
      'name': 'Dr. Fahim Hussain',
      'qualification': 'MBBS, BCS(Health)',
      'specialty': 'Urologist & Surgery',
      'contact': '01731006173',
      'location': 'Saver, Dhaka',
      'clinic': 'Islamia Digital Lab & Hospital'
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
        title: const Text('Kidney Specialists', style: TextStyle(color: Colors.white)),
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