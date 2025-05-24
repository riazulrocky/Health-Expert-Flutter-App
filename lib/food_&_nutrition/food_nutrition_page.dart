import 'package:flutter/material.dart';

class FoodNutritionPage extends StatefulWidget {
  const FoodNutritionPage({Key? key}) : super(key: key);

  @override
  State<FoodNutritionPage> createState() => _FoodNutritionPageState();
}

class _FoodNutritionPageState extends State<FoodNutritionPage> {
  String? _selectedCategory;

  final Map<String, List<Map<String, String>>> _categoryContent = {
    'Fruits': [
      {
        'name': 'Apples',
        'benefits': 'Rich in fiber and antioxidants. Supports heart health.'
      },
      {
        'name': 'Bananas',
        'benefits': 'High in potassium and energy. Good for muscle function.'
      },
      {
        'name': 'Oranges',
        'benefits': 'Packed with vitamin C and flavonoids.'
      },
      {
        'name': 'Berries',
        'benefits': 'High in antioxidants and vitamins.'
      },
      {
        'name': 'Avocados',
        'benefits': 'Healthy fats and potassium.'
      },
    ],
    'Vegetables': [
      {
        'name': 'Spinach',
        'benefits': 'Rich in iron, calcium, and vitamins A & K.'
      },
      {
        'name': 'Broccoli',
        'benefits': 'High in fiber, vitamin C, and cancer-fighting compounds.'
      },
      {
        'name': 'Carrots',
        'benefits': 'Rich in beta-carotene and vitamin A.'
      },
      {
        'name': 'Tomatoes',
        'benefits': 'High in lycopene and vitamin C.'
      },
      {
        'name': 'Bell Peppers',
        'benefits': 'Great source of vitamin C and antioxidants.'
      },
    ],
    'Proteins': [
      {
        'name': 'Eggs',
        'benefits': 'Complete protein source with essential amino acids.'
      },
      {
        'name': 'Chicken Breast',
        'benefits': 'Lean protein for muscle building and repair.'
      },
      {
        'name': 'Fish (Salmon)',
        'benefits': 'Omega-3 fatty acids for brain and heart health.'
      },
      {
        'name': 'Lentils',
        'benefits': 'Plant-based protein with iron and fiber.'
      },
      {
        'name': 'Greek Yogurt',
        'benefits': 'High-protein snack with probiotics.'
      },
    ],
    'Hydration': [
      {
        'name': 'Water',
        'benefits': 'Essential for body functions and metabolism.'
      },
      {
        'name': 'Coconut Water',
        'benefits': 'Natural electrolyte replacement.'
      },
      {
        'name': 'Herbal Tea',
        'benefits': 'Antioxidant-rich with calming effects.'
      },
      {
        'name': 'Fresh Fruit Juices',
        'benefits': 'Hydration with vitamins and minerals.'
      },
    ],
  };

  Widget _buildCategoryCard(String category) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: InkWell(
        onTap: () {
          setState(() {
            _selectedCategory = _selectedCategory == category ? null : category;
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Icon(
                category == 'Fruits'
                    ? Icons.apple
                    : category == 'Vegetables'
                    ? Icons.local_florist
                    : category == 'Proteins'
                    ? Icons.restaurant
                    : category == 'Hydration'
                    ? Icons.water_drop
                    : Icons.food_bank,
                color: Colors.teal,
                size: 24,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  category,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal.shade800,
                  ),
                ),
              ),
              Icon(
                _selectedCategory == category
                    ? Icons.arrow_drop_down
                    : Icons.arrow_right,
                color: Colors.teal,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryDetails(String category) {
    final items = _categoryContent[category] ?? [];

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '$category',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.teal.shade700,
              ),
            ),
            const SizedBox(height: 12),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(Icons.fiber_manual_record, size: 12, color: Colors.teal),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item['name']!,
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              item['benefits']!,
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.teal.shade800,
                              ),
                            ),
                            const Divider(height: 16),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
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
          'Food & Nutrition',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.teal,
        centerTitle: true,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Category list
                ..._categoryContent.keys.map((category) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildCategoryCard(category),
                      if (_selectedCategory == category)
                        _buildCategoryDetails(category),
                    ],
                  );
                }).toList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}