import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HospitalPage extends StatelessWidget {
  HospitalPage({super.key});

  final List<Map<String, String>> _hospitals = [
    {
      'name': 'Aalok Health Care Ltd',
      'type': 'Diagnostic Center',
      'contact': '01915448500',
      'location': '21, Darus Salam Road, Mirpur 1, Dhaka'
    },
    {
      'name': 'AIMS Hospital Ltd',
      'type': 'Hospital',
      'contact': '09678117811',
      'location': 'Progaty Soroni, Merul Badda, Dhaka'
    },
    {
      'name': 'Abeda Memorial Hospital',
      'type': 'Hospital',
      'contact': '01758853440',
      'location': 'Tasar Ali Manson, Medical Gate, Station Road, Tongi, Gazipur'
    },
    // ... (keep all hospital data as-is)
  ];

  Widget _buildHospitalCard(BuildContext context, Map<String, String> hospital) {
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
              hospital['name']!,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              hospital['type']!,
              style: TextStyle(
                fontSize: 14,
                color: Colors.teal.shade700,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.phone, size: 16, color: Colors.teal),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    hospital['contact']!,
                    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ),
                // ✅ Replaced Copy Button with Call Button
                TextButton.icon(
                  onPressed: () async {
                    final number = hospital['contact']!;
                    final Uri launchUri = Uri.parse('tel:$number');
                    if (await canLaunchUrl(launchUri)) {
                      await launchUrl(launchUri); // Opens dial pad with number
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.location_on, size: 16, color: Colors.teal),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    hospital['location']!,
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
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
        title: const Text(
          'Hospitals & Clinics',
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
          children: [
            ..._hospitals.map((hospital) => _buildHospitalCard(context, hospital)),
          ],
        ),
      ),
    );
  }
}