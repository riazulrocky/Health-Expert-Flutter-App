import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Required for calling

class BloodBankPage extends StatelessWidget {
  const BloodBankPage({super.key});

  final List<String> bloodGroups = const ['O+', 'A+', 'B+', 'AB+', 'O-', 'A-', 'B-', 'AB-'];

  final String whyDonateTips = '''
1. One donation can save up to 3 lives
2. Supports emergency surgeries and cancer patients
3. Stimulates Blood Production
4. Boosts Mental Well-being
5. Get a free health check-up
  ''';

  final String beforeTips = '''
1. Stay hydrated before donation
2. Eat a healthy meal (avoid fatty foods)
3. Rest well the night before
4. Inform staff about medications or allergies
5. Wear comfortable clothing
  ''';

  final String afterTips = '''
1. Drink extra fluids for the next 24 hours
2. Avoid alcohol for 24 hours
3. Do not lift heavy objects immediately
4. Keep gauze on arm for 4–5 hours
5. Eat iron-rich foods to recover quickly
  ''';

  // Build blood group card with dynamic navigation
  Widget _buildBloodGroupCard(BuildContext context, String bloodType) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.teal.shade600,
          width: 1.2,
        ),
      ),
      child: InkWell(
        onTap: () {
          if (bloodType == 'O+') {
            Navigator.push(context, MaterialPageRoute(builder: (_) => BloodDonorOPlusPage()));
          } else if (bloodType == 'A+') {
            Navigator.push(context, MaterialPageRoute(builder: (_) => BloodDonorAPlusPage()));
          } else if (bloodType == 'B+') {
            Navigator.push(context, MaterialPageRoute(builder: (_) => BloodDonorBPlusPage()));
          } else if (bloodType == 'AB+') {
            Navigator.push(context, MaterialPageRoute(builder: (_) => BloodDonorABPlusPage()));
          } else if (bloodType == 'O-') {
            Navigator.push(context, MaterialPageRoute(builder: (_) => BloodDonorONegativePage()));
          } else if (bloodType == 'A-') {
            Navigator.push(context, MaterialPageRoute(builder: (_) => BloodDonorANegativePage()));
          } else if (bloodType == 'B-') {
            Navigator.push(context, MaterialPageRoute(builder: (_) => BloodDonorBNegativePage()));
          } else if (bloodType == 'AB-') {
            Navigator.push(context, MaterialPageRoute(builder: (_) => BloodDonorABNegativePage()));
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                bloodType,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal.shade700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Build tip section box
  Widget _buildTipSection(String title, String tips, IconData icon) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.only(bottom: 10),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: Colors.teal, size: 18),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),
            Text(
              tips,
              style: const TextStyle(fontSize: 13, height: 1.4),
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
        title: const Text('Blood Bank', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.teal,
        centerTitle: true,
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),

              // Blood Group Grid (4 per row)
              SizedBox(
                height: 180,
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    childAspectRatio: 1.2,
                  ),
                  itemCount: bloodGroups.length,
                  itemBuilder: (context, index) =>
                      _buildBloodGroupCard(context, bloodGroups[index]),
                ),
              ),

              const SizedBox(height: 10),

              // Tip Sections
              _buildTipSection('Why Donate Blood?', whyDonateTips, Icons.health_and_safety),
              const SizedBox(height: 10),
              _buildTipSection('Before Donation', beforeTips, Icons.water_drop),
              const SizedBox(height: 10),
              _buildTipSection('After Donation', afterTips, Icons.local_drink),
            ],
          ),
        ),
      ),
    );
  }
}

// ✅ Individual donor pages
class BloodDonorOPlusPage extends StatelessWidget {
  const BloodDonorOPlusPage({Key? key}) : super(key: key);

