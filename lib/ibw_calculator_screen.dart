import 'package:flutter/material.dart';

class IBWCalculatorScreen extends StatefulWidget {
  const IBWCalculatorScreen({Key? key}) : super(key: key);

  @override
  State<IBWCalculatorScreen> createState() => _IBWCalculatorScreenState();
}

class _IBWCalculatorScreenState extends State<IBWCalculatorScreen> {
  int _feet = 5; // Default height in feet
  int _inches = 0; // Default height in inches
  String _gender = 'Male'; // Default gender
  double? _ibw;
  String _result = '';

  void _calculateIBW() {
    final heightInInches = (_feet * 12) + _inches;

    if (heightInInches <= 0) {
      setState(() {
        _result = 'Please enter a valid height.';
        _ibw = null;
      });
      return;
    }

    // Calculate IBW using Devine Formula
    double ibw;
    if (_gender == 'Male') {
      ibw = 50 + (2.3 * (heightInInches - 60));
    } else {
      ibw = 45.5 + (2.3 * (heightInInches - 60));
    }

    setState(() {
      _ibw = ibw;
      _result = 'Your Ideal Body Weight is ${_ibw!.toStringAsFixed(2)} kg';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IBW Calculator', style: TextStyle(color: Colors.white)),
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
                'Calculate Your Ideal Body Weight (IBW)',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.teal),
              ),
              const SizedBox(height: 8),
              const Text(
                'Enter your height and select your gender to calculate your Ideal Body Weight (IBW).',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              const Divider(height: 30, thickness: 1),

              // Gender Selection
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Gender',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      _buildGenderButton('Male'),
                      const SizedBox(width: 10),
                      _buildGenderButton('Female'),
                    ],
                  ),
                ],
              ),

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
                    _feet = value.toInt(); // Convert to int
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
                    _inches = value.toInt(); // Convert to int
                  });
                },
              ),

              // Calculate Button
              ElevatedButton(
                onPressed: _calculateIBW,
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  backgroundColor: Colors.teal,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  elevation: 3,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.monitor_weight, color: Colors.white),
                    const SizedBox(width: 8),
                    const Text(
                      'Calculate IBW',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // IBW Display
              if (_ibw != null)
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
                      Text(
                        _result,
                        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to build gender selection buttons
  Widget _buildGenderButton(String gender) {
    final isSelected = _gender == gender;

    return ElevatedButton(
      onPressed: () {
        setState(() {
          _gender = gender;
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? Colors.teal : Colors.grey[300],
        foregroundColor: isSelected ? Colors.white : Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        minimumSize: const Size(100, 40),
      ),
      child: Text(
        gender,
        style: TextStyle(fontWeight: isSelected ? FontWeight.bold : FontWeight.normal),
      ),
    );
  }
}