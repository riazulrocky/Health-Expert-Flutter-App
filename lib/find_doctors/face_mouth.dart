import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Required for calling

class FaceMouthPage extends StatelessWidget {
  FaceMouthPage({Key? key}) : super(key: key);

  final List<Map<String, String>> _doctors = [
    {
      'name': 'Prof. Dr. A B M Moshiur Rahman Chowdhury',
      'qualification': 'MBBS, BCS, DLO(DU)',
      'specialty': 'ENT Specialist',
      'contact': '01711476095',
      'location': 'Shyamoli, Dhaka',
      'clinic': 'Shaheed Suhrawardy Medical College & Hospital, Dhaka (SSMCH)'
    },
    {
      'name': 'Prof. Dr. A K M A Sobhan',
      'qualification': 'MBBS, BCS(Health), DLO, MS(Endocrinology)',
      'specialty': 'ENT & Head Neck Surgeon',
      'contact': '8056497',
      'location': 'Mirpur, Dhaka',
      'clinic': 'Shaheed Suhrawardy Medical College & Hospital, Dhaka (SSMCH)'
    },
    {
      'name': 'Col. Dr. A K M Asaduzzaman',
      'qualification': 'MBBS(DU), MCPS(ENT), DLO, FCPS(ENT)',
      'specialty': 'ENT & Head Neck Surgeon',
      'contact': '01841121416',
      'location': 'Uttara, Dhaka',
      'clinic': 'Combined Military Hospital (CMH)'
    },
    {
      'name': 'Prof. Dr. A B M Abullah',
      'qualification': 'MBBS, MRCP(UK), FRCP',
      'specialty': 'Medicine Specialist',
      'contact': '2966005',
      'location': 'Green Road, Dhaka',
      'clinic': 'Bangabondhu Sheikh Mujib Medical University (BSMMU)'
    },
    {
      'name': 'Asst. Prof. Dr. A F M Saaidur Rahman',
      'qualification': 'MBBS, FCPS, D-Card, DTCD',
      'specialty': 'Medicine & Cardiologist',
      'contact': '01815484600',
      'location': 'Lalmatia, Dhaka',
      'clinic': 'Bangladesh Medical College & Hospital'
    },
    {
      'name': 'Assoc. Prof. Dr. A Alam Chowdhury',
      'qualification': 'MBBS, MS, FCPS(ENT)',
      'specialty': 'ENT Specialist',
      'contact': '01839995566',
      'location': 'Panthapath, Dhaka',
      'clinic': 'Bangabondhu Sheikh Mujib Medical University (BSMMU)'
    },
    {
      'name': 'Dr. A K M Saiful Uddin',
      'qualification': 'MBBS, MS(ENT)',
      'specialty': 'ENT & Head Neck Surgeon',
      'contact': '01992346632',
      'location': 'Mirpur, Dhaka',
      'clinic': 'Shaheed Suhrawardy Hospital'
    },
    {
      'name': 'Prof. Dr. Belayet Hossain Siddique',
      'qualification': 'MBBS, FCPS, FICS',
      'specialty': 'ENT Specialist',
      'contact': '01917374020',
      'location': 'Mirpur, Dhaka',
      'clinic': 'Bangabondhu Sheikh Mujib Medical University (BSMMU)'
    },
    {
      'name': 'Asst. Prof. Dr. Feroz Ahmed',
      'qualification': 'MBBS, DLO',
      'specialty': 'ENT Specialist',
      'contact': '01550020871',
      'location': 'Mohammadpur, Dhaka',
      'clinic': 'Bangladesh Medical College & Hospital'
    },
    {
      'name': 'Asst. Prof. Dr. Harun ur Rasid (Yamin)',
      'qualification': 'MBBS, FCPS(ENT)',
      'specialty': 'ENT Specialist',
      'contact': '258954653',
      'location': 'Uttara, Dhaka',
      'clinic': 'Shaheed Suhrawardy Medical College & Hospital, Dhaka (SSMCH)'
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
        title: const Text('Face & Mouth Specialists', style: TextStyle(color: Colors.white)),
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