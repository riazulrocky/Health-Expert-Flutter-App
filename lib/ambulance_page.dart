import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // For Clipboard

class AmbulancePage extends StatelessWidget {
  AmbulancePage({super.key});

  // Emergency banner at the top
  Widget _buildEmergencyBanner(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: const LinearGradient(
          colors: [Colors.red, Colors.redAccent],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.red.withOpacity(0.3),
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: ListTile(
        leading: const Icon(Icons.add_call, color: Colors.white, size: 32),
        title: const Text(
          '999',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        subtitle: const Text(
          'NATIONAL EMERGENCY SERVICE\nCall for ambulance, police, or fire',
          style: TextStyle(
            fontSize: 14,
            color: Colors.white70,
          ),
        ),
        trailing: TextButton.icon(
          onPressed: () {
            Clipboard.setData(ClipboardData(text: '999'));
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Copied 999')),
            );
          },
          icon: Icon(Icons.copy, color: Colors.white, size: 16),
          label: Text('Copy', style: TextStyle(color: Colors.white)),
          style: TextButton.styleFrom(
            backgroundColor: Colors.red.withOpacity(0.3),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      ),
    );
  }

  // Static ambulance data
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
    {
      'name': 'Ad Din Bashundhara Medical College Hospital',
      'contact': '01713488425',
      'location': 'Keraniganj, Dhaka\nDhaka, Keraniganj'
    },
    {
      'name': 'Ad Din Medical College Hospital',
      'contact': '01701777782',
      'location': '2 Bara Moghbazar, Outer Circular Rd, Dhaka 1217\nDhaka, Moghbazar'
    },
    {
      'name': 'Al Amin Ambulance',
      'contact': '01720448666',
      'location': '20/7, Panthapath, Dhaka\nDhaka, Panthapath'
    },
    {
      'name': 'Al Nur Ambulance Service',
      'contact': '01715763741',
      'location': '33 Mitali Road, Dhanmondi, Dhaka\nDhaka, Dhanmondi'
    },
    {
      'name': 'Al-Manar Ambulance Services',
      'contact': '01550020871',
      'location': 'Mohammadpur, Dhaka-1207\nDhaka, Mohammadpur'
    },
    {
      'name': 'Al Markazul Islami Ambulance',
      'contact': '029127867',
      'location': 'Shyamoli Road No-3, Dhaka\nDhaka, Shyamoli'
    },
    {
      'name': 'Anayet Ambulance Service',
      'contact': '01701777782',
      'location': '17 Gareeb-e-Nawaz Avenue, Sector-11, Dhaka\nDhaka, Uttara'
    },
    {
      'name': 'Anjuman-E-Mufidul Islam',
      'contact': '01318242997',
      'location': '42 Anjuman Mufidul Islam Road, Kakrayl\nDhaka, Kakrayl'
    },
    {
      'name': 'Apollo Ambulance Service',
      'contact': '01742738776',
      'location': 'Dhanmondi 15\nDhaka, Dhanmondi'
    },
    {
      'name': 'Asha Ambulance Service',
      'contact': '01701777782',
      'location': '122 Kazi Nazrul Islam Avenue, Shahbagh\nDhaka, Shahbagh'
    },
    {
      'name': 'Chowdhury Ambulance Service',
      'contact': '01318553121',
      'location': 'Kajla, Jatrabari, Dhaka\nDhaka, Jatrabari'
    },
    {
      'name': 'Desh Ambulance Service',
      'contact': '01790509607',
      'location': '82, East Ahmed Nagor, Mirpur - 1216\nDhaka, Mirpur'
    },
    {
      'name': 'Dipu Ambulance Service',
      'contact': '01616343956',
      'location': 'Enam Medical College, Savar\nDhaka, Savar'
    },
    {
      'name': 'Health Labs Ltd. Ambulance',
      'contact': '01783800800',
      'location': '1041/2A, North Shewrapara, Mirpur\nDhaka, Shewrapara'
    },
    {
      'name': 'Impulse Hospital Ambulance',
      'contact': '01877000010',
      'location': '304/E, Bir Uttam Mir Shawkat Sarak\nDhaka, Tejgaon'
    },
  ];

  // Build individual ambulance cards
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
                TextButton.icon(
                  onPressed: () {
                    Clipboard.setData(ClipboardData(text: ambulance['contact']!));
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Copied ${ambulance['contact']}')),
                    );
                  },
                  icon: const Icon(Icons.copy, size: 14),
                  label: const Text('Copy'),
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
          children: [
            _buildEmergencyBanner(context),
            ..._ambulances.map((ambulance) => _buildAmbulanceCard(context, ambulance)),
          ],
        ),
      ),
    );
  }
}