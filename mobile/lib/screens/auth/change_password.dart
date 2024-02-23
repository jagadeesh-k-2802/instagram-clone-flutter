import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:instagram_clone/services/auth.dart';
import 'package:instagram_clone/theme/theme.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final formKey = GlobalKey<FormState>();
  bool hidePassword = true;
  TextEditingController currentPasswordController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  Future<void> onChangePassword() async {
    try {
      await AuthService.updatePassword(
        currentPassword: currentPasswordController.text,
        newPassword: passwordController.text,
      );

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Your password has been changed')),
      );

      context.pop();
    } catch (error) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(error.toString())),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Change Password')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPagePadding),
          child: Column(
            children: [
              const SizedBox(height: 8.0),
              Text(
                'You\'ll be logged out of all sessions except this one to protect your account if anyone is trying to gain access.',
                style: textTheme.bodyLarge,
              ),
              const SizedBox(height: 12.0),
              Text(
                'Your password must be at least six characters and should include a combination of numbers, letters and special characters',
                style: textTheme.bodyLarge,
              ),
              const SizedBox(height: 16.0),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                      obscureText: hidePassword,
                      keyboardType: TextInputType.visiblePassword,
                      controller: currentPasswordController,
                      decoration: InputDecoration(
                        hintText: 'Current Password',
                        border: const OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 1,
                            color: lightGrayColor,
                          ),
                        ),
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
                    const SizedBox(height: 16.0),
                    TextFormField(
                      obscureText: hidePassword,
                      keyboardType: TextInputType.visiblePassword,
                      controller: passwordController,
                      decoration: const InputDecoration(
                        hintText: 'New Password',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 1,
                            color: lightGrayColor,
                          ),
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
                    const SizedBox(height: 16.0),
                    TextFormField(
                      obscureText: hidePassword,
                      keyboardType: TextInputType.visiblePassword,
                      controller: confirmPasswordController,
                      decoration: const InputDecoration(
                        hintText: 'Retype New Password',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 1,
                            color: lightGrayColor,
                          ),
                        ),
                      ),
                      validator: (String? value) {
                        if (value?.isEmpty == true) {
                          return 'Please, Enter Password';
                        }

                        if (value != passwordController.text) {
                          return 'New password does not match';
                        }

                        return null;
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: onChangePassword,
                child: const Text('Change Password'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
