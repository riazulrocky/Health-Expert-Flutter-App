import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Required for calling

class AmbulancePage extends StatefulWidget {
  const AmbulancePage({Key? key}) : super(key: key);

  @override
  State<AmbulancePage> createState() => _AmbulancePageState();
}

class _AmbulancePageState extends State<AmbulancePage> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';
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
      'location': '82, East Ahmed Nagor, Mirpur - 1216\nMirpur, Dhaka'
    },
    {
      'name': 'Dipu Ambulance Service',
      'contact': '01616343956',
      'location': 'Enam Medical College, Savar\nSavar, Dhaka'
    },
    {
      'name': 'Health Labs Ltd. Ambulance',
      'contact': '01783800800',
      'location': '1041/2A, North Shewrapara, Mirpur\nShewrapara, Dhaka'
    },
    {
      'name': 'Impulse Hospital Ambulance',
      'contact': '01877000010',
      'location': '304/E, Bir Uttam Mir Shawkat Sarak\nTejgaon, Dhaka'
    },
  ];

  List<Map<String, String>> get filteredAmbulances {
    if (_searchQuery.isEmpty) {
      return _ambulances;
    }
    final query = _searchQuery.toLowerCase();
    return _ambulances.where((ambulance) {
      return ambulance['name']!.toLowerCase().contains(query) ||
          ambulance['location']!.toLowerCase().contains(query);
    }).toList();
  }

  Future<void> _makeCall(String number) async {
    final Uri launchUri = Uri.parse('tel:$number');
    if (await canLaunchUrl(launchUri)) {
      await launchUrl(launchUri);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Could not dial $number')),
      );
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Ambulance Services',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.teal,
        centerTitle: true,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // ✅ Search Bar
            Container(
              decoration: BoxDecoration(
                color: Colors.teal.shade50,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.teal.shade100),
              ),
              child: TextField(
                controller: _searchController,
                onChanged: (query) {
                  setState(() {
                    _searchQuery = query;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Search by name or location...',
                  prefixIcon: const Icon(Icons.search, color: Colors.teal),
                  border: InputBorder.none,
                  contentPadding:
                  const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
                  hintStyle: TextStyle(color: Colors.teal.shade300),
                ),
              ),
            ),
            const SizedBox(height: 16),
            // ✅ Ambulance List
            Expanded(
              child: filteredAmbulances.isEmpty
                  ? const Center(child: Text('No ambulance found'))
                  : ListView.builder(
                itemCount: filteredAmbulances.length,
                itemBuilder: (context, index) {
                  final ambulance = filteredAmbulances[index];
                  return Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    margin:
                    const EdgeInsets.symmetric(vertical: 8),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: [
                          // Name
                          Text(
                            ambulance['name']!,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 6),
                          // Contact
                          Row(
                            children: [
                              const Icon(Icons.phone,
                                  size: 16, color: Colors.teal),
                              const SizedBox(width: 6),
                              Expanded(
                                child: Text(
                                  ambulance['contact']!,
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              // ✅ Call Button
                              TextButton.icon(
                                onPressed: () =>
                                    _makeCall(ambulance['contact']!),
                                icon: const Icon(Icons.call, size: 16),
                                label: const Text('Call'),
                                style: TextButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 4),
                                  backgroundColor:
                                  Colors.teal.withOpacity(0.1),
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(20),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          // Location
                          Row(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              const Icon(Icons.location_on,
                                  size: 16, color: Colors.teal),
                              const SizedBox(width: 6),
                              Expanded(
                                child: Text(
                                  ambulance['location']!,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}