import 'package:flutter/material.dart';

class BloodBankPage extends StatefulWidget {
  const BloodBankPage({Key? key}) : super(key: key);

  @override
  State<BloodBankPage> createState() => _BloodBankPageState();
}

class _BloodBankPageState extends State<BloodBankPage> {
  String _selectedBloodGroup = 'O+';
  final TextEditingController _searchController = TextEditingController();

  final List<Map<String, String>> _allDonors = [
    // O+ Donors
    {'name': 'Asaduzzaman', 'gender': 'Male', 'age': '38', 'bloodGroup': 'O+'},
    {'name': 'Farzana Khatun', 'gender': 'Female', 'age': '29', 'bloodGroup': 'O+'},
    {'name': 'Shirin Akter', 'gender': 'Female', 'age': '31', 'bloodGroup': 'O+'},
    {'name': 'Rashed Khan', 'gender': 'Male', 'age': '26', 'bloodGroup': 'O+'},
    {'name': 'Ayesha Akter', 'gender': 'Female', 'age': '30', 'bloodGroup': 'O+'},

    // A+ Donors
    {'name': 'Taslima Khatun', 'gender': 'Female', 'age': '34', 'bloodGroup': 'A+'},
    {'name': 'Imran Ahmed', 'gender': 'Male', 'age': '24', 'bloodGroup': 'A+'},
    {'name': 'Asaduzzaman', 'gender': 'Male', 'age': '38', 'bloodGroup': 'A+'},
    {'name': 'Rakib Hassan', 'gender': 'Male', 'age': '27', 'bloodGroup': 'A+'},
    {'name': 'Rina Begum', 'gender': 'Female', 'age': '27', 'bloodGroup': 'A+'},

    // B+ Donors
    {'name': 'Tasnim Ahmed', 'gender': 'Male', 'age': '25', 'bloodGroup': 'B+'},
    {'name': 'Shahidul Islam', 'gender': 'Male', 'age': '41', 'bloodGroup': 'B+'},
    {'name': 'Naznin Akter', 'gender': 'Female', 'age': '25', 'bloodGroup': 'B+'},
    {'name': 'Asaduzzaman', 'gender': 'Male', 'age': '38', 'bloodGroup': 'B+'},
    {'name': 'Rakib Hassan', 'gender': 'Male', 'age': '27', 'bloodGroup': 'B+'},

    // AB+ Donors
    {'name': 'Sujan Rahman', 'gender': 'Male', 'age': '33', 'bloodGroup': 'AB+'},
    {'name': 'Sumaiya Kalam', 'gender': 'Female', 'age': '22', 'bloodGroup': 'AB+'},
    {'name': 'Nafisa Akter', 'gender': 'Female', 'age': '34', 'bloodGroup': 'AB+'},
    {'name': 'Kamrul Islam', 'gender': 'Male', 'age': '24', 'bloodGroup': 'AB+'},
    {'name': 'Farida Yasmin', 'gender': 'Female', 'age': '25', 'bloodGroup': 'AB+'},

    // O- Donors
    {'name': 'Abdul Momin', 'gender': 'Male', 'age': '35', 'bloodGroup': 'O-'},
    {'name': 'Shahid Ahmed', 'gender': 'Male', 'age': '33', 'bloodGroup': 'O-'},
    {'name': 'Shahidul Islam', 'gender': 'Male', 'age': '41', 'bloodGroup': 'O-'},
    {'name': 'Naznin Akter', 'gender': 'Female', 'age': '25', 'bloodGroup': 'O-'},
    {'name': 'Sumaiya Kalam', 'gender': 'Female', 'age': '22', 'bloodGroup': 'O-'},

    // A- Donors
    {'name': 'Tasnim Ahmed', 'gender': 'Male', 'age': '25', 'bloodGroup': 'A-'},
    {'name': 'Shahidul Islam', 'gender': 'Male', 'age': '41', 'bloodGroup': 'A-'},
    {'name': 'Nusrat Jahan', 'gender': 'Female', 'age': '28', 'bloodGroup': 'A-'},
    {'name': 'Abdul Kalam', 'gender': 'Male', 'age': '35', 'bloodGroup': 'A-'},
    {'name': 'Farida Yasmin', 'gender': 'Female', 'age': '25', 'bloodGroup': 'A-'},

    // B- Donors
    {'name': 'Tariqul Islam', 'gender': 'Male', 'age': '23', 'bloodGroup': 'B-'},
    {'name': 'Shahid Rahman', 'gender': 'Male', 'age': '29', 'bloodGroup': 'B-'},
    {'name': 'Abdul Momin', 'gender': 'Male', 'age': '35', 'bloodGroup': 'B-'},
    {'name': 'Jannatul Ferdous', 'gender': 'Female', 'age': '26', 'bloodGroup': 'B-'},
    {'name': 'Mehedi Hasan', 'gender': 'Male', 'age': '26', 'bloodGroup': 'B-'},

    // AB- Donors
    {'name': 'Taslima Akter', 'gender': 'Female', 'age': '34', 'bloodGroup': 'AB-'},
    {'name': 'Shahidul Islam', 'gender': 'Male', 'age': '41', 'bloodGroup': 'AB-'},
    {'name': 'Naznin Akter', 'gender': 'Female', 'age': '31', 'bloodGroup': 'AB-'},
    {'name': 'Asaduzzaman', 'gender': 'Male', 'age': '38', 'bloodGroup': 'AB-'},
    {'name': 'Rakib Hassan', 'gender': 'Male', 'age': '27', 'bloodGroup': 'AB-'},
  ];

