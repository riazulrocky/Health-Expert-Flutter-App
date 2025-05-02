import 'package:flutter/material.dart';

class BMICalculatorScreen extends StatefulWidget {
  const BMICalculatorScreen({super.key});

  @override
  State<BMICalculatorScreen> createState() => _BMICalculatorScreenState();
}

class _BMICalculatorScreenState extends State<BMICalculatorScreen> {
  int? _feet; // No default value for feet
  int? _inches; // No default value for inches
  int? _weight; // No default value for weight
  double? _bmi;
  String _result = '';
  List<String> _healthTips = [];

  void _calculateBMI() {
    if (_feet == null || _inches == null || _weight == null) {
      setState(() {
        _result = 'Please enter valid height and weight.';
        _bmi = null;
        _healthTips = [];
      });
      return;
    }

    final heightInCm = (_feet! * 30.48) + (_inches! * 2.54); // Convert height from feet and inches to cm
    if (heightInCm <= 0 || _weight! <= 0) {
      setState(() {
        _result = 'Please enter valid height and weight.';
        _bmi = null;
        _healthTips = [];
      });
      return;
    }

    final bmi = _weight! / ((heightInCm / 100) * (heightInCm / 100));

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
        _result = 'Normal';
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
        iconTheme: const IconThemeData(color: Colors.white),
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

              // Height Input (Feet and Inches Combined)
              const SizedBox(height: 16), // Perfect spacing before "Height" headline
              const Text(
                'Height',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8), // Small spacing between headline and input fields
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        setState(() {
                          _feet = int.tryParse(value); // No default value
                        });
                      },
                      decoration: InputDecoration(
                        labelText: 'Feet',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        errorText: _feet == null && _result.isNotEmpty ? 'Please enter feet' : null,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        setState(() {
                          _inches = int.tryParse(value); // No default value
                        });
                      },
                      decoration: InputDecoration(
                        labelText: 'Inches',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        errorText: _inches == null && _result.isNotEmpty ? 'Please enter inches' : null,
                      ),
                    ),
                  ),
                ],
              ),

              // Weight Input
              const SizedBox(height: 16), // Perfect spacing before "Weight" headline
              const Text(
                'Weight',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8), // Small spacing between headline and input field
              TextField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    _weight = int.tryParse(value); // No default value
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Weight (kg)',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  errorText: _weight == null && _result.isNotEmpty ? 'Please enter weight' : null,
                ),
              ),
              const SizedBox(height: 20),

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
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
              const SizedBox(height: 20),

              // BMI Display
              if (_bmi != null)
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.teal.shade100, Colors.teal.shade50],
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