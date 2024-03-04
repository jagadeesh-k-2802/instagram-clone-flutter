import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:instagram_clone/config/assets.dart';
import 'package:instagram_clone/models/auth.dart';
import 'package:instagram_clone/router/routes.dart';
import 'package:instagram_clone/state/global_state_provider.dart';
import 'package:instagram_clone/services/auth.dart';
import 'package:instagram_clone/theme/theme.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  bool hidePassword = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await FirebaseMessaging.instance.requestPermission(provisional: true);
    });
  }

  Future<void> sendLoginRequest() async {
    if (formKey.currentState?.validate() == false) return;
    final fcmToken = await FirebaseMessaging.instance.getToken() ?? '';

    try {
      await AuthService.login(
        identifier: emailController.text,
        password: passwordController.text,
        fcmToken: fcmToken,
      );

      UserResponse userResponse = await AuthService.getMe();
      final appState = ref.read(globalStateProvider.notifier);
      appState.setUser(userResponse.data);
      if (!mounted) return;
      context.goNamed(Routes.feed);
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
                        context.pushNamed(Routes.signup);
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
                  child: SvgPicture.asset(AssetsConstants.logo, height: 200)),
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
                        context.pushNamed(Routes.forgotPassword);
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
