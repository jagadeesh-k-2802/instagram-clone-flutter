import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:instagram_clone/theme/theme.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool hidePassword = true;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RichText(
              text: TextSpan(
                style: textTheme.bodyMedium,
                children: <TextSpan>[
                  const TextSpan(text: 'Don\'t have an account? '),
                  TextSpan(
                    text: 'Sign Up.',
                    style: textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        context.pushNamed('signup');
                      },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: defaultPagePadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              heightFactor: 0,
              child: SizedBox(
                width: 200,
                child: Image.asset('assets/images/instagram_text_logo.png'),
              ),
            ),
            const SizedBox(height: 60),
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
            ElevatedButton(
              onPressed: () {},
              child: const Text('Log In'),
            ),
            const SizedBox(height: 15),
            RichText(
              text: TextSpan(
                style: textTheme.bodyMedium,
                children: <TextSpan>[
                  const TextSpan(text: 'Forgot your login details? '),
                  TextSpan(
                    text: 'Get help logging in.',
                    style: textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        context.pushNamed('forgot-password');
                      },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
