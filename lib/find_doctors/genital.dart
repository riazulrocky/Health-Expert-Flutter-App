import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Required for calling

class GenitalPage extends StatelessWidget {
  GenitalPage({Key? key}) : super(key: key);

  final List<Map<String, String>> _doctors = [
    {
      'name': 'Dr. A R M Afzalur Haque Rana',
      'qualification': 'MBBS, MS (Urology)',
      'specialty': 'Urologist',
      'contact': '01915474121',
      'location': 'Shyamoli, Dhaka',
      'clinic': 'National Institute of Kidney Diseases & Urology (NIKDU)'
    },
    {
      'name': 'Prof. Dr. A K M Anwarul Islam',
      'qualification': 'MBBS, FCPS, FRCS, FICS Clinical Fellow Urology (WHO)',
      'specialty': 'Urologist & Surgeon',
      'contact': '01819286038',
      'location': 'Dhanmondi, Dhaka',
      'clinic': 'Bangabondhu Sheikh Mujib Medical University (BSMMU)'
    },
    {
      'name': 'Assoc. Prof. Dr. A K M Aminul Islam',
      'qualification': 'MBBS, MD (Endocrinology)',
      'specialty': 'Diabetologist & Endocrinologist',
      'contact': '01844022228',
      'location': 'Badda, Dhaka',
      'clinic': 'General Hospital, Manikganj'
    },
    {
      'name': 'Asst. Prof. Dr. A. Latif',
      'qualification': 'MBBS (CU), MD (Nephrology), CCD(Diabetology)',
      'specialty': 'Diabetologist & Endocrinologist',
      'contact': '01844141704',
      'location': 'Lalbagh, Dhaka',
      'clinic': 'BIRDEM General Hospital-2 (Mohila & Shishu)'
    },
    {
      'name': 'Dr. B C Barua',
      'qualification': 'MBBS, PGT (Medicine), CCD, CMU',
      'specialty': 'Medicine & Diabetics Specialist',
      'contact': '258951150',
      'location': 'Uttara, Dhaka',
      'clinic': 'Shaheed Monsur Ali Medical College'
    },
    {
      'name': 'Dr. Badrul Alam',
      'qualification': 'MBBS (Dhaka), CCD(Birdem), MPHTM (Australia)',
      'specialty': 'Medicine & Diabetics Specialist',
      'contact': '10615',
      'location': 'Doyagonj, Dhaka',
      'clinic': 'Ibn Sina D. Lab. & Consultation Center'
    },
    {
      'name': 'Asst. Prof. Dr. Dahila Sultana',
      'qualification': 'MBBS, MD (Endocrinology), CCD',
      'specialty': 'Diabetologist & Endocrinologist',
      'contact': '01790118855',
      'location': 'Malibagh, Dhaka',
      'clinic': 'Sir Salimullah Medical College & Mitford Hospital'
    },
    {
      'name': 'Prof. Dr. Firoza Begum',
      'qualification': 'MBBS, FCPS, FICS',
      'specialty': 'Infertility Specialist',
      'contact': '01717243915',
      'location': 'Uttara, Dhaka',
      'clinic': 'Bangabondhu Sheikh Mujib Medical University (BSMMU)'
    },
    {
      'name': 'Prof. Dr. Ferdus Mohol (Runi)',
      'qualification': 'MBBS, MCPS, MS, FCPS (Gyne & Obs)',
      'specialty': 'Gynecology & Infertility Specialist',
      'contact': '01766662606',
      'location': 'Uttara, Dhaka',
      'clinic': 'Uttara Adhunik Medical College'
    },
    {
      'name': 'Dr. Hurjahan Banu (Urmi)',
      'qualification': 'MBBS, FCPS (EM)',
      'specialty': 'Diabetologist & Hormone Specialist',
      'contact': '01711625173',
      'location': 'Zigatola, Dhaka',
      'clinic': 'Bangabondhu Sheikh Mujib Medical University (BSMMU)'
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
        title: const Text('Genital Specialists', style: TextStyle(color: Colors.white)),
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