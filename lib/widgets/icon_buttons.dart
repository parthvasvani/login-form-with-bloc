import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:login_form/pallete.dart';

class IconButtons extends StatelessWidget {
  final String iconPath;
  final VoidCallback onPressed;
  const IconButtons(
      {super.key, required this.iconPath, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 85,
      height: 85,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade500,
                offset: const Offset(6, 6),
                blurRadius: 15,
                spreadRadius: 1),
            const BoxShadow(
                color: Colors.white,
                offset: Offset(-6, -6),
                blurRadius: 15,
                spreadRadius: 1),
          ]),
      child: IconButton(
        onPressed: onPressed,
        icon: ShaderMask(
          shaderCallback: (bounds) {
            return const LinearGradient(colors: [
              Pallete.gradient1,
              Pallete.gradient2,
              Pallete.gradient3,
            ], begin: Alignment.topLeft, end: Alignment.bottomRight)
                .createShader(bounds);
          },
          child: SvgPicture.asset(
            iconPath,
            colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
            width: 32,
          ),
        ),
      ),
    );
  }
}
