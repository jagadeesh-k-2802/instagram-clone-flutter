import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:instagram_clone/models/auth.dart';
import 'package:instagram_clone/redux/global_state.dart';
import 'package:instagram_clone/services/auth.dart';
import 'package:instagram_clone/theme/theme.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  bool hidePassword = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> sendLoginRequest() async {
    if (formKey.currentState?.validate() == false) return;

    try {
      await AuthService.login(
        identifier: emailController.text,
        password: passwordController.text,
        fcmToken: '',
      );

      UserResponse userResponse = await AuthService.getMe();
      store.dispatch(SetUserAction(userResponse.data));

      if (!mounted) return;
      context.goNamed('home');
    } catch (error) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(error.toString())),
      );
    }
  }

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
            Form(
              key: formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      hintText: 'Phone Number, E-mail or Username',
                    ),
                    validator: (String? value) {
                      if (value?.isEmpty == true) {
                        return 'Please, Enter E-mail, Username or Phone Number';
                      }

                      return null;
                    },
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    controller: passwordController,
                    obscureText: hidePassword,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      suffixIcon: IconButton(
                        icon: Icon(
                          hidePassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() => hidePassword = !hidePassword);
                        },
                      ),
                    ),
                    validator: (String? value) {
                      if (value?.isEmpty == true) {
                        return 'Please, Enter Password';
                      }

                      if ((value?.length ?? 0) < 6) {
                        return 'Password should be atleast minimum 6 characters';
                      }

                      return null;
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: sendLoginRequest,
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
