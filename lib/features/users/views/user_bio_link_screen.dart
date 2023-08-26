import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/authentication/widgets/form_button.dart';
import 'package:tiktok_clone/features/users/view_models/users_view_model.dart';

class UserBioLinkScreen extends ConsumerStatefulWidget {
  const UserBioLinkScreen({super.key});

  @override
  ConsumerState<UserBioLinkScreen> createState() => _UserBioLinkScreenState();
}

class _UserBioLinkScreenState extends ConsumerState<UserBioLinkScreen> {
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _linkController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _bioController.text = ref.read(userProvider).value!.bio;
    _linkController.text = ref.read(userProvider).value!.link;
  }

  void updateBioLink() async {
    await ref.read(userProvider.notifier).updateProfile(
      {"bio": _bioController.text, "link": _linkController.text},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('bio & link'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.4),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: TextField(
                maxLines: 3,
                controller: _bioController,
                decoration: const InputDecoration(
                  hintText: 'Bio',
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(height: Sizes.size20),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.4),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: TextField(
                maxLines: 3,
                controller: _linkController,
                decoration: const InputDecoration(
                  hintText: 'Link',
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(height: Sizes.size20),
            GestureDetector(
              onTap: () {
                updateBioLink();
                final snackBar = SnackBar(
                  content: Row(
                    children: const [
                      Icon(Icons.info, color: Colors.white),
                      SizedBox(width: 10),
                      Text("수정 되었습니다."),
                    ],
                  ),
                  backgroundColor:
                      Colors.blue, // Customize the background color
                  behavior: SnackBarBehavior.floating,
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              child: FormButton(
                disabled:
                    _bioController.text == '' && _linkController.text == '',
                text: 'Edit',
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _bioController.dispose();
    _linkController.dispose();
    super.dispose();
  }
}
