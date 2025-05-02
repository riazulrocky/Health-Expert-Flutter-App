import 'package:flutter/material.dart';

class BloodBankPage extends StatelessWidget {
  // ✅ Remove `const` from the class if you're getting constructor errors
  BloodBankPage({super.key});

  // ✅ Blood groups with const initializer
  final List<String> bloodGroups = const [
    'O+',
    'A+',
    'B+',
    'AB+',
    'O-',
    'A-',
    'B-',
    'AB-'
  ];

  // ✅ Tip lists with const initializer
  final List<String> _whyDonateTips = const [
    'One donation can save up to 3 lives',
    'Supports emergency surgeries and cancer patients',
    'Safe and simple procedure',
    'Helps maintain blood supply in hospitals',
    'Only 30 minutes of your time',
  ];

  final List<String> _beforeTips = const [
    'Stay hydrated before donation',
    'Eat a healthy meal (avoid fatty foods)',
    'Rest well the night before',
    'Inform staff about medications or allergies',
    'Wear comfortable clothing',
  ];

  final List<String> _afterTips = const [
    'Drink extra fluids for the next 24 hours',
    'Avoid alcohol for 24 hours',
    'Do not lift heavy objects immediately',
    'Keep gauze on arm for 4–5 hours',
    'Eat iron-rich foods to recover quickly',
  ];

  // Build blood group card with no background
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
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Tapped $bloodType')),
          );
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

  // Build tip section box with bullet points
  Widget _buildTipSection(String title, List<String> tips, IconData sectionIcon) {
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
                Icon(sectionIcon, color: Colors.teal, size: 18),
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
            const SizedBox(height: 8),
            // ✅ Safely render bullet points
            ...tips.map((tip) => _buildDonationTipItem(tip)),
          ],
        ),
      ),
    );
  }

  // Build single tip item with bullet icon
  Widget _buildDonationTipItem(String tip) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.fiber_manual_record, size: 10, color: Colors.teal.shade700),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              tip,
              style: const TextStyle(fontSize: 13),
            ),
          ),
        ],
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
                height: 180, // ✅ Fixed height for grid
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
                  itemBuilder: (context, index) => _buildBloodGroupCard(context, bloodGroups[index]),
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