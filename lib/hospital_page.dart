import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
    {
      'name': 'Advanced Eye Center',
      'type': 'Hospital',
      'contact': '01552337567',
      'location': '5/17, Humayun Road, College Gate, Mohammadpur, Dhaka'
    },
    {
      'name': 'Advertisement Dental Clinic',
      'type': 'Dental Clinic',
      'contact': '01741331741',
      'location': 'Road No. 4, Baridhara, Dhaka'
    },
    {
      'name': 'Ahsania Mission Cancer & General Hospital',
      'type': 'Hospital',
      'contact': '029123420',
      'location': 'Road No. 12, Dhanmondi R/A, Dhaka'
    },
    {
      'name': 'Ahsania Mission Cancer & General Hospital',
      'type': 'Hospital',
      'contact': '029008919',
      'location': 'Section 14, Mirpur, Dhaka 1206'
    },
    {
      'name': 'Ahsania Mission Cancer & General Hospital',
      'type': 'Hospital',
      'contact': '028119521',
      'location': 'Sector 10, Uttara Model Town, Dhaka 1230'
    },
    {
      'name': 'Aiko Dental Clinic',
      'type': 'Clinic',
      'contact': '01819249262',
      'location': 'Road No. 10, Banani, Dhaka 1213'
    },
    {
      'name': 'Al Barakh General Hospital',
      'type': 'Hospital',
      'contact': '01924545494',
      'location': 'Ali Super Market, Near Tongi Model Thana, Tongi, Gazipur'
    },
    {
      'name': 'Al Raji Hospital Pvt.',
      'type': 'General Hospital',
      'contact': '01840756944',
      'location': 'Farmgate, Dhaka'
    },
    {
      'name': 'Anwer Khan Modern Medical College & Hospital',
      'type': 'Hospital',
      'contact': '0258616074',
      'location': 'Road No. 8, Dhanmondi R/A, Dhaka 1205'
    },
    {
      'name': 'Badda General Hospital',
      'type': 'Hospital',
      'contact': '01714643324',
      'location': 'Cha-107/2, North Badda, Progoti Sarani, Badda, Dhaka'
    },
    {
      'name': 'Banani Dental Clinic',
      'type': 'Dental Clinic',
      'contact': '029894040',
      'location': 'Road No. 12, Block-E, Banani, Dhaka'
    },
    {
      'name': 'Bangabondhu Sheikh Mujib Medical University (PG Hospital)',
      'type': 'Hospital',
      'contact': '0255165760',
      'location': 'Shahbagh, Dhaka'
    },
    {
      'name': 'Bangladesh ENT Hospital',
      'type': 'Hospital',
      'contact': '01717250667',
      'location': 'Shobhanbag, Mirpur Road, (Opposite of Rapa Plaza), Dhaka'
    },
    {
      'name': 'BIRDEM',
      'type': 'Hospital',
      'contact': '028616641',
      'location': 'Kazi Nazrul Avenue, Shahbagh, Dhaka'
    },
    {
      'name': 'Bangladesh Medical College & Hospital',
      'type': 'General Hospital',
      'contact': '029118202',
      'location': 'Road No. 14/A, Dhanmondi, Dhaka'
    },
    {
      'name': 'Bangladesh Psychiatric Care',
      'type': 'Hospital',
      'contact': '+8809604604604',
      'location': 'Shimanta Shambhar Shopping Complex, Pilkhana, Dhaka'
    },
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
                TextButton.icon(
                  onPressed: () {
                    Clipboard.setData(ClipboardData(text: hospital['contact']!));
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Copied ${hospital['contact']}')),
                    );
                  },
                  icon: const Icon(Icons.copy, size: 16),
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