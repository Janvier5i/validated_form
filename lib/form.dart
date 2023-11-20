import 'package:flutter/material.dart';
import 'package:validated_form/form_validation_mixin.dart';

class FormValidationScreen extends StatefulWidget {
  const FormValidationScreen({super.key});

  @override
  State<FormValidationScreen> createState() => _FormValidationScreenState();
}

class _FormValidationScreenState extends State<FormValidationScreen>
    with FormValidationMixin {
  // adding FormValidationMixin
  final _formKey = GlobalKey<FormState>();

  final _userNameTEC = TextEditingController();
  final _mobileTEC = TextEditingController();
  final _emailTEC = TextEditingController();
  final _passwordTEC = TextEditingController();

  final _userNameFocusNode = FocusNode();
  final _mobileFocusNode = FocusNode();
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black54,
        centerTitle: true,
        title: const Text('Form Validation'),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 50),
                ),
                const Text(
                  'Sign Up',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _userNameTEC,
                  focusNode: _userNameFocusNode,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.person),
                    labelText: 'Name',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25)),
                  ),
                  validator: validateUserName, // Validating name
                  onFieldSubmitted: (value) {
                    _userNameFocusNode.unfocus();
                    FocusScope.of(context).requestFocus(_mobileFocusNode);
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _mobileTEC,
                  focusNode: _mobileFocusNode,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.phone),
                    labelText: 'Mobile',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25)),
                  ),
                  validator: validateMobile, // Validating mobile
                  onFieldSubmitted: (value) {
                    _mobileFocusNode.unfocus();
                    FocusScope.of(context).requestFocus(_emailFocusNode);
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _emailTEC,
                  focusNode: _emailFocusNode,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.email),
                    labelText: 'Email',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25)),
                  ),
                  validator: validateEmail, // Validating email
                  onFieldSubmitted: (value) {
                    _emailFocusNode.unfocus();
                    FocusScope.of(context).requestFocus(_passwordFocusNode);
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _passwordTEC,
                  focusNode: _passwordFocusNode,
                  obscureText: true,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.password),
                    labelText: 'Password',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25)),
                    errorMaxLines: 3,
                  ),
                  validator: validatePassword, // Validating password
                  onFieldSubmitted: (value) {
                    _passwordFocusNode.unfocus();
                  },
                ),
                const SizedBox(height: 20),
                OutlinedButton.icon(
                  icon: const Icon(Icons.send),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Thank you!')),
                      );
                    }
                  },
                  label: const Text('Submit'),
                  style: OutlinedButton.styleFrom(
                      minimumSize: const Size(200, 50),
                      foregroundColor: Colors.black,
                      side: const BorderSide(color: Colors.black),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30))),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
