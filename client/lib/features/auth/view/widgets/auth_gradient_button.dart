import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_pallete.dart';

class AuthGradientButton extends ConsumerWidget {
  final String buttonText;
  final VoidCallback onTap;
  const AuthGradientButton({
    Key? key,
    required this.buttonText,
    required this.onTap
  }): super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
            colors: [
              Palette.gradient1,
              Palette.gradient2
        ],
        begin: Alignment.bottomLeft,
        end: Alignment.topRight),
        borderRadius: BorderRadius.circular(7)
      ),
      child: ElevatedButton(
          onPressed: onTap,
           style: ElevatedButton.styleFrom(
               fixedSize: const Size(395, 55),
             backgroundColor: Palette.transparentColor,
             shadowColor: Palette.transparentColor
               
           ),

           child: Text(
             buttonText,
             style: const TextStyle(
             fontSize: 17,
             fontWeight: FontWeight.w600,
           ),)),
    );
  }
}
