import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  late String _id, _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: const Text("Acc-Health")),
      ),
      body: Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  labelStyle: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                  labelText: "ID",
                  filled: true,
                  fillColor: Color.fromARGB(255, 44, 60, 106),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "ID cannot be empty";
                  }
                  return null;
                },
                onSaved: (value) => _id = value!,
              ),
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  labelStyle: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                  labelText: "Password",
                  filled: true,
                  fillColor: Color.fromARGB(255, 44, 60, 106),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Password cannot be empty";
                  }
                  return null;
                },
                onSaved: (value) => _password = value!,
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 44, 60, 106),
                    textStyle: TextStyle(color: Colors.white),
                    padding: EdgeInsets.all(15.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      Navigator.pushNamed(context, '/disease');
                      print("ID: $_id, Password: $_password");
                    }
                  },
                  child: Text("Login"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