  final List<Map<String, String>> _donors = const [
    const {'name': 'Tariqul Hasan', 'contact': '01836020692', 'gender': 'Male', 'age': '23', 'donations': '1', 'lastDonated': '3 months ago'},
    const {'name': 'Farida Akter', 'contact': '01712456789', 'gender': 'Female', 'age': '28', 'donations': '5', 'lastDonated': '1 month ago'},
    const {'name': 'Shahidul Islam', 'contact': '01911987654', 'gender': 'Male', 'age': '32', 'donations': '3', 'lastDonated': '6 months ago'},
    const {'name': 'Rina Begum', 'contact': '01912345678', 'gender': 'Female', 'age': '27', 'donations': '1', 'lastDonated': '6 months ago'},
    const {'name': 'Abdul Momin', 'contact': '01711223344', 'gender': 'Male', 'age': '35', 'donations': '10', 'lastDonated': '3 weeks ago'},
    const {'name': 'Naznin Akter', 'contact': '01911334455', 'gender': 'Female', 'age': '25', 'donations': '2', 'lastDonated': '2 weeks ago'},
    const {'name': 'Sujan Rahman', 'contact': '01711556677', 'gender': 'Male', 'age': '33', 'donations': '7', 'lastDonated': '10 days ago'},
    const {'name': 'Sumaiya Kalam', 'contact': '01811002233', 'gender': 'Female', 'age': '22', 'donations': '1', 'lastDonated': '2 weeks ago'},
  ];

  @override
  Widget build(BuildContext context) {
    return _buildDonorPage(context, 'O+', _donors);
  }
}

class BloodDonorAPlusPage extends StatelessWidget {
  const BloodDonorAPlusPage({Key? key}) : super(key: key);

  final List<Map<String, String>> _donors = const [
    const {'name': 'Rakib Hassan', 'contact': '01911887766', 'gender': 'Male', 'age': '27', 'donations': '2', 'lastDonated': '5 months ago'},
    const {'name': 'Jannatul Ferdous', 'contact': '01911667788', 'gender': 'Female', 'age': '26', 'donations': '3', 'lastDonated': '8 months ago'},
    const {'name': 'Mahmud Hasan', 'contact': '01611234567', 'gender': 'Male', 'age': '29', 'donations': '6', 'lastDonated': '1 month ago'},
    const {'name': 'Taslima Akter', 'contact': '01811990011', 'gender': 'Female', 'age': '34', 'donations': '9', 'lastDonated': '3 months ago'},
    const {'name': 'Imran Ahmed', 'contact': '01911444555', 'gender': 'Male', 'age': '24', 'donations': '2', 'lastDonated': '2 months ago'},
    const {'name': 'Asaduzzaman', 'contact': '01711445566', 'gender': 'Male', 'age': '38', 'donations': '12', 'lastDonated': '1 month ago'},
    const {'name': 'Farzana Khatun', 'contact': '01911223344', 'gender': 'Female', 'age': '29', 'donations': '3', 'lastDonated': '2 months ago'},
    const {'name': 'Shirin Akter', 'contact': '01711888999', 'gender': 'Female', 'age': '31', 'donations': '4', 'lastDonated': '5 months ago'},
    const {'name': 'Rashed Khan', 'contact': '01611778899', 'gender': 'Male', 'age': '26', 'donations': '2', 'lastDonated': '1 week ago'},
    const {'name': 'Ayesha Akter', 'contact': '01713579246', 'gender': 'Female', 'age': '30', 'donations': '4', 'lastDonated': '1 month ago'},
  ];

  @override
  Widget build(BuildContext context) {
    return _buildDonorPage(context, 'A+', _donors);
  }
}

class BloodDonorBPlusPage extends StatelessWidget {
  const BloodDonorBPlusPage({Key? key}) : super(key: key);

  final List<Map<String, String>> _donors = const [
    const {'name': 'Nusrat Jahan', 'contact': '01712456789', 'gender': 'Female', 'age': '28', 'donations': '5', 'lastDonated': '1 month ago'},
    const {'name': 'Zahid Islam', 'contact': '01911444555', 'gender': 'Male', 'age': '24', 'donations': '2', 'lastDonated': '2 months ago'},
    const {'name': 'Tariqul Hasan', 'contact': '01836020692', 'gender': 'Male', 'age': '23', 'donations': '1', 'lastDonated': '3 months ago'},
    const {'name': 'Shahidul Islam', 'contact': '01811223344', 'gender': 'Male', 'age': '41', 'donations': '8', 'lastDonated': '2 months ago'},
    const {'name': 'Shirin Akter', 'contact': '01711888999', 'gender': 'Female', 'age': '31', 'donations': '4', 'lastDonated': '5 months ago'},
    const {'name': 'Sumaiya Kalam', 'contact': '01811002233', 'gender': 'Female', 'age': '22', 'donations': '1', 'lastDonated': '2 weeks ago'},
  ];