  Widget _buildBloodGroupCard(BuildContext context, String bloodType) {
    final isSelected = _selectedBloodGroup == bloodType;
    return InkWell(
      onTap: () {
        setState(() {
          _selectedBloodGroup = bloodType;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? Colors.teal.withOpacity(0.1) : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isSelected ? Colors.teal : Colors.grey.shade300,
            width: 1.2,
          ),
        ),
        child: Center(
          child: Text(
            bloodType,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: isSelected ? Colors.teal : Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDonorCard(Map<String, String> donor) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.person, size: 16, color: Colors.teal),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    donor['name']!,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.account_box, size: 16, color: Colors.teal.shade700),
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
            const SizedBox(height: 4),
            Row(
              children: [
                const Icon(Icons.bloodtype, size: 16, color: Colors.teal),
                const SizedBox(width: 6),
                Text(
                  'Blood Group: ${donor['bloodGroup']}',
                  style: const TextStyle(fontSize: 14),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  List<Map<String, String>> get filteredDonors {
    return _allDonors
        .where((donor) => donor['bloodGroup'] == _selectedBloodGroup)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: const [
            Icon(Icons.bloodtype, color: Colors.white),
            SizedBox(width: 8),
            Text('Blood Bank', style: TextStyle(color: Colors.white)),
          ],
        ),
        backgroundColor: Colors.teal,
        centerTitle: false,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Blood Group Grid (✅ Increased height to fit 2 rows)
              SizedBox(
                height: 165, // ✅ Increased from 100 to 180
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    childAspectRatio: 1.2,
                  ),
                  itemCount: 8,
                  itemBuilder: (context, index) {
                    final bloodGroups = ['O+', 'A+', 'B+', 'AB+', 'O-', 'A-', 'B-', 'AB-'];
                    final bg = bloodGroups[index];
                    return _buildBloodGroupCard(context, bg);
                  },
                ),
              ),
              const SizedBox(height: 16),

              // Donor List
              if (filteredDonors.isNotEmpty)
                Expanded(
                  child: ListView.builder(
                    itemCount: filteredDonors.length,
                    itemBuilder: (context, index) {
                      return _buildDonorCard(filteredDonors[index]);
                    },
                  ),
                )
              else
                const Expanded(
                  child: Center(child: Text('No donor found')),
                ),
            ],
          ),
        ),
      ),
    );
  }
}