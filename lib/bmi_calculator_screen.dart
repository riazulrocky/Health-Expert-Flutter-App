import 'package:flutter/material.dart';

class BMICalculatorScreen extends StatefulWidget {
  const BMICalculatorScreen({Key? key}) : super(key: key);

  @override
  State<BMICalculatorScreen> createState() => _BMICalculatorScreenState();
}

class _BMICalculatorScreenState extends State<BMICalculatorScreen> {
  int _feet = 5; // Default height in feet
  int _inches = 0; // Default height in inches
  double _weight = 60.0; // Default weight in kg
  double? _bmi;
  String _result = '';
  List<String> _healthTips = [];

  void _calculateBMI() {
    final heightInCm = (_feet * 30.48) + (_inches * 2.54); // Convert height from feet and inches to cm
    final bmi = _weight / ((heightInCm / 100) * (heightInCm / 100));

    setState(() {
      _bmi = bmi;

      if (bmi < 18.5) {
        _result = 'Underweight';
        _healthTips = [
          'Try to eat more calorie-dense foods.',
          'Include protein-rich foods in your diet.',
          'Consult a nutritionist for personalized advice.',
        ];
      } else if (bmi >= 18.5 && bmi < 25) {
        _result = 'Healthy';
        _healthTips = [
          'Maintain a balanced diet and regular exercise.',
          'Stay hydrated and get enough sleep.',
          'Continue your healthy lifestyle.',
        ];
      } else if (bmi >= 25 && bmi < 30) {
        _result = 'Overweight';
        _healthTips = [
          'Focus on reducing calorie intake.',
          'Increase physical activity levels.',
          'Consider consulting a healthcare professional.',
        ];
      } else {
        _result = 'Obese';
        _healthTips = [
          'Seek medical advice for a structured weight loss plan.',
          'Engage in regular exercise under supervision.',
          'Adopt a balanced diet with portion control.',
        ];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.teal,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              const Text(
                'Calculate Your BMI',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.teal),
              ),
              const SizedBox(height: 8),
              const Text(
                'Enter your height and weight to calculate your Body Mass Index (BMI).',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              const Divider(height: 30, thickness: 1),

              // Height Input (Feet)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Height (ft)',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '$_feet ft',
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Slider(
                value: _feet.toDouble(),
                min: 4.0,
                max: 7.0,
                divisions: 3,
                label: '$_feet ft',
                onChanged: (value) {
                  setState(() {
                    _feet = value.toInt();
                  });
                },
              ),

              // Height Input (Inches)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Height (in)',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '$_inches in',
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Slider(
                value: _inches.toDouble(),
                min: 0.0,
                max: 11.0,
                divisions: 11,
                label: '$_inches in',
                onChanged: (value) {
                  setState(() {
                    _inches = value.toInt();
                  });
                },
              ),

              // Weight Input
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Weight (kg)',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '${_weight.toStringAsFixed(1)} kg',
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Slider(
                value: _weight,
                min: 40.0,
                max: 150.0,
                divisions: 110,
                label: '${_weight.toStringAsFixed(1)} kg',
                onChanged: (value) {
                  setState(() {
                    _weight = value;
                  });
                },
              ),

              // Calculate Button
              ElevatedButton(
                onPressed: _calculateBMI,
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  backgroundColor: Colors.teal,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  elevation: 3,
                ),
                child: const Text(
                  'Calculate BMI',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 20),

              // BMI Display
              if (_bmi != null)
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.teal.shade100,
                        Colors.teal.shade50,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'BMI',
                            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            _bmi!.toStringAsFixed(2),
                            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Category: ',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            _result,
                            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      ..._healthTips.map((tip) => Text(
                        tip,
                        style: const TextStyle(fontSize: 16),
                      )),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}