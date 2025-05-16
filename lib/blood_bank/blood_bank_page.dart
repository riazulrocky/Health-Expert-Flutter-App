import 'package:flutter/material.dart';
import 'package:health_app/blood_bank/O%20positive.dart';

class BloodBankPage extends StatelessWidget {
  const BloodBankPage({super.key});

  final List<String> bloodGroups = const ['O+', 'A+', 'B+', 'AB+', 'O-', 'A-', 'B-', 'AB-'];

  final String _whyDonateTips = '''
1. One donation can save up to 3 lives
2. Supports emergency surgeries and cancer patients
3. Stimulates Blood Production
4. Boosts Mental Well-being
5. Get a free health check-up
  ''';

  final String _beforeTips = '''
1. Stay hydrated before donation
2. Eat a healthy meal (avoid fatty foods)
3. Rest well the night before
4. Inform staff about medications or allergies
5. Wear comfortable clothing
  ''';

  final String _afterTips = '''
1. Drink extra fluids for the next 24 hours
2. Avoid alcohol for 24 hours
3. Do not lift heavy objects immediately
4. Keep gauze on arm for 4–5 hours
5. Eat iron-rich foods to recover quickly
  ''';

  // Build blood group card with navigation for O+
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
            // ✅ Navigate to O+ donor page
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => BloodDonorOPlusPage(),
              ),
            );
          } else {
            // Show tap message for other blood groups
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Tapped $bloodType')),
            );
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
        padding: const EdgeInsets.all(12),
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
              _buildTipSection('Why Donate Blood?', _whyDonateTips, Icons.health_and_safety),
              const SizedBox(height: 10),
              _buildTipSection('Before Donation', _beforeTips, Icons.water_drop),
              const SizedBox(height: 10),
              _buildTipSection('After Donation', _afterTips, Icons.local_drink),
            ],
          ),
        ),
      ),
    );
  }
}