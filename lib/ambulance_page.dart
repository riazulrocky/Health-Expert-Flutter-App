import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // ✅ Add this import

class AmbulancePage extends StatelessWidget {
  AmbulancePage({Key? key}) : super(key: key);

  final List<Map<String, String>> _ambulances = [
    {
      'name': '24 Hours Ambulance Service',
      'contact': '01911125156',
      'location': 'Basabo Rd, Dhaka 1214\nDhaka, Bashabo'
    },
    {
      'name': 'Abdullah Ambulance Service',
      'contact': '01743912874',
      'location': 'Dhaka, Bangladesh, 1207\nDhaka, Agargaon'
    },
    {
      'name': 'Ad Din Barrister Rafiqul Islam Hospital',
      'contact': '01713488425',
      'location': 'Postogola, Dhaka\nDhaka, Postogola'
    },
    // ... (keep all ambulance data as-is)
  ];

  Widget _buildAmbulanceCard(BuildContext context, Map<String, String> ambulance) {
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
              ambulance['name']!,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.phone, size: 16, color: Colors.teal),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    ambulance['contact']!,
                    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ),
                // ✅ Replaced Copy Button with Call Button
                TextButton.icon(
                  onPressed: () async {
                    final number = ambulance['contact']!;
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
            const SizedBox(height: 8),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.location_on, size: 16, color: Colors.teal),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    ambulance['location']!,
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
          'Ambulance Services',
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
          children: _ambulances.map((ambulance) => _buildAmbulanceCard(context, ambulance)).toList(),
        ),
      ),
    );
  }
}