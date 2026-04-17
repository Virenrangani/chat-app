import 'package:flutter/material.dart';
import '../../constant/border_radius/app_border_radius.dart';
import '../../constant/colour/app_color.dart';
import '../../constant/padding/app_padding.dart';
import '../../constant/text_style/app_text_style.dart';

class AppFormField extends StatelessWidget {
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffix;
  final Widget? prefix;
  final FocusNode? focusNode;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final Color? borderColor;
  final bool obscureText;
  final int maxLines;
  final VoidCallback? onSuffixTap;
  final ValueChanged<String>? onChanged;

  const AppFormField({
    super.key,
    this.hintText,
    this.prefixIcon,
    this.suffix,
    this.controller,
    this.validator,
    this.keyboardType,
    this.obscureText = false,
    this.maxLines = 1,
    this.onSuffixTap,
    this.onChanged,
    this.borderColor,
    this.prefix,
    this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      focusNode: focusNode,
      keyboardType: keyboardType,
      obscureText: obscureText,
      obscuringCharacter: "*",
      cursorColor: Colors.white,
      maxLines: obscureText ? 1 : maxLines,
      onChanged: onChanged,
      style: AppTextStyles.bodyMedium(color:Colors.white),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey.shade900,
        hintText: hintText,
        hintStyle: AppTextStyles.h4(color: Colors.white24),
        prefixIcon: prefixIcon != null
            ? Padding(
          padding: AppPadding.edgeAll4,
          child: prefixIcon,
        )
            : null,
        suffixIcon: suffix != null
            ? InkWell(
          onTap: onSuffixTap,
          child: Padding(padding: AppPadding.edgeAll4, child: suffix),
        )
            : null,
        enabledBorder: OutlineInputBorder(
          borderRadius: AppBorderRadius.cir28,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: AppBorderRadius.cir28,
        ),
      ),
    );
  }
}
