import 'dart:async';
import 'dart:typed_data';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:instagram_clone/config/assets.dart';
import 'package:instagram_clone/models/auth.dart';
import 'package:instagram_clone/router/routes.dart';
import 'package:instagram_clone/state/global_state_provider.dart';
import 'package:moment_dart/moment_dart.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram_clone/services/auth.dart';
import 'package:instagram_clone/theme/theme.dart';
import 'package:instagram_clone/utils/functions.dart';

class SignupScreen extends ConsumerStatefulWidget {
  const SignupScreen({super.key});

  @override
  ConsumerState<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends ConsumerState<SignupScreen> {
  final formKey = GlobalKey<FormState>();
  Timer? debounceTimer;
  bool hidePassword = true;
  int currentWidget = 0;
  bool sentConfirmationAlready = false;
  String? selectedGender;
  Uint8List? imageBytes;
  CroppedFile? croppedFile;
  bool? validUsername;
  TextEditingController nameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController birthdayController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmationController = TextEditingController();

  @override
  void dispose() {
    debounceTimer?.cancel();
    super.dispose();
  }

  Future<bool> verifyConfirmationCode() async {
    try {
      await AuthService.verifyConfirmationCode(
        email: emailController.text,
        code: confirmationController.text,
      );

      return true;
    } catch (error) {
      if (!mounted) return false;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(error.toString())),
      );

      return false;
    }
  }

  Future<void> sendConfirmationCode({required bool forcefully}) async {
    if (!forcefully && sentConfirmationAlready) return;

    try {
      await AuthService.sendConfirmationCode(email: emailController.text);
      sentConfirmationAlready = true;
    } catch (error) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(error.toString())),
      );
    }
  }

  Future<void> sendSignupRequest() async {
    if (formKey.currentState?.validate() == false) return;
    final fcmToken = await FirebaseMessaging.instance.getToken() ?? '';

    try {
      await AuthService.register(
        name: nameController.text,
        username: usernameController.text,
        birthday: birthdayController.text,
        avatarPath: croppedFile?.path,
        email: emailController.text,
        gender: selectedGender ?? '',
        password: passwordController.text,
        confirmationCode: confirmationController.text,
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

  void onUsernameChanged(String value) {
    if (value.isEmpty) {
      setState(() => validUsername = null);
      return;
    }

    if (debounceTimer?.isActive ?? false) debounceTimer?.cancel();

    debounceTimer = Timer(const Duration(milliseconds: 500), () async {
      try {
        await AuthService.verifyValidUsername(
          username: usernameController.text,
        );

        setState(() => validUsername = true);
      } catch (error) {
        setState(() => validUsername = false);
      }
    });
  }

  Future<void> selectProfilePicture() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image == null) return;

    CroppedFile? file = await ImageCropper().cropImage(
      sourcePath: image.path,
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Crop Photo',
          toolbarColor: Colors.white,
          toolbarWidgetColor: Colors.black,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false,
        ),
        IOSUiSettings(
          title: 'Crop Photo',
        ),
      ],
    );

    if (file == null) return;
    imageBytes = await file.readAsBytes();
    croppedFile = file;
    setState(() {});
  }

  Widget buildNameWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'What\'s Your Name ?',
          style: headlineLargeBold(context),
        ),
        const SizedBox(height: 15),
        Form(
          key: formKey,
          child: TextFormField(
            key: const Key('full-name'),
            controller: nameController,
            keyboardType: TextInputType.name,
            decoration: const InputDecoration(
              hintText: 'Full name',
            ),
            validator: (String? value) {
              if (value?.isEmpty == true) {
                return 'Please, Enter your name';
              }

              return null;
            },
          ),
        ),
        const SizedBox(height: 15),
        ElevatedButton(
          onPressed: () {
            if (formKey.currentState?.validate() == true) {
              setState(() => currentWidget++);
            }
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
        Form(
          key: formKey,
          child: TextFormField(
            key: const Key('password'),
            obscureText: hidePassword,
            keyboardType: TextInputType.visiblePassword,
            controller: passwordController,
            decoration: InputDecoration(
              hintText: 'Password',
              border: const OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1,
                  color: lightGrayColor,
                ),
              ),
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
        ),
        const SizedBox(height: 15),
        ElevatedButton(
          onPressed: () {
            if (formKey.currentState?.validate() == true) {
              setState(() => currentWidget++);
            }
          },
          child: const Text('Next'),
        )
      ],
    );
  }

  Widget buildGenderWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Select Your Gender',
          style: headlineLargeBold(context),
        ),
        const SizedBox(height: 15),
        Form(
          key: formKey,
          child: DropdownButtonFormField<String>(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Gender',
            ),
            icon: const Icon(Icons.arrow_drop_down_sharp),
            elevation: 16,
            onChanged: (String? value) {
              setState(() => selectedGender = value);
            },
            validator: (String? value) {
              if (selectedGender == null) {
                return 'Please, Select your Gender';
              }

              return null;
            },
            items: ['Male', 'Female'].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
        const SizedBox(height: 15),
        ElevatedButton(
          onPressed: () {
            if (formKey.currentState?.validate() == true) {
              setState(() => currentWidget++);
            }
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
        Form(
          key: formKey,
          child: TextFormField(
            onTap: () async {
              DateTime? birthday = await showDatePicker(
                context: context,
                firstDate: DateTime(1900),
                lastDate: DateTime.now(),
              );

              if (birthday != null) {
                birthdayController.text = birthday.toMoment().LL;
              }
            },
            key: const Key('birthday'),
            readOnly: true,
            controller: birthdayController,
            keyboardType: TextInputType.datetime,
            decoration: const InputDecoration(
              hintText: 'Birthday',
            ),
            validator: (String? value) {
              if (value?.isEmpty == true) {
                return 'Please, Enter your birthday';
              }

              return null;
            },
          ),
        ),
        const SizedBox(height: 15),
        ElevatedButton(
          onPressed: () {
            if (formKey.currentState?.validate() == true) {
              setState(() => currentWidget++);
            }
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
        Form(
          key: formKey,
          child: TextFormField(
            key: const Key('username'),
            controller: usernameController,
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
              hintText: 'Username',
              suffixIcon: validUsername != null
                  ? validUsername == true
                      ? const Icon(Icons.done, color: Colors.greenAccent)
                      : const Icon(Icons.close, color: Colors.redAccent)
                  : null,
            ),
            onChanged: onUsernameChanged,
            validator: (String? value) {
              if (value?.isEmpty == true) {
                return 'Please, Enter a username';
              }

              if (validUsername == false) {
                return 'Sorry, The username is already taken';
              }

              return null;
            },
          ),
        ),
        const SizedBox(height: 15),
        ElevatedButton(
          onPressed: () {
            if (formKey.currentState?.validate() == true) {
              setState(() => currentWidget++);
            }
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
          'What\'s Your Email Address ?',
          style: headlineLargeBold(context),
        ),
        const SizedBox(height: 8),
        Text(
          'Enter the email where you can be contacted. No one will see this on your profile.',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: 15),
        Form(
          key: formKey,
          child: TextFormField(
            key: const Key('email'),
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              hintText: 'Email',
            ),
            validator: (String? value) {
              if (value?.isEmpty == true) {
                return 'Please, Enter your email address';
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
          onPressed: () {
            if (formKey.currentState?.validate() == true) {
              setState(() => currentWidget++);
              sendConfirmationCode(forcefully: false);
            }
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
          'To confirm your account, enter the 6-digit code we sent to ${emailController.text}',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: 15),
        Form(
          key: formKey,
          child: TextFormField(
            key: const Key('confirmation-code'),
            controller: confirmationController,
            keyboardType: TextInputType.number,
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
              bool verified = await verifyConfirmationCode();

              if (verified) {
                setState(() => currentWidget++);
              }
            }
          },
          child: const Text('Next'),
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () async {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Confirmation code has been sent again'),
              ),
            );

            await sendConfirmationCode(forcefully: true);
          },
          style: transparentButtonStyle,
          child: const Text('I didn\'t get the code'),
        )
      ],
    );
  }

  Widget buildProfilePictureWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            const SizedBox(height: 35),
            Align(
              alignment: Alignment.center,
              child: CircleAvatar(
                radius: 100,
                child: ClipOval(
                  child: imageBytes == null
                      ? Image.asset(AssetsConstants.defaultProfile)
                      : Image.memory(imageBytes!),
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Column(
            children: [
              ElevatedButton(
                onPressed: imageBytes == null
                    ? selectProfilePicture
                    : sendSignupRequest,
                child: Text(imageBytes == null ? 'Add Picture' : 'Continue'),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: imageBytes == null
                    ? sendSignupRequest
                    : selectProfilePicture,
                style: transparentButtonStyle,
                child: Text(imageBytes == null ? 'Skip' : 'Change Picture'),
              ),
            ],
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
      buildGenderWidget(),
      buildBirthdayWidget(),
      buildUsernameWidget(),
      buildMobileEmailWidget(),
      buildConfirmationWidget(),
      buildProfilePictureWidget(),
    ];

    return PopScope(
      onPopInvoked: (bool hasPopped) {
        if (!hasPopped && currentWidget == widgets.length - 1) return;

        if (!hasPopped) {
          setState(() => currentWidget--);
        }
      },
      canPop: currentWidget == 0,
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPagePadding),
          child: widgets[currentWidget],
        ),
      ),
    );
  }
}