  @override
  Widget build(BuildContext context) {
    return _buildDonorPage(context, 'B+', _donors);
  }
}

class BloodDonorABPlusPage extends StatelessWidget {
  const BloodDonorABPlusPage({Key? key}) : super(key: key);

  final List<Map<String, String>> _donors = const [
    const {'name': 'Tasnim Ahmed', 'contact': '01911122334', 'gender': 'Male', 'age': '25', 'donations': '3', 'lastDonated': '10 days ago'},
    const {'name': 'Sadia Rahman', 'contact': '01711234567', 'gender': 'Female', 'age': '27', 'donations': '1', 'lastDonated': '6 months ago'},
    const {'name': 'Rashed Ahmed', 'contact': '01611778899', 'gender': 'Male', 'age': '26', 'donations': '2', 'lastDonated': '1 week ago'},
    const {'name': 'Nafisa Akter', 'contact': '01811990011', 'gender': 'Female', 'age': '34', 'donations': '9', 'lastDonated': '3 months ago'},
    const {'name': 'Kamrul Islam', 'contact': '01911444555', 'gender': 'Male', 'age': '24', 'donations': '2', 'lastDonated': '2 months ago'},
    const {'name': 'Farida Yasmin', 'contact': '01912345678', 'gender': 'Female', 'age': '25', 'donations': '2', 'lastDonated': '2 weeks ago'},
  ];

  @override
  Widget build(BuildContext context) {
    return _buildDonorPage(context, 'AB+', _donors);
  }
}

class BloodDonorONegativePage extends StatelessWidget {
  const BloodDonorONegativePage({Key? key}) : super(key: key);

  final List<Map<String, String>> _donors = const [
    const {'name': 'Shahid Ahmed', 'contact': '01711556677', 'gender': 'Male', 'age': '33', 'donations': '7', 'lastDonated': '10 days ago'},
    const {'name': 'Taslima Khatun', 'contact': '01811990011', 'gender': 'Female', 'age': '34', 'donations': '9', 'lastDonated': '3 months ago'},
    const {'name': 'Imran Ahmed', 'contact': '01911987654', 'gender': 'Male', 'age': '32', 'donations': '3', 'lastDonated': '6 months ago'},
    const {'name': 'Rina Begum', 'contact': '01912345678', 'gender': 'Female', 'age': '27', 'donations': '1', 'lastDonated': '6 months ago'},
    const {'name': 'Asaduzzaman', 'contact': '01711445566', 'gender': 'Male', 'age': '38', 'donations': '12', 'lastDonated': '1 month ago'},
    const {'name': 'Rakib Hassan', 'contact': '01911887766', 'gender': 'Male', 'age': '27', 'donations': '2', 'lastDonated': '5 months ago'},
  ];

  @override
  Widget build(BuildContext context) {
    return _buildDonorPage(context, 'O-', _donors);
  }
}

class BloodDonorANegativePage extends StatelessWidget {
  const BloodDonorANegativePage({Key? key}) : super(key: key);

  final List<Map<String, String>> _donors = const [
    const {'name': 'Farida Yasmin', 'contact': '01912345678', 'gender': 'Female', 'age': '25', 'donations': '2', 'lastDonated': '2 weeks ago'},
    const {'name': 'Tasnim Ahmed', 'contact': '01911122334', 'gender': 'Male', 'age': '25', 'donations': '3', 'lastDonated': '10 days ago'},
    const {'name': 'Abdul Kalam', 'contact': '01711123456', 'gender': 'Male', 'age': '35', 'donations': '10', 'lastDonated': '3 weeks ago'},
    const {'name': 'Shahidul Islam', 'contact': '01811223344', 'gender': 'Male', 'age': '41', 'donations': '8', 'lastDonated': '2 months ago'},
    const {'name': 'Nusrat Jahan', 'contact': '01712456789', 'gender': 'Female', 'age': '28', 'donations': '5', 'lastDonated': '1 month ago'},
    const {'name': 'Rina Begum', 'contact': '01911223344', 'gender': 'Female', 'age': '30', 'donations': '1', 'lastDonated': '8 months ago'},
  ];

