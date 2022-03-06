import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _name;
  String _age;
  String _email;
  String _bloodgrp;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void sendData() {}

  void createAlbum() async {
    print("It reached createAlbum??");
    final response = await http.post(
      Uri.parse('http://localhost:3000/api/auth/login'),
      body: {
        'email': 'pritishstudies@gmail.com',
        'password': 'pritish@123'
      },
    );

    print("What abt here??");
    print(response.statusCode);
    if (response.statusCode == 200) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      // print("Aight");
      print(response.body);
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      // print(response.);
      throw Exception('Failed to create album.');
    }
  }

  Widget _buildNameField() {
    return TextFormField(
      keyboardType: TextInputType.name,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Name can't be empty";
        }
        return null;
      },
      decoration: InputDecoration(labelText: "Full  Name"),
      onSaved: (String value) {
        _name = value;
      },
    );
  }

  Widget _buildAgeField() {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(labelText: "Age"),
      validator: (value) {
        int temp_bp = int.tryParse(value);
        if (temp_bp == null || temp_bp <= 0) {
          return "Age must be greater than 0";
        } else if (temp_bp <= 18) {
          return "Donor's age must be greater than 18";
        }
        return null;
      },
      onSaved: (String value) {
        _age = value;
      },
    );
  }

  Widget _buildEmailField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(labelText: "Enter email address"),
      validator: (val) => !EmailValidator.validate(val, true) ? 'Not a valid email.' : null,
      onSaved: (String value) {
        _email = value;
      },
    );
  }

  Widget _buildBloodGrpField() {
    return TextFormField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(labelText: "Please enter your blood type"),
      validator: (String value) {
        RegExp exp = RegExp(r"^(A|B|AB|O)[+-]$");
        if (!exp.hasMatch(value)) {
          return "Incorrect blood group";
        }
        if (value == null || value.isEmpty) {
          return "Please enter your blood group";
        }
        return '';
      },
      onSaved: (String value) {
        _bloodgrp = value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 40),
              ),
              Text(
                "Welcome, please provide the",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              Text(
                "folowing information",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  child: Container(
                    padding: EdgeInsets.all(24),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: 20),
                          _buildNameField(),
                          SizedBox(height: 20),
                          _buildAgeField(),
                          SizedBox(height: 20),
                          _buildEmailField(),
                          SizedBox(height: 20),
                          _buildBloodGrpField(),
                          SizedBox(height: 30),
                          RaisedButton(
                            color: Colors.blue,
                            padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
                            child: Text(
                              "Next",
                              style: TextStyle(fontSize: 16.0),
                            ),
                            onPressed: () async {
                              print("bruhh");
                              // if (!_formKey.currentState.validate()) {
                              //   print("Is it coming here?");
                              //   return;
                              // }
                              print("here?");
                              _formKey.currentState.save();
                              print(_age);
                              createAlbum();
                              // store the data in firestore
                            },
                            // color: Colors.blue,
                            elevation: 10.0,
                            textColor: Colors.white,
                            splashColor: Colors.grey,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
