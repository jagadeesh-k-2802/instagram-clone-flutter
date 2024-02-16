import 'package:flutter/material.dart';
import 'package:instagram_clone/theme/theme.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool hidePassword = true;
  int currentWidget = 0;

  Widget buildNameWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'What\'s Your Name ?',
          style: headlineLargeBold(context),
        ),
        const SizedBox(height: 15),
        TextFormField(
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(
            hintText: 'Full name',
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
        )
      ],
    );
  }

  Widget buildPasswordWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Create a Password',
          style: headlineLargeBold(context),
        ),
        const SizedBox(height: 8),
        Text(
          'Create a password with at least 6 characters or numbers. It should be something others can\'t guess.',
          style: Theme.of(context).textTheme.bodyLarge,
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
          onPressed: () {
            setState(() => currentWidget++);
          },
          child: const Text('Next'),
        )
      ],
    );
  }

  Widget buildBirthdayWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'What\'s Your Birthday ?',
          style: headlineLargeBold(context),
        ),
        const SizedBox(height: 8),
        Text(
          'Use your own birthday even if this account is for business, a pet or something else. No one will see this unless you choose to share it',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: 15),
        TextFormField(
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(
            hintText: 'Birthday',
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
        )
      ],
    );
  }

  Widget buildUsernameWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Create a username ?',
          style: headlineLargeBold(context),
        ),
        const SizedBox(height: 15),
        TextFormField(
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(
            hintText: 'Username',
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
        )
      ],
    );
  }

  Widget buildMobileEmailWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'What\'s Your Mobile Number ?',
          style: headlineLargeBold(context),
        ),
        const SizedBox(height: 8),
        Text(
          'Enter the email where you can be contacted. No one will see this on your profile.',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: 15),
        TextFormField(
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(
            hintText: 'Email',
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

  Widget buildConfirmationWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Enter the confirmation code',
          style: headlineLargeBold(context),
        ),
        const SizedBox(height: 8),
        Text(
          'To confirm your account, enter the 6-digit code we sent to <account>',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: 15),
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
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {},
          style: transparentButtonStyle,
          child: const Text('I didn\'t get the code'),
        )
      ],
    );
  }

  Widget buildProfilePictureWidget() {
    return Column(
      children: [
        Text(
          'Add a profile picture',
          style: headlineLargeBold(context),
        ),
        const SizedBox(height: 8),
        Text(
          'Add a profile picture so your friends know it\'s you. Everyone will be able to see your picture.',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: 25),
        Center(
          child: Image.asset('assets/images/default_profile.png'),
        ),
        SizedBox(
          height: 400,
          child: Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                children: [
                  const SizedBox(height: 275),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Add Picture'),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {},
                    style: transparentButtonStyle,
                    child: const Text('Skip'),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> widgets = [
      buildNameWidget(),
      buildPasswordWidget(),
      buildBirthdayWidget(),
      buildUsernameWidget(),
      buildMobileEmailWidget(),
      buildConfirmationWidget(),
      buildProfilePictureWidget(),
    ];

    return PopScope(
      onPopInvoked: (bool hasPopped) {
        if (!hasPopped) {
          setState(() => currentWidget--);
        }
      },
      canPop: currentWidget == 0,
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPagePadding),
          child: Column(
            children: [
              widgets[currentWidget],
            ],
          ),
        ),
      ),
    );
  }
}