  @override
  Widget build(BuildContext context) {
    return _buildDonorPage(context, 'A-', _donors);
  }
}

class BloodDonorBNegativePage extends StatelessWidget {
  const BloodDonorBNegativePage({Key? key}) : super(key: key);

  final List<Map<String, String>> _donors = const [
    const {'name': 'Abdullah Al Mamun', 'contact': '01911122334', 'gender': 'Male', 'age': '30', 'donations': '5', 'lastDonated': '2 weeks ago'},
    const {'name': 'Mehedi Hasan', 'contact': '01611778899', 'gender': 'Male', 'age': '26', 'donations': '2', 'lastDonated': '1 week ago'},
    const {'name': 'Shirin Akter', 'contact': '01811990011', 'gender': 'Female', 'age': '34', 'donations': '9', 'lastDonated': '3 months ago'},
    const {'name': 'Tariqul Islam', 'contact': '01836020692', 'gender': 'Male', 'age': '23', 'donations': '1', 'lastDonated': '3 months ago'},
    const {'name': 'Asaduzzaman', 'contact': '01711445566', 'gender': 'Male', 'age': '38', 'donations': '12', 'lastDonated': '1 month ago'},
    const {'name': 'Shahid Rahman', 'contact': '01611234567', 'gender': 'Male', 'age': '29', 'donations': '6', 'lastDonated': '1 week ago'},
  ];

  @override
  Widget build(BuildContext context) {
    return _buildDonorPage(context, 'B-', _donors);
  }
}

class BloodDonorABNegativePage extends StatelessWidget {
  const BloodDonorABNegativePage({Key? key}) : super(key: key);

  final List<Map<String, String>> _donors = const [
    const {'name': 'Rashed Ahmed', 'contact': '01611778899', 'gender': 'Male', 'age': '26', 'donations': '2', 'lastDonated': '1 week ago'},
    const {'name': 'Tasnim Ahmed', 'contact': '01911122334', 'gender': 'Male', 'age': '25', 'donations': '3', 'lastDonated': '10 days ago'},
    const {'name': 'Shahidul Islam', 'contact': '01811223344', 'gender': 'Male', 'age': '41', 'donations': '8', 'lastDonated': '2 months ago'},
    const {'name': 'Naznin Akter', 'contact': '01911334455', 'gender': 'Female', 'age': '25', 'donations': '2', 'lastDonated': '2 weeks ago'},
    const {'name': 'Asaduzzaman', 'contact': '01711445566', 'gender': 'Male', 'age': '38', 'donations': '12', 'lastDonated': '1 month ago'},
    const {'name': 'Rakib Hassan', 'contact': '01911887766', 'gender': 'Male', 'age': '27', 'donations': '2', 'lastDonated': '5 months ago'},
  ];

  @override
  Widget build(BuildContext context) {
    return _buildDonorPage(context, 'AB-', _donors);
  }
}

// ✅ Reusable donor page builder
Widget _buildDonorPage(BuildContext context, String bloodType, List<Map<String, String>> donors) {
  return Scaffold(
    appBar: AppBar(
      title: Text('$bloodType Donors', style: const TextStyle(color: Colors.white)),
      backgroundColor: Colors.teal,
      centerTitle: true,
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
        children: donors.map((donor) => _buildDonorCard(context, donor)).toList(),
      ),
    ),
  );
}

// ✅ Reusable donor card with call button
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
          const SizedBox(height: 8),
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
            children: [
              const Icon(Icons.calendar_month, size: 16, color: Colors.teal),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  'Donated ${donor['donations']} time(s) | Last: ${donor['lastDonated']}',
                  style: const TextStyle(fontSize: 13, color: Colors.grey),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}