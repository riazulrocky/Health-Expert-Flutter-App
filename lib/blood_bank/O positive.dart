import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BloodDonorOPlusPage extends StatelessWidget {
  BloodDonorOPlusPage({Key? key}) : super(key: key);

  final List<Map<String, String>> _donors = [
    {
      'name': 'Tariqul Hasan',
      'contact': '01836020692',
      'gender': 'Male',
      'age': '23',
      'donations': '1',
      'lastDonated': '3 months ago'
    },
    {
      'name': 'Nusrat Jahan',
      'contact': '01712456789',
      'gender': 'Female',
      'age': '28',
      'donations': '5',
      'lastDonated': '1 month ago'
    },
    {
      'name': 'Imran Ahmed',
      'contact': '01911987654',
      'gender': 'Male',
      'age': '32',
      'donations': '3',
      'lastDonated': '6 months ago'
    },
    {
      'name': 'Farida Yasmin',
      'contact': '01912345678',
      'gender': 'Female',
      'age': '25',
      'donations': '2',
      'lastDonated': '4 months ago'
    },
    {
      'name': 'Shahidul Islam',
      'contact': '01811223344',
      'gender': 'Male',
      'age': '41',
      'donations': '8',
      'lastDonated': '2 months ago'
    },
    {
      'name': 'Ayesha Akter',
      'contact': '01713579246',
      'gender': 'Female',
      'age': '30',
      'donations': '4',
      'lastDonated': '1 month ago'
    },
    {
      'name': 'Rakib Hassan',
      'contact': '01911887766',
      'gender': 'Male',
      'age': '27',
      'donations': '2',
      'lastDonated': '5 months ago'
    },
    {
      'name': 'Sumaiya Kalam',
      'contact': '01811002233',
      'gender': 'Female',
      'age': '22',
      'donations': '1',
      'lastDonated': '2 weeks ago'
    },
    {
      'name': 'Abdul Momin',
      'contact': '01711223344',
      'gender': 'Male',
      'age': '35',
      'donations': '10',
      'lastDonated': '3 weeks ago'
    },
    {
      'name': 'Jannatul Ferdous',
      'contact': '01911667788',
      'gender': 'Female',
      'age': '26',
      'donations': '3',
      'lastDonated': '8 months ago'
    },
    {
      'name': 'Mahmud Hasan',
      'contact': '01611234567',
      'gender': 'Male',
      'age': '29',
      'donations': '6',
      'lastDonated': '1 month ago'
    },
    {
      'name': 'Shirin Akter',
      'contact': '01711888999',
      'gender': 'Female',
      'age': '31',
      'donations': '4',
      'lastDonated': '5 months ago'
    },
    {
      'name': 'Zahid Islam',
      'contact': '01911444555',
      'gender': 'Male',
      'age': '24',
      'donations': '2',
      'lastDonated': '2 months ago'
    },
    {
      'name': 'Rina Begum',
      'contact': '01811334455',
      'gender': 'Female',
      'age': '27',
      'donations': '1',
      'lastDonated': '6 months ago'
    },
    {
      'name': 'Sujan Rahman',
      'contact': '01711556677',
      'gender': 'Male',
      'age': '33',
      'donations': '7',
      'lastDonated': '10 days ago'
    },
    {
      'name': 'Farzana Khatun',
      'contact': '01911223344',
      'gender': 'Female',
      'age': '29',
      'donations': '3',
      'lastDonated': '2 months ago'
    },
    {
      'name': 'Rashed Khan',
      'contact': '01611778899',
      'gender': 'Male',
      'age': '26',
      'donations': '2',
      'lastDonated': '1 week ago'
    },
    {
      'name': 'Taslima Akter',
      'contact': '01811990011',
      'gender': 'Female',
      'age': '34',
      'donations': '9',
      'lastDonated': '3 months ago'
    },
    {
      'name': 'Asaduzzaman',
      'contact': '01711445566',
      'gender': 'Male',
      'age': '38',
      'donations': '12',
      'lastDonated': '1 month ago'
    },
    {
      'name': 'Naznin Akter',
      'contact': '01911334455',
      'gender': 'Female',
      'age': '25',
      'donations': '2',
      'lastDonated': '2 weeks ago'
    },
  ];

  Widget _buildDonorCard(BuildContext context, Map<String, String> donor) {
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
              donor['name']!,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),
            Row(
              children: [
                const Icon(Icons.person, size: 16, color: Colors.teal),
                const SizedBox(width: 6),
                Text(
                  '${donor['gender']} | ${donor['age']} years',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.teal.shade700,
                    fontWeight: FontWeight.w600,
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
                    donor['contact']!,
                    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ),
                TextButton.icon(
                  onPressed: () async {
                    final number = donor['contact']!;
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
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.calendar_month, size: 16, color: Colors.teal),
                const SizedBox(width: 6),
                Text(
                  'Donated ${donor['donations']} time(s)',
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
                const SizedBox(width: 10),
                Text(
                  'Last: ${donor['lastDonated']}',
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
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
        title: const Text(
          'O+ Blood Donors',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.teal,
        centerTitle: true,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.teal.shade50, Colors.white],
          ),
        ),
        child: ListView(
          children: _donors.map((donor) => _buildDonorCard(context, donor)).toList(),
        ),
      ),
    );
  }
}