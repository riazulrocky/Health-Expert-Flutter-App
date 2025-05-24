import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Required for calling

class HeadPage extends StatelessWidget {
  HeadPage({Key? key}) : super(key: key);

  final List<Map<String, String>> _doctors = [
    {
      'name': 'Dr. A B M Khurshed Alam Bhuyian',
      'qualification': 'MBBS, PhD (USA)',
      'specialty': 'Diabetologist & Medicine Specialist',
      'contact': '01790118855',
      'location': 'Malibagh, Dhaka',
      'clinic': 'Medinova Medical Services Ltd'
    },
    {
      'name': 'Asst. Prof. Dr. A A M Najmul Huda',
      'qualification': 'MBBS, FCPS(Medicine), MD(Nephrology)',
      'specialty': 'Internal Medicine Specialist',
      'contact': '01747988061',
      'location': 'Station Road, Kishoreganj',
      'clinic': 'Digilab Kishoreganj'
    },
    {
      'name': 'Prof. Dr. A AM Rayhan Uddin',
      'qualification': 'MBBS, MCPS(Medicine), FCCS(USA), FCPS(Medicine)',
      'specialty': 'Medicine Specialist',
      'contact': '01990376538',
      'location': 'O.R. Nizam Road, Chattogram',
      'clinic': 'Medical Center'
    },
    {
      'name': 'Assoc. Prof. Dr. A AM Zahurul Islam',
      'qualification': 'MBBS, FCPS, DTCH',
      'specialty': 'Medicine & Chest Specialist',
      'contact': '01955567000',
      'location': 'Uttara, Dhaka',
      'clinic': 'Radical Hospitals'
    },
    {
      'name': 'Prof. Dr. A A Motaleb',
      'qualification': 'MBBS, DTM&H, FRCP',
      'specialty': 'Medicine Specialist',
      'contact': '01711390984',
      'location': 'Armanitola, Dhaka',
      'clinic': 'Kalikunnesa General Hospital'
    },
    {
      'name': 'Prof. Dr. A B M Abullah',
      'qualification': 'MBBS, MRCP(UK), FRCP',
      'specialty': 'Medicine Specialist',
      'contact': '01790113456',
      'location': 'Green Road, Dhaka',
      'clinic': 'Central Hospital Limited'
    },
    {
      'name': 'Prof. Dr. Reza Bin Zaid',
      'qualification': 'MBBS, DDV, PhD',
      'specialty': 'Dermatologist & Venereologist',
      'contact': '01789554545',
      'location': 'Panthapath, Dhaka',
      'clinic': 'Skin Square'
    },
    {
      'name': 'Asst. Prof. Dr. A F M Mizanur Rahman',
      'qualification': 'MBBS, DDV(BSMMU)',
      'specialty': 'Dermatologist & Venereologist',
      'contact': '01841005544',
      'location': 'K.B. Fazlul Kader Road',
      'clinic': 'Medi Aid Complex'
    },
    {
      'name': 'Dr. A G M Shahidul Haque',
      'qualification': 'MBBS(DU), CCD(BIRDEM), DOC',
      'specialty': 'Dermatologist & Venereologist',
      'contact': '01777777648',
      'location': 'Station Road, Gazipur',
      'clinic': 'Seba Sushrusha Hospital Ltd.'
    },
    {
      'name': 'Dr. A H M Arifun Nahar',
      'qualification': 'MBBS(RU), DDV(BSMMU)',
      'specialty': 'Dermatologist & Venereologist',
      'contact': '01734564345',
      'location': 'Panthapath, Dhaka',
      'clinic': 'Gastro Liver Hospital Ltd.'
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
        title: const Text('Head Specialists', style: TextStyle(color: Colors.white)),
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