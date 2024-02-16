import 'package:flutter/material.dart';
import 'package:instagram_clone/theme/theme.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  int currentWidget = 0;
  bool hidePassword = true;

  Widget buildForgotPassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Find your Account',
          style: headlineLargeBold(context),
        ),
        const SizedBox(height: 8),
        Text(
          'Enter your username or email or phone number linked to your account.',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: 20),
        TextFormField(
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(
            hintText: 'Phone Number, E-mail or Username',
            contentPadding: EdgeInsets.all(16.0),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                width: 1,
                color: lightGrayColor,
              ),
            ),
            filled: true,
            fillColor: lightGrayColor,
          ),
        ),
        const SizedBox(height: 15),
        ElevatedButton(
          onPressed: () {
            setState(() => currentWidget++);
          },
          child: const Text('Next'),
        ),
      ],
    );
  }

  Widget buildConfirmationCode() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Enter Confirmation Code',
          style: headlineLargeBold(context),
        ),
        const SizedBox(height: 8),
        Text(
          'Enter the 6-digit confirmation code we sent to <account>.',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: 20),
        TextFormField(
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            hintText: 'Confirmation Code',
            contentPadding: EdgeInsets.all(16.0),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                width: 1,
                color: lightGrayColor,
              ),
            ),
            filled: true,
            fillColor: lightGrayColor,
          ),
        ),
        const SizedBox(height: 15),
        ElevatedButton(
          onPressed: () {
            setState(() => currentWidget++);
          },
          child: const Text('Next'),
        ),
      ],
    );
  }

  Widget buildNewPassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Enter your new Password',
          style: headlineLargeBold(context),
        ),
        const SizedBox(height: 8),
        Text(
          'Choose a new password with at least 6 characters or numbers.',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: 20),
        TextFormField(
          obscureText: hidePassword,
          keyboardType: TextInputType.visiblePassword,
          decoration: InputDecoration(
            hintText: 'Password',
            contentPadding: const EdgeInsets.all(16.0),
            border: const OutlineInputBorder(
              borderSide: BorderSide(
                width: 1,
                color: lightGrayColor,
              ),
            ),
            filled: true,
            fillColor: lightGrayColor,
            suffixIcon: IconButton(
              icon: Icon(
                hidePassword ? Icons.visibility : Icons.visibility_off,
              ),
              onPressed: () {
                setState(() {
                  hidePassword = !hidePassword;
                });
              },
            ),
          ),
        ),
        const SizedBox(height: 15),
        TextFormField(
          obscureText: hidePassword,
          keyboardType: TextInputType.visiblePassword,
          decoration: InputDecoration(
            hintText: 'Confirm Password',
            contentPadding: const EdgeInsets.all(16.0),
            border: const OutlineInputBorder(
              borderSide: BorderSide(
                width: 1,
                color: lightGrayColor,
              ),
            ),
            filled: true,
            fillColor: lightGrayColor,
            suffixIcon: IconButton(
              icon: Icon(
                hidePassword ? Icons.visibility : Icons.visibility_off,
              ),
              onPressed: () {
                setState(() {
                  hidePassword = !hidePassword;
                });
              },
            ),
          ),
        ),
        const SizedBox(height: 15),
        ElevatedButton(
          onPressed: () {},
          child: const Text('Submit'),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [
      buildForgotPassword(),
      buildConfirmationCode(),
      buildNewPassword(),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Login Help')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: defaultPagePadding),
        child: widgets[currentWidget],
      ),
    );
  }
}
