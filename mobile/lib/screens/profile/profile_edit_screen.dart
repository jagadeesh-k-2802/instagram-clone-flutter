import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram_clone/config/constants.dart';
import 'package:instagram_clone/models/auth.dart';
import 'package:instagram_clone/services/auth.dart';
import 'package:instagram_clone/state/global_state_provider.dart';
import 'package:instagram_clone/theme/theme.dart';
import 'package:instagram_clone/widgets/core/clickable_list_item.dart';

class ProfileEditScreen extends ConsumerStatefulWidget {
  const ProfileEditScreen({super.key});

  @override
  ConsumerState<ProfileEditScreen> createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends ConsumerState<ProfileEditScreen> {
  final formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController bioController = TextEditingController();
  String? selectedGender;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      UserResponseData? user = ref.read(globalStateProvider).user;
      nameController.text = user?.name ?? '';
      usernameController.text = user?.username ?? '';
      emailController.text = user?.email ?? '';
      phoneController.text = user?.phone ?? '';
      bioController.text = user?.bio ?? '';
      selectedGender = user?.gender;
      setState(() {});
    });
  }

  Future<void> onNewProfilePicture() async {
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

    try {
      await AuthService.updateAvatar(localFilePath: file.path);
      UserResponse userResponse = await AuthService.getMe();
      final appState = ref.read(globalStateProvider.notifier);
      appState.setUser(userResponse.data);
    } catch (error) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(error.toString())),
      );
    }
  }

  Future<void> onProfilePictureRemove() async {
    try {
      await AuthService.updateAvatar(removeAvatar: true);
      UserResponse userResponse = await AuthService.getMe();
      final appState = ref.read(globalStateProvider.notifier);
      appState.setUser(userResponse.data);
    } catch (error) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(error.toString())),
      );
    }
  }

  void showProfilePhotoChangeModal({UserResponseData? user}) {
    showModalBottomSheet(
      showDragHandle: true,
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 120,
          width: double.maxFinite,
          child: Column(
            children: [
              ClickableListItem(
                prefixIcon: Icons.photo,
                text: 'New Profile Picture',
                onTap: () {
                  Navigator.pop(context);
                  onNewProfilePicture();
                },
              ),
              Visibility(
                visible: user?.avatar != 'default-profile.png',
                child: ClickableListItem(
                  text: 'Remove Current Picture',
                  textColor: Colors.red,
                  prefixIcon: Icons.delete,
                  onTap: () {
                    Navigator.pop(context);
                    onProfilePictureRemove();
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> onUpdateProfileInformation() async {
    if (formKey.currentState?.validate() == false) return;

    try {
      UserResponseData? user = ref.read(globalStateProvider).user;

      await AuthService.updateUserDetails(
        name: nameController.text,
        username: usernameController.text,
        email: emailController.text,
        phone: phoneController.text,
        bio: bioController.text,
        gender: selectedGender ?? '',
        isPrivateAccount: user?.isPrivateAccount ?? false,
      );

      UserResponse userResponse = await AuthService.getMe();
      final appState = ref.read(globalStateProvider.notifier);
      appState.setUser(userResponse.data);
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Profile details have been updated')),
      );
    } catch (error) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(error.toString())),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    UserResponseData? user = ref.watch(globalStateProvider).user;

    return Scaffold(
      appBar: AppBar(title: const Text('Edit Profile')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: defaultPagePadding),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.center,
                child: ClipOval(
                  child: CircleAvatar(
                    radius: 60,
                    child: CachedNetworkImage(
                      imageUrl: '$apiUrl/avatar/${user?.avatar}',
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              TextButton(
                onPressed: () => showProfilePhotoChangeModal(user: user),
                child: const Text('Change Profile Photo'),
              ),
              const SizedBox(height: 10),
              Form(
                key: formKey,
                child: Column(children: [
                  TextFormField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      filled: false,
                      labelText: 'Name',
                      contentPadding: EdgeInsets.symmetric(vertical: 12.0),
                    ),
                    validator: (String? value) {
                      if (value?.isEmpty == true) {
                        return 'Please, Enter your name';
                      }

                      return null;
                    },
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: usernameController,
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      filled: false,
                      labelText: 'Username',
                      contentPadding: EdgeInsets.symmetric(vertical: 12.0),
                    ),
                    validator: (String? value) {
                      if (value?.isEmpty == true) {
                        return 'Please, Enter your username';
                      }

                      return null;
                    },
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      filled: false,
                      labelText: 'Email',
                      contentPadding: EdgeInsets.symmetric(vertical: 12.0),
                    ),
                    validator: (String? value) {
                      if (value?.isEmpty == true) {
                        return 'Please, Enter your email';
                      }

                      return null;
                    },
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: phoneController,
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      filled: false,
                      labelText: 'Phone',
                      hintText: 'Add Phone Number',
                      contentPadding: EdgeInsets.symmetric(vertical: 12.0),
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: bioController,
                    maxLength: 150,
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      filled: false,
                      labelText: 'Bio',
                      hintText: 'Add a Bio',
                      contentPadding: EdgeInsets.symmetric(vertical: 12.0),
                    ),
                  ),
                  const SizedBox(height: 8),
                  DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      filled: false,
                      hintText: 'Gender',
                      contentPadding: EdgeInsets.symmetric(vertical: 12.0),
                    ),
                    value: selectedGender,
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
                ]),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: onUpdateProfileInformation,
                child: const Text('Update Profile'),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
