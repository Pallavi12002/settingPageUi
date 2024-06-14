
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _isSmsNotificationEnabled = false;
  String _gender = 'Male';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF7463F0),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            // Handle back button press
          },
        ),
        title: Text('Settings', style: TextStyle(color: Colors.black)),
      ),
      body: Container(
        color: Color(0xFF7463F0),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildTextField('Username', 'Enter your username', false),
                    SizedBox(height: 16),
                    _buildEditableTextField('Email', 'Enter your email'),
                    SizedBox(height: 16),
                    _buildEditableTextField('Mobile', 'Enter your mobile number'),
                    SizedBox(height: 16),
                    _buildTextField('Date of Birth', 'Enter your date of birth', false),
                    SizedBox(height: 16),
                    _buildGenderSelector(),
                    SizedBox(height: 16),
                    _buildSmsNotificationToggle(),
                    SizedBox(height: 24),
                    _buildSaveButton(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, String hint, bool enabled) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        SizedBox(height: 8),
        TextField(
          enabled: enabled,
          decoration: InputDecoration(
            hintText: hint,
            filled: true,
            fillColor: Colors.grey[200],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildEditableTextField(String label, String hint) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: hint,
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            SizedBox(width: 8),
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                // Handle edit button press
              },
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildGenderSelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Gender'),
        SizedBox(height: 8),
        Row(
          children: [
            _buildRadioButton('Male'),
            _buildRadioButton('Female'),
            _buildRadioButton('Others'),
          ],
        ),
      ],
    );
  }

  Widget _buildRadioButton(String value) {
    return Row(
      children: [
        Radio(
          value: value,
          groupValue: _gender,
          onChanged: (String? newValue) {
            setState(() {
              _gender = newValue!;
            });
          },
        ),
        Text(value),
      ],
    );
  }

  Widget _buildSmsNotificationToggle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Allow SMS notification'),
        Switch(
          value: _isSmsNotificationEnabled,
          onChanged: (bool newValue) {
            setState(() {
              _isSmsNotificationEnabled = newValue;
            });
          },
        ),
      ],
    );
  }

  Widget _buildSaveButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFF7463F0), // Corrected property name
          padding: EdgeInsets.symmetric(vertical: 16.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        onPressed: () {
          // Handle save button press
        },
        child: Text(
          'Save',
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}
