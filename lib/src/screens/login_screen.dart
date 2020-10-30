import 'package:flutter/material.dart';
import '../Mixin/validation_mixin.dart';

class LoginScreen extends StatefulWidget {
  createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> with ValidationMixin {
  final formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';

  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            emailField(),
            passwordField(),
            Container(margin: EdgeInsets.only(top: 25.0)),
            submitButton(),
          ],
        ),
      ),
    );
  }

  Widget emailField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: 'Email Address',
        hintText: 'you@example.com',
      ),
      validator: validateEmail,
      onSaved: (String value) => email = value,
    );
  }

  Widget passwordField() {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: '******',
      ),
      validator: validatePassword,
      onSaved: (String value) => password = value,
    );
  }

  Widget submitButton() {
    return RaisedButton(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      color: Colors.blue[400],
      child: Text(
        'Submit!',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      onPressed: () {
        if (formKey.currentState.validate()) {
          formKey.currentState.save();
          print('Email: $email, Password: $password');
        }
      },
    );
  }
}
