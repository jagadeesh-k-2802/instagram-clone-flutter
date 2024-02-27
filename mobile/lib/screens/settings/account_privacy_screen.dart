import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_clone/models/auth.dart';
import 'package:instagram_clone/services/auth.dart';
import 'package:instagram_clone/state/global_state_provider.dart';
import 'package:instagram_clone/theme/theme.dart';

class AccountPrivacyScreen extends ConsumerStatefulWidget {
  const AccountPrivacyScreen({super.key});

  @override
  ConsumerState<AccountPrivacyScreen> createState() =>
      _AccountPrivacyScreenState();
}

class _AccountPrivacyScreenState extends ConsumerState<AccountPrivacyScreen> {
  bool isPrivate = false;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      UserResponseData? user = ref.read(globalStateProvider).user;
      setState(() => isPrivate = user?.isPrivateAccount ?? false);
    });
  }

  Future<void> onPrivateToggle(bool value) async {
    setState(() => isPrivate = value);
    try {
      UserResponseData? user = ref.read(globalStateProvider).user;

      await AuthService.updateUserDetails(
        name: user?.name ?? '',
        username: user?.username ?? '',
        email: user?.email ?? '',
        phone: user?.phone ?? '',
        bio: user?.bio ?? '',
        gender: user?.gender ?? '',
        isPrivateAccount: value,
      );

      UserResponse userResponse = await AuthService.getMe();
      final appState = ref.read(globalStateProvider.notifier);
      appState.setUser(userResponse.data);
    } catch (error) {
      if (!mounted) return;
      setState(() => isPrivate = !value);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(error.toString())),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Account Privacy')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPagePadding),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Private Account', style: bodyLargeBold(context)),
                  Switch.adaptive(value: isPrivate, onChanged: onPrivateToggle),
                ],
              ),
              const SizedBox(height: 16.0),
              Text(
                'When your account is public. your profile and posts can be seen by anyone.',
                style: textTheme.bodyLarge,
              ),
              const SizedBox(height: 12.0),
              Text(
                'When your account is private, only the followers you approve can see you share, including your photos or videos and your followers and following lists.',
                style: textTheme.bodyLarge,
              ),
              const SizedBox(height: 16.0),
            ],
          ),
        ),
      ),
    );
  }
}
