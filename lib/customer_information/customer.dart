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
        fontFamily: 'Roboto', 
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
      appBar: AppBar(
        title: const Text('Customer Information', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        elevation: 0,
        backgroundColor: const Color(0xFF1565C0), 
        iconTheme: const IconThemeData(color: Colors.white), 
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [const Color(0xFFBBDEFB), const Color(0xFFE3F2FD)], // Brighter gradient background
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Navbar Section (Left)
                Expanded(
                  flex: 0, // Do not expand
                  child: Container(
                    width: 250, // Fixed width
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [const Color(0xFF1565C0), const Color(0xFF1976D2)], // Brighter gradient for navbar
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        ListTile(
                          leading: Icon(Icons.location_on, color: Colors.white),
                          title: Text('Address', style: TextStyle(color: Colors.white)),
                        ),
                        ListTile(
                          leading: Icon(Icons.person_add, color: Colors.white),
                          title: Text('Introducer Details', style: TextStyle(color: Colors.white)),
                        ),
                        ListTile(
                          leading: Icon(Icons.camera_alt, color: Colors.white),
                          title: Text('Capture Photo And Signature', style: TextStyle(color: Colors.white)),
                        ),
                        ListTile(
                          leading: Icon(Icons.account_balance, color: Colors.white),
                          title: Text('Bank Accounts', style: TextStyle(color: Colors.white)),
                        ),
                        ListTile(
                          leading: Icon(Icons.family_restroom, color: Colors.white),
                          title: Text('Next of Kin Relation', style: TextStyle(color: Colors.white)),
                        ),
                        ListTile(
                          leading: Icon(Icons.person, color: Colors.white),
                          title: Text('Client Profile Change', style: TextStyle(color: Colors.white)),
                        ),
                        ListTile(
                          leading: Icon(Icons.tune, color: Colors.white),
                          title: Text('User Defined Fields 1', style: TextStyle(color: Colors.white)),
                        ),
                        ListTile(
                          leading: Icon(Icons.tune, color: Colors.white),
                          title: Text('User Defined Fields 2', style: TextStyle(color: Colors.white)),
                        ),
                        ListTile(
                          leading: Icon(Icons.tune, color: Colors.white),
                          title: Text('User Defined Fields 3', style: TextStyle(color: Colors.white)),
                        ),
                        ListTile(
                          leading: Icon(Icons.money, color: Colors.white),
                          title: Text('Registration Fees and Shares', style: TextStyle(color: Colors.white)),
                        ),
                        ListTile(
                          leading: Icon(Icons.verified_user, color: Colors.white),
                          title: Text('Member Activation', style: TextStyle(color: Colors.white)),
                        ),
                      ],
                    ),
                  ),
                ),
                // Main Content Section (Middle) 
                Expanded(
                  flex: 2, 
                  child: Container(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Branch & Member Details
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white, // White container color
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Branch & Member Details',
                                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF1565C0)),
                                    ),
                                    const SizedBox(height: 10),
                                    _buildTextField(_branchIdController, 'Branch ID'),
                                    const SizedBox(height: 10),
                                    _buildTextField(_memberIdController, 'Member ID'),
                                    const SizedBox(height: 10),
                                    _buildTextField(_clientNameController, 'Client Name'),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 20),
                              Expanded(
                                flex: 1,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    _buildDropdown(
                                      value: _selectedClientType,
                                      label: 'Client Type',
                                      items: ['Individual', 'Corporate'],
                                      onChanged: (value) => setState(() => _selectedClientType = value),
                                    ),
                                    const SizedBox(height: 10),
                                    _buildDropdown(
                                      value: _selectedClientClass,
                                      label: 'Client Class',
                                      items: ['Premium', 'Standard', 'Basic'],
                                      onChanged: (value) => setState(() => _selectedClientClass = value),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        // Personal Details
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white, 
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Personal Details',
                                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF1565C0)),
                                    ),
                                    const SizedBox(height: 10),
                                    _buildTextField(null, 'Title'),
                                    const SizedBox(height: 10),
                                    _buildTextField(null, 'Middle Name'),
                                    const SizedBox(height: 10),
                                    _buildDropdown(
                                      value: null, 
                                      label: 'Gender',
                                      items: ['Male', 'Female', 'Other'],
                                      onChanged: (value) {},
                                    ),
                                    const SizedBox(height: 10),
                                    _buildTextField(null, 'Nationality'),
                                    const SizedBox(height: 10),
                                    _buildDropdown(
                                      value: null, 
                                      label: 'Identification Type',
                                      items: ['ID', 'Passport', 'Other'],
                                      onChanged: (value) {},
                                    ),
                                    const SizedBox(height: 10),
                                    _buildTextField(null, 'Issued by'),
                                    const SizedBox(height: 10),
                                    _buildTextField(null, 'TIN'),
                                    const SizedBox(height: 10),
                                    _buildTextField(null, 'Number of House Members'),
                                    const SizedBox(height: 10),
                                    _buildTextField(null, 'is Disabled'),
                                    const SizedBox(height: 10),
                                    _buildDropdown(
                                      value: null, 
                                      label: 'Literacy Level',
                                      items: ['Fluent', 'Beginner', 'Eloquent', 'None'],
                                      onChanged: (value) {},
                                    ),
                                    const SizedBox(height: 10),
                                    _buildTextField(null, 'Opened By'),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 20),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    _buildTextField(null, 'First Name'),
                                    const SizedBox(height: 10),
                                    _buildTextField(null, 'Last Name'),
                                    const SizedBox(height: 10),
                                    _buildTextField(null, 'Date of Birth'),
                                    const SizedBox(height: 10),
                                    _buildTextField(null, 'Age as on Resident'),
                                    const SizedBox(height: 10),
                                    _buildTextField(null, 'Identification Number'),
                                    const SizedBox(height: 10),
                                    _buildTextField(null, 'Identification Expiry Date'),
                                    const SizedBox(height: 10),
                                    _buildTextField(null, 'Marital Status'),
                                    const SizedBox(height: 10),
                                    _buildTextField(null, 'Number of Children'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        // Additional Information
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white, 
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Additional Information',
                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF1565C0)),
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        _buildDropdown(
                                          value: _selectedStatus,
                                          label: 'Status',
                                          items: ['Active', 'Inactive', 'Pending'],
                                          onChanged: (value) => setState(() => _selectedStatus = value),
                                        ),
                                        const SizedBox(height: 10),
                                        _buildDropdown(
                                          value: _selectedCreatedBy,
                                          label: 'Created By',
                                          items: ['Admin', 'Manager', 'User'],
                                          onChanged: (value) => setState(() => _selectedCreatedBy = value),
                                        ),
                                        const SizedBox(height: 10),
                                        _buildDropdown(
                                          value: _selectedCreatedOn,
                                          label: 'Created On',
                                          items: ['2023-01-01', '2023-02-01', '2023-03-01'],
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
                                        _buildDropdown(
                                          value: _selectedOpenedDate,
                                          label: 'Opened Date',
                                          items: ['2023-01-01', '2023-02-01', '2023-03-01'],
                                          onChanged: (value) => setState(() => _selectedOpenedDate = value),
                                        ),
                                        const SizedBox(height: 10),
                                        _buildDropdown(
                                          value: _selectedModifiedBy,
                                          label: 'Modified By',
                                          items: ['Admin', 'Manager', 'User'],
                                          onChanged: (value) => setState(() => _selectedModifiedBy = value),
                                        ),
                                        const SizedBox(height: 10),
                                        _buildDropdown(
                                          value: _selectedModifiedOn,
                                          label: 'Modified On',
                                          items: ['2023-01-01', '2023-02-01', '2023-03-01'],
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
                                        _buildDropdown(
                                          value: _selectedClosedDate,
                                          label: 'Closed Date',
                                          items: ['2023-01-01', '2023-02-01', '2023-03-01'],
                                          onChanged: (value) => setState(() => _selectedClosedDate = value),
                                        ),
                                        const SizedBox(height: 10),
                                        _buildDropdown(
                                          value: _selectedSupervisedBy,
                                          label: 'Supervised By',
                                          items: ['Admin', 'Manager', 'User'],
                                          onChanged: (value) => setState(() => _selectedSupervisedBy = value),
                                        ),
                                        const SizedBox(height: 10),
                                        _buildDropdown(
                                          value: _selectedSupervisedOn,
                                          label: 'Supervised On',
                                          items: ['2023-01-01', '2023-02-01', '2023-03-01'],
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
                
                Expanded(
                  flex: 0, 
                  child: Container(
                    width: 150, 
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [const Color(0xFF1565C0), const Color(0xFF1976D2)], // Brighter gradient for button panel
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        _buildButton('Close', Icons.close, () {}),
                        _buildButton('Save', Icons.save, () {}),
                        _buildButton('View', Icons.visibility, () {}),
                        _buildButton('Cancel', Icons.cancel, () {}),
                        _buildButton('Edit', Icons.edit, () {}),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Helper method to build text fields
  Widget _buildTextField(TextEditingController? controller, String label) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: Colors.grey[200], // Light grey background for text fields
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.blue, width: 2),
        ),
      ),
    );
  }

  // Helper method to build dropdowns
  Widget _buildDropdown({
    required String? value,
    required String label,
    required List<String> items,
    required Function(String?) onChanged,
  }) {
    return DropdownButtonFormField<String>(
      value: value,
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: Colors.grey[200], // Light grey background for dropdowns
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.blue, width: 2),
        ),
      ),
      items: items.map((item) {
        return DropdownMenuItem(
          value: item,
          child: Text(item),
        );
      }).toList(),
      onChanged: onChanged,
    );
  }

  // Helper method to build buttons
  Widget _buildButton(String text, IconData icon, VoidCallback onPressed) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon, color: Colors.white), // White icon
        label: Text(
          text,
          style: const TextStyle(color: Colors.white), // White text
        ),
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 50), // Full width button
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          backgroundColor: const Color(0xFF1565C0), // Brighter button color
        ),
      ),
    );
  }
}