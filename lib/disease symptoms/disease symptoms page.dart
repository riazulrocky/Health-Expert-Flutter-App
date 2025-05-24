import 'package:flutter/material.dart';

class DiseaseSymptomsPage extends StatefulWidget {
  const DiseaseSymptomsPage({Key? key}) : super(key: key);

  @override
  State<DiseaseSymptomsPage> createState() => _DiseaseSymptomsPageState();
}

class _DiseaseSymptomsPageState extends State<DiseaseSymptomsPage> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';
  final List<Map<String, dynamic>> _diseases = _diseaseData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: const [
            Icon(Icons.sick, color: Colors.white),
            SizedBox(width: 8),
            Text(
              'Diseases & Symptoms',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
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
              // Search Bar
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
                    hintText: 'Search for a disease...',
                    prefixIcon: const Icon(Icons.search, color: Colors.teal),
                    border: InputBorder.none,
                    contentPadding:
                    const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
                    hintStyle: TextStyle(color: Colors.teal.shade300),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // Disease List
              Expanded(
                child: _diseases.isEmpty
                    ? const Center(child: Text('No disease found'))
                    : ListView.builder(
                  itemCount: _diseases.length,
                  itemBuilder: (context, index) {
                    final disease = _diseases[index];
                    final name = disease['name'].toString().toLowerCase();
                    if (_searchQuery.isEmpty ||
                        name.contains(_searchQuery.toLowerCase())) {
                      return _buildDiseaseCard(context, disease);
                    }
                    return Container(); // Hide non-matching
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDiseaseCard(BuildContext context, Map<String, dynamic> disease) {
    // ✅ Convert description to List<String>
    final List<String> description = (disease['description'] as String)
        .split('\n')
        .map((s) => s.trim())
        .where((s) => s.isNotEmpty)
        .toList();

    // ✅ Ensure symptoms is List<String>
    final List<String> symptoms = (disease['symptoms'] as List)
        .map((e) => e.toString())
        .toList();

    // ✅ Ensure prevention is List<String>
    final List<String> prevention = (disease['prevention'] as List)
        .map((e) => e.toString())
        .toList();

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ExpansionTile(
        title: Row(
          children: [
            Icon(disease['icon'], color: Colors.teal),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                disease['name']!,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal.shade800,
                ),
              ),
            ),
          ],
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Description
                _buildInfoSection('Overview', description),
                const SizedBox(height: 12),
                // Symptoms
                _buildInfoSection('Symptoms', symptoms),
                const SizedBox(height: 12),
                // Prevention
                _buildInfoSection('Prevention Tips', prevention),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoSection(String title, List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
            color: Colors.teal,
          ),
        ),
        const SizedBox(height: 6),
        Wrap(
          spacing: 8,
          runSpacing: 4,
          children: items.map((item) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.fiber_manual_record, size: 10, color: Colors.teal),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    item,
                    style: const TextStyle(fontSize: 14),
                  ),
                ),
              ],
            );
          }).toList(),
        ),
        const SizedBox(height: 12),
      ],
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}

