import 'package:flutter/material.dart';

class IBWCalculatorScreen extends StatefulWidget {
  const IBWCalculatorScreen({Key? key}) : super(key: key);

  @override
  State<IBWCalculatorScreen> createState() => _IBWCalculatorScreenState();
}

class _IBWCalculatorScreenState extends State<IBWCalculatorScreen> {
  final TextEditingController _heightController = TextEditingController();
  String? _gender = 'Male'; // Default gender
  double? _ibw;
  String _result = '';

  void _calculateIBW() {
    final heightInInches = int.tryParse(_heightController.text);

    if (heightInInches == null || heightInInches <= 0) {
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
                  DropdownButton<String>(
                    value: _gender,
                    items: ['Male', 'Female']
                        .map((gender) => DropdownMenuItem<String>(
                      value: gender,
                      child: Text(gender),
                    ))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        _gender = value;
                      });
                    },
                  ),
                ],
              ),

              // Height Input
              TextField(
                controller: _heightController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Height (in inches)',
                  border: OutlineInputBorder(),
                  hintText: 'e.g., 70',
                ),
              ),
              const SizedBox(height: 20),

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
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Note: This is based on the Devine Formula.',
                        style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
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

  @override
  void dispose() {
    _heightController.dispose();
    super.dispose();
  }
}