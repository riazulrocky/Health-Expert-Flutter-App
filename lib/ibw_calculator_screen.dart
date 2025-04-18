import 'package:flutter/material.dart';

class IBWCalculatorScreen extends StatefulWidget {
  const IBWCalculatorScreen({Key? key}) : super(key: key);

  @override
  State<IBWCalculatorScreen> createState() => _IBWCalculatorScreenState();
}

class _IBWCalculatorScreenState extends State<IBWCalculatorScreen> {
  int? _feet; // No default value for feet
  int? _inches; // No default value for inches
  String _gender = 'Male'; // Default gender
  int? _ibw; // Store IBW as an integer
  String _result = '';

  void _calculateIBW() {
    if (_feet == null || _inches == null) {
      setState(() {
        _result = 'Please enter a valid height.';
        _ibw = null;
      });
      return;
    }

    final heightInInches = (_feet! * 12) + _inches!;

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

    // Round the IBW to the nearest integer
    setState(() {
      _ibw = ibw.round(); // Convert to integer
      _result = 'Your Ideal Body Weight is $_ibw kg';
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
                  _buildGenderSelection(),
                ],
              ),
              const Divider(height: 30, thickness: 1),

              // Height Input (Feet)
              const Text(
                'Height',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: TextField(
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        setState(() {
                          _feet = int.tryParse(value);
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
                          _inches = int.tryParse(value);
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
              const Divider(height: 30, thickness: 1),

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
                child: const Text(
                  'Calculate IBW',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
              const SizedBox(height: 20),

              // IBW Display
              if (_ibw != null)
                Center(
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.teal.shade100, Colors.teal.shade50],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Text(
                      _result,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to build gender selection toggle buttons
  Widget _buildGenderSelection() {
    return ToggleButtons(
      borderRadius: BorderRadius.circular(8),
      isSelected: ['Male', 'Female'].map((g) => g == _gender).toList(),
      onPressed: (index) {
        setState(() {
          _gender = index == 0 ? 'Male' : 'Female';
        });
      },
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(
            'Male',
            style: TextStyle(
              color: _gender == 'Male' ? Colors.white : Colors.black,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(
            'Female',
            style: TextStyle(
              color: _gender == 'Female' ? Colors.white : Colors.black,
            ),
          ),
        ),
      ],
      fillColor: Colors.teal,
      selectedColor: Colors.white,
      color: Colors.black,
      borderWidth: 1,
      borderColor: Colors.teal,
      selectedBorderColor: Colors.teal,
    );
  }
}