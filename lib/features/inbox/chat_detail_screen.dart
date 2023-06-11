import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class ChatDetailScreen extends StatefulWidget {
  const ChatDetailScreen({super.key});

  @override
  State<ChatDetailScreen> createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  void _onStopWriting() {
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ListTile(
          contentPadding: EdgeInsets.zero,
          horizontalTitleGap: Sizes.size8,
          leading: Stack(
            children: [
              const CircleAvatar(
                radius: Sizes.size24,
                foregroundImage: NetworkImage(
                  "https://avatars.githubusercontent.com/u/14923625?v=4",
                ),
                child: Text('승현'),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: SizedBox(
                  width: Sizes.size16,
                  height: Sizes.size16,
                  child: Container(
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        Sizes.size24,
                      ),
                      color: Colors.green.shade400,
                      border: Border.all(
                        color: Colors.white,
                        width: Sizes.size2,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          title: const Text(
            '승현',
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
          subtitle: const Text('Active now'),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              FaIcon(
                FontAwesomeIcons.flag,
                color: Colors.black,
                size: Sizes.size20,
              ),
              Gaps.h32,
              FaIcon(
                FontAwesomeIcons.ellipsis,
                color: Colors.black,
                size: Sizes.size20,
              ),
            ],
          ),
        ),
      ),
      body: GestureDetector(
        onTap: _onStopWriting,
        child: Stack(
          children: [
            ListView.separated(
              padding: const EdgeInsets.symmetric(
                vertical: Sizes.size20,
                horizontal: Sizes.size14,
              ),
              itemBuilder: (context, index) {
                final isMine = index % 2 == 0;
                return Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment:
                      isMine ? MainAxisAlignment.end : MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(Sizes.size14),
                      decoration: BoxDecoration(
                        color: isMine
                            ? Colors.blue
                            : Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.only(
                          topLeft: const Radius.circular(
                            Sizes.size20,
                          ),
                          topRight: const Radius.circular(
                            Sizes.size20,
                          ),
                          bottomLeft: Radius.circular(
                            isMine ? Sizes.size20 : Sizes.size5,
                          ),
                          bottomRight: Radius.circular(
                            !isMine ? Sizes.size20 : Sizes.size5,
                          ),
                        ),
                      ),
                      child: const Text(
                        "this is a message!",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: Sizes.size16,
                        ),
                      ),
                    ),
                  ],
                );
              },
              separatorBuilder: (context, index) => Gaps.v10,
              itemCount: 10,
            ),
            Positioned(
              bottom: 0,
              width: MediaQuery.of(context).size.width,
              child: BottomAppBar(
                padding: const EdgeInsets.all(Sizes.size10),
                color: Colors.grey.shade100,
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        textInputAction: TextInputAction.search,
                        cursorColor: Theme.of(context).primaryColor,
                        decoration: InputDecoration(
                          hintText: "Send a message...",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              Sizes.size24,
                            ),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: Sizes.size12,
                          ),
                          suffixIcon: Padding(
                            padding: const EdgeInsets.all(Sizes.size12),
                            child: FaIcon(
                              FontAwesomeIcons.faceSmile,
                              color: Colors.grey.shade900,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Gaps.h10,
                    Container(
                      alignment: Alignment.center,
                      width: Sizes.size40,
                      height: Sizes.size40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.grey.shade400,
                      ),
                      child: const FaIcon(
                        size: Sizes.size18,
                        color: Colors.white,
                        FontAwesomeIcons.paperPlane,
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
