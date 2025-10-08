import 'package:flutter/cupertino.dart';

class FabWidget extends StatelessWidget {
  const FabWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: () {},
      child: Container(
        width: 56,
        height: 56,
        decoration: const BoxDecoration(
          color: CupertinoColors.systemPink,
          shape: BoxShape.circle,
        ),
        alignment: Alignment.center,
        child: const Icon(
          CupertinoIcons.hand_thumbsup_fill,
          color: CupertinoColors.white,
          size: 26,
        ),
      ),
    );
  }
}
