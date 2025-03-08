import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Customer Info',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Customer(),
    );
  }
}

class Customer extends StatefulWidget {
  const Customer({super.key});

  @override
  _CustomerState createState() => _CustomerState();
}

class _CustomerState extends State<Customer> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _branchIdController = TextEditingController();
  final TextEditingController _memberIdController = TextEditingController();
  final TextEditingController _clientNameController = TextEditingController();
  String? _selectedClientType;
  String? _selectedClientClass;
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();

  // Additional Information Dropdowns
  String? _selectedStatus;
  String? _selectedCreatedBy;
  String? _selectedCreatedOn;
  String? _selectedOpenedDate;
  String? _selectedModifiedBy;
  String? _selectedModifiedOn;
  String? _selectedClosedDate;
  String? _selectedSupervisedBy;
  String? _selectedSupervisedOn;

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Form submitted successfully!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Customer Information')),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Navbar Section (Left)
              Container(
                width: 200, // Fixed width for the navbar
                color: Colors.blueGrey[100],
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    ListTile(title: Text('Address')),
                    ListTile(title: Text('Introducer Details')),
                    ListTile(title: Text('Capture Photo And Signature')),
                    ListTile(title: Text('Bank Accounts')),
                    ListTile(title: Text('Next of Kin Relation')),
                    ListTile(title: Text('Client Profile Change')),
                    ListTile(title: Text('User Defined Fields 1')),
                    ListTile(title: Text('User Defined Fields 2')),
                    ListTile(title: Text('User Defined Fields 3')),
                    ListTile(title: Text('Registration Fees and Shares')),
                    ListTile(title: Text('Member Activation')),
                  ],
                ),
              ),
              // Main Content Section (Middle)
              Expanded(
                flex: 1, // Reduced flex value to allocate less space
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Branch & Member Details
                      Container(
                        color: Colors.grey[300],
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('Branch & Member Details', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                                  TextFormField(
                                    controller: _branchIdController,
                                    decoration: InputDecoration(labelText: 'Branch ID'),
                                    validator: (value) => value!.isEmpty ? 'Required' : null,
                                  ),
                                  TextFormField(
                                    controller: _memberIdController,
                                    decoration: InputDecoration(labelText: 'Member ID'),
                                    validator: (value) => value!.isEmpty ? 'Required' : null,
                                  ),
                                  TextFormField(
                                    controller: _clientNameController,
                                    decoration: InputDecoration(labelText: 'Client Name'),
                                    validator: (value) => value!.isEmpty ? 'Required' : null,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              flex: 1,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  DropdownButtonFormField<String>(
                                    value: _selectedClientType,
                                    decoration: InputDecoration(labelText: 'Client Type'),
                                    items: ['Individual', 'Corporate']
                                        .map((type) => DropdownMenuItem(value: type, child: Text(type)))
                                        .toList(),
                                    onChanged: (value) => setState(() => _selectedClientType = value),
                                    validator: (value) => value == null ? 'Required' : null,
                                  ),
                                  DropdownButtonFormField<String>(
                                    value: _selectedClientClass,
                                    decoration: InputDecoration(labelText: 'Client Class'),
                                    items: ['Premium', 'Standard', 'Basic']
                                        .map((type) => DropdownMenuItem(value: type, child: Text(type)))
                                        .toList(),
                                    onChanged: (value) => setState(() => _selectedClientClass = value),
                                    validator: (value) => value == null ? 'Required' : null,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      // Personal Details
                      Container(
                        color: Colors.grey[200],
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('Personal Details', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                                  TextFormField(decoration: InputDecoration(labelText: 'Title')),
                                  TextFormField(decoration: InputDecoration(labelText: 'Middle Name')),
                                  DropdownButtonFormField<String>(
                                    decoration: InputDecoration(labelText: 'Gender'),
                                    items: ['Male', 'Female', 'Other']
                                        .map((gender) => DropdownMenuItem(value: gender, child: Text(gender)))
                                        .toList(),
                                    onChanged: (value) {},
                                  ),
                                  TextFormField(decoration: InputDecoration(labelText: 'Nationality')),
                                  DropdownButtonFormField<String>(
                                    decoration: InputDecoration(labelText: 'Identification Type'),
                                    items: ['ID', 'Passport', 'Other']
                                        .map((idType) => DropdownMenuItem(value: idType, child: Text(idType)))
                                        .toList(),
                                    onChanged: (value) {},
                                  ),
                                  TextFormField(decoration: InputDecoration(labelText: 'Issued by')),
                                  TextFormField(decoration: InputDecoration(labelText: 'TIN')),
                                  TextFormField(decoration: InputDecoration(labelText: 'Number of House Members')),
                                  TextFormField(decoration: InputDecoration(labelText: 'is Disabled')),
                                  DropdownButtonFormField<String>(
                                    decoration: InputDecoration(labelText: 'Literacy Level'),
                                    items: ['Fluent', 'Beginner', 'Eloquent', 'None']
                                        .map((idType) => DropdownMenuItem(value: idType, child: Text(idType)))
                                        .toList(),
                                    onChanged: (value) {},
                                  ),
                                  TextFormField(decoration: InputDecoration(labelText: 'Opened By')),
                                ],
                              ),
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextFormField(decoration: InputDecoration(labelText: 'First Name')),
                                  TextFormField(decoration: InputDecoration(labelText: 'Last Name')),
                                  TextFormField(decoration: InputDecoration(labelText: 'Date of Birth')),
                                  TextFormField(decoration: InputDecoration(labelText: 'Age as on Resident')),
                                  TextFormField(decoration: InputDecoration(labelText: 'Identification Number')),
                                  TextFormField(decoration: InputDecoration(labelText: 'Identification Expiry Date')),
                                  TextFormField(decoration: InputDecoration(labelText: 'Marital Status')),
                                  TextFormField(decoration: InputDecoration(labelText: 'Number of Children')),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      // Additional Information
                      Container(
                        color: Colors.grey[200],
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Additional Information', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      DropdownButtonFormField<String>(
                                        value: _selectedStatus,
                                        decoration: InputDecoration(labelText: 'Status'),
                                        items: ['Active', 'Inactive', 'Pending']
                                            .map((status) => DropdownMenuItem(value: status, child: Text(status)))
                                            .toList(),
                                        onChanged: (value) => setState(() => _selectedStatus = value),
                                      ),
                                      DropdownButtonFormField<String>(
                                        value: _selectedCreatedBy,
                                        decoration: InputDecoration(labelText: 'Created By'),
                                        items: ['Admin', 'Manager', 'User']
                                            .map((creator) => DropdownMenuItem(value: creator, child: Text(creator)))
                                            .toList(),
                                        onChanged: (value) => setState(() => _selectedCreatedBy = value),
                                      ),
                                      DropdownButtonFormField<String>(
                                        value: _selectedCreatedOn,
                                        decoration: InputDecoration(labelText: 'Created On'),
                                        items: ['2023-01-01', '2023-02-01', '2023-03-01']
                                            .map((date) => DropdownMenuItem(value: date, child: Text(date)))
                                            .toList(),
                                        onChanged: (value) => setState(() => _selectedCreatedOn = value),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 20),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      DropdownButtonFormField<String>(
                                        value: _selectedOpenedDate,
                                        decoration: InputDecoration(labelText: 'Opened Date'),
                                        items: ['2023-01-01', '2023-02-01', '2023-03-01']
                                            .map((date) => DropdownMenuItem(value: date, child: Text(date)))
                                            .toList(),
                                        onChanged: (value) => setState(() => _selectedOpenedDate = value),
                                      ),
                                      DropdownButtonFormField<String>(
                                        value: _selectedModifiedBy,
                                        decoration: InputDecoration(labelText: 'Modified By'),
                                        items: ['Admin', 'Manager', 'User']
                                            .map((modifier) => DropdownMenuItem(value: modifier, child: Text(modifier)))
                                            .toList(),
                                        onChanged: (value) => setState(() => _selectedModifiedBy = value),
                                      ),
                                      DropdownButtonFormField<String>(
                                        value: _selectedModifiedOn,
                                        decoration: InputDecoration(labelText: 'Modified On'),
                                        items: ['2023-01-01', '2023-02-01', '2023-03-01']
                                            .map((date) => DropdownMenuItem(value: date, child: Text(date)))
                                            .toList(),
                                        onChanged: (value) => setState(() => _selectedModifiedOn = value),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 20),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      DropdownButtonFormField<String>(
                                        value: _selectedClosedDate,
                                        decoration: InputDecoration(labelText: 'Closed Date'),
                                        items: ['2023-01-01', '2023-02-01', '2023-03-01']
                                            .map((date) => DropdownMenuItem(value: date, child: Text(date)))
                                            .toList(),
                                        onChanged: (value) => setState(() => _selectedClosedDate = value),
                                      ),
                                      DropdownButtonFormField<String>(
                                        value: _selectedSupervisedBy,
                                        decoration: InputDecoration(labelText: 'Supervised By'),
                                        items: ['Admin', 'Manager', 'User']
                                            .map((supervisor) => DropdownMenuItem(value: supervisor, child: Text(supervisor)))
                                            .toList(),
                                        onChanged: (value) => setState(() => _selectedSupervisedBy = value),
                                      ),
                                      DropdownButtonFormField<String>(
                                        value: _selectedSupervisedOn,
                                        decoration: InputDecoration(labelText: 'Supervised On'),
                                        items: ['2023-01-01', '2023-02-01', '2023-03-01']
                                            .map((date) => DropdownMenuItem(value: date, child: Text(date)))
                                            .toList(),
                                        onChanged: (value) => setState(() => _selectedSupervisedOn = value),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Button Panel (Far Right)
              Container(
                width: 100, // Fixed width for the button panel
                color: Colors.blueGrey[200],
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    _buildButton('Add', Icons.add, () {
                      // Add button action
                    }),
                    _buildButton('Update', Icons.update, () {
                      // Update button action
                    }),
                    _buildButton('Exit', Icons.exit_to_app, () {
                      // Exit button action
                    }),
                    // Add more buttons as needed
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to build buttons
  Widget _buildButton(String text, IconData icon, VoidCallback onPressed) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon),
        label: Text(text),
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 50), 
        ),
      ),
    );
  }
}