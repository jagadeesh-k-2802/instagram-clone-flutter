import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:instagram_clone/router/routes.dart';
import 'package:instagram_clone/services/auth.dart';
import 'package:instagram_clone/theme/theme.dart';
import 'package:instagram_clone/utils/functions.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  int currentWidget = 0;
  bool hidePassword = true;
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController confirmationController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  Future<void> sendForgotPasswordRequest() async {
    try {
      await AuthService.forgotPassword(email: emailController.text);
      setState(() => currentWidget++);
    } catch (error) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(error.toString())),
      );
    }
  }

  Future<void> verifyConfirmationCode() async {
    try {
      await AuthService.verifyForgotPasswordCode(
        email: emailController.text,
        code: confirmationController.text,
      );

      setState(() => currentWidget++);
    } catch (error) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(error.toString())),
      );
    }
  }

  Future<void> sendPasswordResetRequest() async {
    try {
      await AuthService.resetPassword(
        code: confirmationController.text,
        password: passwordController.text,
      );

      if (!mounted) return;
      context.goNamed(Routes.login);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Password changed, login with your new password'),
        ),
      );
    } catch (error) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(error.toString())),
      );
    }
  }

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
          'Enter your email address linked to your account.',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: 20),
        Form(
          key: formKey,
          child: TextFormField(
            key: const Key('email'),
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              hintText: 'Enter your email address',
            ),
            validator: (String? value) {
              if (value?.isEmpty == true) {
                return 'Please, Enter email address';
              }

              if (!validEmailAddress(value)) {
                return 'Please, Enter valid email address';
              }

              return null;
            },
          ),
        ),
        const SizedBox(height: 15),
        ElevatedButton(
          onPressed: () async {
            if (formKey.currentState?.validate() == true) {
              FocusManager.instance.primaryFocus?.unfocus();
              await sendForgotPasswordRequest();
            }
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
          'Enter the 6-digit confirmation code we sent to ${emailController.text}',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: 20),
        Form(
          key: formKey,
          child: TextFormField(
            key: const Key('code'),
            keyboardType: TextInputType.number,
            controller: confirmationController,
            decoration: const InputDecoration(
              hintText: 'Confirmation Code',
            ),
            validator: (String? value) {
              if (value?.isEmpty == true) {
                return 'Please, Enter confirmation code';
              }

              return null;
            },
          ),
        ),
        const SizedBox(height: 15),
        ElevatedButton(
          onPressed: () async {
            if (formKey.currentState?.validate() == true) {
              await verifyConfirmationCode();
            }
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
        Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                key: const Key('password'),
                obscureText: hidePassword,
                keyboardType: TextInputType.visiblePassword,
                controller: passwordController,
                decoration: InputDecoration(
                  hintText: 'Password',
                  suffixIcon: IconButton(
                    icon: Icon(
                      hidePassword ? Icons.visibility : Icons.visibility_off,
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
              const SizedBox(height: 15),
              TextFormField(
                key: const Key('confirm-password'),
                obscureText: hidePassword,
                keyboardType: TextInputType.visiblePassword,
                controller: confirmPasswordController,
                decoration: const InputDecoration(
                  hintText: 'Confirm Password',
                ),
                validator: (String? value) {
                  if (value?.isEmpty == true) {
                    return 'Please, Enter Password';
                  }

                  if (value != passwordController.text) {
                    return 'Password and confirm password should be the same';
                  }

                  return null;
                },
              ),
            ],
          ),
        ),
        const SizedBox(height: 15),
        ElevatedButton(
          onPressed: () async {
            if (formKey.currentState?.validate() == true) {
              FocusManager.instance.primaryFocus?.unfocus();
              await sendPasswordResetRequest();
            }
          },
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

    return PopScope(
      onPopInvoked: (bool hasPopped) {
        if (!hasPopped) {
          setState(() => currentWidget--);
        }
      },
      canPop: currentWidget == 0,
      child: Scaffold(
        appBar: AppBar(title: const Text('Login Help')),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPagePadding),
          child: widgets[currentWidget],
        ),
      ),
    );
  }
}