// ✅ Disease Data (All fields as List<String>)
final List<Map<String, dynamic>> _diseaseData = [
  {
    'name': 'Diabetes',
    'icon': Icons.healing,
    'description':
    'A chronic condition affecting blood sugar levels.\nCan lead to long-term complications like nerve damage and kidney failure.',
    'symptoms': [
      'Frequent urination',
      'Excessive thirst',
      'Unexplained weight loss',
      'Fatigue',
      'Blurred vision',
      'Increased hunger',
      'Slow-healing sores',
      'Tingling in hands/feet',
      'Frequent infections',
    ],
    'prevention': [
      'Maintain healthy weight',
      'Eat balanced meals',
      'Exercise regularly',
      'Avoid sugary drinks',
      'Regular blood tests',
    ],
  },
  {
    'name': 'Hypertension',
    'icon': Icons.favorite,
    'description':
    'High blood pressure that strains the heart.\nCan lead to stroke or heart failure.',
    'symptoms': [
      'Headaches',
      'Shortness of breath',
      'Chest pain',
      'Vision problems',
      'Dizziness',
      'Nosebleeds',
      'Blood in urine',
      'Fatigue',
    ],
    'prevention': [
      'Reduce salt intake',
      'Limit alcohol',
      'Quit smoking',
      'Manage stress',
      'Monitor blood pressure',
    ],
  },
  {
    'name': 'Asthma',
    'icon': Icons.health_and_safety,
    'description':
    'Chronic lung disease causing breathing difficulties.\nTriggers include allergens, cold air, and pollution.',
    'symptoms': [
      'Wheezing',
      'Coughing',
      'Chest tightness',
      'Shortness of breath',
      'Fatigue',
      'Wheezing at night',
      'Coughing during exercise',
    ],
    'prevention': [
      'Avoid allergens',
      'Use inhaler as prescribed',
      'Keep environment clean',
      'Stay warm in cold weather',
      'Avoid smoke/pollution',
    ],
  },
  {
    'name': 'Arthritis',
    'icon': Icons.accessibility_new,
    'description':
    'Inflammation of joints causing pain and stiffness.\nCommon in older adults and athletes.',
    'symptoms': [
      'Joint pain',
      'Swelling',
      'Stiffness',
      'Reduced range of motion',
      'Warmth/redness in joints',
      'Morning stiffness',
      'Difficulty moving',
    ],
    'prevention': [
      'Maintain healthy weight',
      'Exercise regularly',
      'Avoid joint injuries',
      'Eat anti-inflammatory foods',
      'Warm up before activity',
    ],
  },
  {
    'name': 'Migraine',
    'icon': Icons.headset_mic,
    'description':
    'Severe headache often with sensory disturbances.\nTriggers include stress, light, and hormonal changes.',
    'symptoms': [
      'Intense headache',
      'Nausea',
      'Sensitivity to light/sound',
      'Visual disturbances',
      'Fatigue',
      'Aura (flashes of light)',
      'Vomiting',
      'Sensitivity to smells',
    ],
    'prevention': [
      'Identify triggers',
      'Maintain regular sleep',
      'Stay hydrated',
      'Reduce stress',
      'Avoid certain foods',
    ],
  },
  {
    'name': 'Anemia',
    'icon': Icons.bloodtype,
    'description':
    'Low red blood cells or hemoglobin in blood.\nCommon in women and people with chronic diseases.',
    'symptoms': [
      'Fatigue',
      'Pale skin',
      'Shortness of breath',
      'Dizziness',
      'Cold hands/feet',
      'Headache',
      'Chest pain',
      'Rapid heartbeat',
    ],
    'prevention': [
      'Eat iron-rich foods',
      'Take vitamin B12',
      'Prenatal care for women',
      'Treat underlying causes',
      'Avoid iron blockers with meals',
    ],
  },
  {
    'name': 'Flu',
    'icon': Icons.sick,
    'description':
    'Viral infection affecting respiratory system.\nCommon during winter and rainy seasons.',
    'symptoms': [
      'Fever',
      'Cough',
      'Sore throat',
      'Muscle pain',
      'Fatigue',
      'Chills',
      'Runny nose',
      'Body aches',
    ],
    'prevention': [
      'Get annual flu shot',
      'Wash hands regularly',
      'Avoid close contact',
      'Cover coughs/sneezes',
      'Stay home when sick',
    ],
  },
  {
    'name': 'Hypothyroidism',
    'icon': Icons.wb_sunny,
    'description':
    'Underactive thyroid gland.\nSlows metabolism and affects energy levels.',
    'symptoms': [
      'Fatigue',
      'Weight gain',
      'Dry skin',
      'Sensitivity to cold',
      'Depression',
      'Brittle nails',
      'Hair loss',
      'Constipation',
    ],
    'prevention': [
      'Iodine-rich diet',
      'Regular checkups',
      'Watch for family history',
      'Avoid goitrogenic foods',
      'Manage stress',
    ],
  },
  {
    'name': 'Cholera',
    'icon': Icons.local_drink,
    'description':
    'Infectious disease causing severe diarrhea.\nSpreads through contaminated water.',
    'symptoms': [
      'Watery diarrhea',
      'Nausea',
      'Vomiting',
      'Rapid dehydration',
      'Muscle cramps',
      'Dry mouth',
      'Low urine output',
      'Leg cramps',
    ],
    'prevention': [
      'Safe water',
      'Proper sanitation',
      'Boil water',
      'Wash hands',
      'Avoid raw food in affected areas',
    ],
  },
  {
    'name': 'Malaria',
    'icon': Icons.bug_report,
    'description':
    'Mosquito-borne disease caused by parasites.\nCommon in tropical regions.',
    'symptoms': [
      'Fever',
      'Chills',
      'Headache',
      'Nausea',
      'Muscle pain',
      'Sweating',
      'Headache',
      'Back pain',
    ],
    'prevention': [
      'Use mosquito nets',
      'Apply repellent',
      'Wear protective clothing',
      'Avoid stagnant water',
      'Take prophylaxis in high-risk areas',
    ],
  },
];