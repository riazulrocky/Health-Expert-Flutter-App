import 'package:flutter/material.dart';

class BMICalculatorScreen extends StatefulWidget {
  const BMICalculatorScreen({Key? key}) : super(key: key);

  @override
  State<BMICalculatorScreen> createState() => _BMICalculatorScreenState();
}

class _BMICalculatorScreenState extends State<BMICalculatorScreen> {
  final TextEditingController _feetController = TextEditingController();
  final TextEditingController _inchesController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();

  double? _bmi;
  String _result = '';

  void _calculateBMI() {
    final feet = int.tryParse(_feetController.text);
    final inches = int.tryParse(_inchesController.text);
    final weight = double.tryParse(_weightController.text);

    // Validate inputs
    if (feet == null || inches == null || weight == null || feet <= 0 || inches < 0 || weight <= 0) {
      setState(() {
        _result = 'Please enter valid height and weight.';
        _bmi = null;
      });
      return;
    }

    // Convert height from feet and inches to centimeters
    final heightInCm = (feet * 30.48) + (inches * 2.54);

    // Calculate BMI
    final bmi = weight / ((heightInCm / 100) * (heightInCm / 100));
    setState(() {
      _bmi = bmi;

      if (bmi < 18.5) {
        _result = 'Underweight';
      } else if (bmi < 24.9) {
        _result = 'Normal Weight';
      } else if (bmi < 29.9) {
        _result = 'Overweight';
      } else {
        _result = 'Obese';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
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

              // Height Input (Feet and Inches)
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _feetController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Height (ft)',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        filled: true,
                        fillColor: Colors.teal.withOpacity(0.1),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      controller: _inchesController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Height (in)',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        filled: true,
                        fillColor: Colors.teal.withOpacity(0.1),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Weight Input
              TextField(
                controller: _weightController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Weight (kg)',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  filled: true,
                  fillColor: Colors.teal.withOpacity(0.1),
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
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 20),

              // Result Display
              if (_bmi != null)
                Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Container(
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
                        Text(
                          'Your BMI: ${_bmi!.toStringAsFixed(2)}',
                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.teal),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Result: $_result',
                          style: const TextStyle(fontSize: 16, color: Colors.teal),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _feetController.dispose();
    _inchesController.dispose();
    _weightController.dispose();
    super.dispose();
  }
}