import 'package:flutter/material.dart';

void main() {
  runApp(ProfileApp());
}

class ProfileApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatefulWidget {
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  String username = "Umair Khan";
  String email = "umair@example.com";
  final TextEditingController _usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var orientation = MediaQuery.of(context).orientation == Orientation.portrait
        ? "Portrait"
        : "Landscape";

    return Scaffold(
      appBar: AppBar(
        title: Text("Profile Screen"),
        backgroundColor: Colors.teal,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Profile picture
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/profile.jpg'),
              ),
              SizedBox(height: 16),

              // Dynamic username and email
              RichText(
                text: TextSpan(
                  style: TextStyle(color: Colors.black, fontSize: 18),
                  children: [
                    TextSpan(
                      text: "$username\n",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                    ),
                    TextSpan(
                      text: email,
                      style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),

              // Buttons Row
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: Text("Follow"),
                  ),
                  SizedBox(width: 10),
                  TextButton(
                    onPressed: () {},
                    child: Text("Message"),
                  ),
                ],
              ),
              SizedBox(height: 20),

              // Description
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.teal.shade50,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  "A passionate Flutter developer who loves to build beautiful and functional apps.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
              ),
              SizedBox(height: 20),

              // Username field
              Form(
                key: _formKey,
                child: TextFormField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    labelText: "Enter new username",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Username cannot be empty';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 10),

              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    setState(() {
                      username = _usernameController.text;
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Username updated to $username")),
                    );
                  }
                },
                child: Text("Update Username"),
              ),

              SizedBox(height: 30),

              // Orientation text
              Text(
                "Current Orientation: $orientation",
                style: TextStyle(fontSize: 16, color: Colors.teal),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
