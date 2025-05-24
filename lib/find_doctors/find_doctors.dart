import 'package:flutter/material.dart';
import 'package:health_app/find_doctors/back.dart';
import 'package:health_app/find_doctors/chest.dart';
import 'package:health_app/find_doctors/ent_page.dart';
import 'package:health_app/find_doctors/eye.dart';
import 'package:health_app/find_doctors/face_mouth.dart';
import 'package:health_app/find_doctors/genital.dart';
import 'package:health_app/ibw_calculator.dart';

import 'abdomen.dart';
import 'arm.dart';
import 'kidney.dart'; // Final ArmPage

class FindDoctorsPage extends StatelessWidget {
  FindDoctorsPage({super.key});

  final List<Map<String, dynamic>> _bodyParts = [
    {'name': 'Abdomen', 'icon': Icons.health_and_safety},
    {'name': 'Arm', 'icon': Icons.pan_tool},
    {'name': 'Back', 'icon': Icons.accessibility_new},
    {'name': 'Kidney', 'icon': Icons.healing},
    {'name': 'Chest', 'icon': Icons.favorite},
    {'name': 'Ear, Nose, Throat', 'icon': Icons.hearing},
    {'name': 'Eye', 'icon': Icons.remove_red_eye},
    {'name': 'Face & Mouth', 'icon': Icons.face},
    {'name': 'Genitals', 'icon': Icons.wc},
    {'name': 'Head', 'icon': Icons.headset_mic},
    {'name': 'Leg & Foot', 'icon': Icons.directions_run},
    {'name': 'Skin', 'icon': Icons.spa},
    {'name': 'Tooth', 'icon': Icons.local_drink},
  ];

  Widget _buildBodyPartItem(BuildContext context, Map<String, dynamic> part) {
    return ListTile(
      leading: Icon(part['icon'] as IconData, color: Colors.teal),
      title: Text(
        part['name'] as String,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Colors.teal.shade800,
        ),
      ),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.teal),
        onTap: () {
          final String name = part['name']! as String;

          if (name == 'Abdomen') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => AbdomenPage()),
            );
          } else if (name == 'Arm') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => ArmPage()),
            );
          }
          else if (name == 'Back') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => BackPage()),
            );
          } else if (name == 'Kidney') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => KidneyPage()),
            );
          } else if (name == 'Chest') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => ChestPage()),
            );
          } else if (name == 'Ear, Nose, Throat') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => EntPage()),
            );
          } else if (name == 'Eye') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => EyePage()),
            );
          } else if (name == 'Face & Mouth') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => FaceMouthPage()),
            );
          } else if (name == 'Genitals') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => GenitalPage()),
            );
          } else {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => IBWCalculatorScreen()),
            );
          }
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Find Doctors', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.teal,
        centerTitle: true,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Container(
        padding: const EdgeInsets.all(12),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.white, Colors.white],
          ),
        ),
        child: ListView.separated(
          itemCount: _bodyParts.length,
          separatorBuilder: (_, __) => const Divider(height: 1, color: Colors.teal),
          itemBuilder: (context, index) => _buildBodyPartItem(context, _bodyParts[index]),
        ),
      ),
    );
  }
}