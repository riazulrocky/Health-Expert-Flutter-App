import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Required for calling

class EyePage extends StatelessWidget {
  EyePage({Key? key}) : super(key: key);

  final List<Map<String, String>> _doctors = [
    {
      'name': 'Prof. Dr. A S M Moinuddin',
      'qualification': 'MBBS, D-Opth',
      'specialty': 'Eye specialist (Ophthalmologist)',
      'contact': '01799796140',
      'location': 'Uttara, Dhaka',
      'clinic': 'East West Medical College & Hospital'
    },
    {
      'name': 'Prof. Dr. A S M Kamal Uddin',
      'qualification': 'MBBS, FCPS(Ophth)',
      'specialty': 'Eye specialist (Ophthalmologist)',
      'contact': '01531210502',
      'location': 'Dhanmondi, Dhaka',
      'clinic': 'Ispahani Islamia Eye Institute & Hospital'
    },
    {
      'name': 'Prof. Dr. A A M Mohiuddin',
      'qualification': 'MBBS, FCPS',
      'specialty': 'Eye specialist (Ophthalmologist)',
      'contact': '01711316852',
      'location': 'Malibagh, Dhaka',
      'clinic': 'Sir Salimullah Medical College'
    },
    {
      'name': 'Prof. Dr. A I M Anisuddin Serniabat',
      'qualification': 'MBBS, DO, MS (Ophth)',
      'specialty': 'Cornea, Lasik & Phaco Surgeon, Professor & Head of Department',
      'contact': '01747530848',
      'location': 'Mitford, Dhaka',
      'clinic': 'Dhaka Community Hospital'
    },
    {
      'name': 'Dr. A K M Rezaul Islam',
      'qualification': 'MBBS, BCS(Health), MCPS, MS(Ophthalmology)',
      'specialty': 'Eye specialist (Ophthalmologist)',
      'contact': '29338986',
      'location': 'Moghbazar, Dhaka',
      'clinic': 'National Institute of Ophthalmology (NIO)'
    },
    {
      'name': 'Prof. Dr. A K M A Muktadir',
      'qualification': 'MBBS, DO, FAMS, FACS',
      'specialty': 'Eye specialist (Ophthalmologist)',
      'contact': '28314317',
      'location': 'Eskaton Garden Road, Dhaka',
      'clinic': 'Dhaka Medical College Hospital (DMCH)'
    },
    {
      'name': 'Prof. Dr. Ashraf Sayeed',
      'qualification': 'MBBS, FCPS(Ophthalmology), D-Opth, MS(Ophthalmology)',
      'specialty': 'Eye specialist (Ophthalmologist)',
      'contact': '01799796140',
      'location': 'Uttara, Dhaka',
      'clinic': 'Ibrahim Medical College'
    },
    {
      'name': 'Prof. Dr. Asif Ahamed Kabir',
      'qualification': 'MBBS, MS(Ophthalmologist)',
      'specialty': 'Eye specialist (Ophthalmologist)',
      'contact': '01708126000',
      'location': 'Shyamoli, Dhaka',
      'clinic': 'National Institute of Traumatology Orthopedics and Rehabilitation (NITOR)'
    },
    {
      'name': 'Prof. Dr. Bipul Chandra Ray',
      'qualification': 'MBBS, FCPS, DCO',
      'specialty': 'Eye specialist (Ophthalmologist)',
      'contact': '01799796141',
      'location': 'Uttara, Dhaka',
      'clinic': 'Uttara Adhunik Medical College'
    },
    {
      'name': 'Dr. Faridul Hasan',
      'qualification': 'MBBS, DO(DU), MS(Ophthalmology)',
      'specialty': 'Eye specialist (Ophthalmologist)',
      'contact': '9666710666',
      'location': 'Gulshan, Dhaka',
      'clinic': 'United Hospital Limited'
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
        title: const Text('Eye Specialists', style: TextStyle(color: Colors.white)),
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