import 'package:flutter/material.dart';

import '../../constants/color_constants.dart';
import '../../constants/font_family.dart';
import '../../constants/font_size.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String hinttext;
  final String? title;
  final bool titleon;
  final Widget? icon;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.validator,
    this.title,
    required this.hinttext,
    required this.titleon,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        titleon
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Text(
                  title!,
                  style: const TextStyle(
                    fontSize: AppFontSize.bodymedium,
                    fontWeight: AppFonts.regular,
                    color: AppColors.white,
                  ),
                ),
              )
            : const SizedBox.shrink(),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          controller: controller,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.done,
          cursorColor: AppColors.white,
          validator: validator,
          style: const TextStyle(
            color: AppColors.white,
            fontSize: AppFontSize.bodylarge,
          ),
          decoration: InputDecoration(
            constraints: const BoxConstraints(
              maxWidth: 506,
            ),
            filled: true,
            contentPadding: const EdgeInsets.symmetric(vertical: 25),
            fillColor: AppColors.white.withOpacity(0.1),
            hintText: hinttext,
            prefixIcon: icon,
            hintStyle: const TextStyle(
              color: AppColors.warmgray,
              fontWeight: AppFonts.regular,
              fontSize: AppFontSize.bodymedium,
            ),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: AppColors.white, width: 1),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: AppColors.white, width: 1),
            ),
          ),
        ),
      ],
    );
  }
}

class CustomPasswordField extends StatefulWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String hinttext;
  final Widget? icon;
  final String title;
  final bool titleon;

  const CustomPasswordField({
    super.key,
    required this.controller,
    required this.validator,
    required this.hinttext,
    this.icon,
    required this.title,
    required this.titleon,
  });

  @override
  CustomPasswordFieldState createState() => CustomPasswordFieldState();
}

class CustomPasswordFieldState extends State<CustomPasswordField> {
  bool _obscureText = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.titleon
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Text(
                  widget.title,
                  style: const TextStyle(
                    fontSize: AppFontSize.bodymedium,
                    fontWeight: AppFonts.regular,
                    color: AppColors.white,
                  ),
                ),
              )
            : const SizedBox.shrink(),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          controller: widget.controller,
          obscureText: _obscureText,
          validator: widget.validator,
          textInputAction: TextInputAction.done,
          keyboardType: TextInputType.text,
          cursorColor: AppColors.white,
          style: const TextStyle(
            color: AppColors.white,
            fontSize: AppFontSize.bodylarge,
          ),
          decoration: InputDecoration(
            filled: true,
            constraints: const BoxConstraints(
              maxWidth: 506,
            ),
            contentPadding: const EdgeInsets.symmetric(vertical: 25),
            fillColor: AppColors.white.withOpacity(0.1),
            hintText: widget.hinttext,
            prefixIcon: widget.icon,
            hintStyle: const TextStyle(
              color: AppColors.warmgray,
              fontWeight: AppFonts.regular,
              fontSize: AppFontSize.bodymedium,
            ),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: AppColors.white, width: 1),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: AppColors.white, width: 1),
            ),
            suffixIcon: IconButton(
              focusNode: NeverFocusNode(),
              icon: Icon(
                _obscureText ? Icons.visibility_off : Icons.visibility,
                color: AppColors.gray,
              ),
              onPressed: _togglePasswordVisibility,
            ),
          ),
        ),
      ],
    );
  }
}

class NeverFocusNode extends FocusNode {
  @override
  bool get canRequestFocus => false;
}

class SearchField extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String hinttext;
  final Widget? icon;

  const SearchField({
    super.key,
    required this.controller,
    required this.validator,
    required this.hinttext,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.done,
      cursorColor: AppColors.black,
      validator: validator,
      style: const TextStyle(
        color: AppColors.black,
        fontSize: AppFontSize.bodymedium,
        fontWeight: AppFonts.regular,
      ),
      decoration: InputDecoration(
        constraints: const BoxConstraints(
          maxWidth: 506,
        ),
        filled: true,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        suffixIcon: const Icon(
          Icons.search_outlined,
          color: AppColors.purple,
        ),
        fillColor: AppColors.white,
        hoverColor: AppColors.white,
        hintText: hinttext,
        hintStyle: const TextStyle(
          color: AppColors.warmgray,
          fontWeight: AppFonts.regular,
          fontSize: AppFontSize.bodymedium,
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: AppColors.white, width: 1),
        ),
        focusColor: AppColors.white,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: AppColors.white, width: 1),
        ),
      ),
    );
  }
}

class EditProfileField extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String hinttext;
  final String? title;
  final bool titleon;
  final String icon1;

  const EditProfileField({
    super.key,
    required this.controller,
    required this.validator,
    this.title,
    required this.hinttext,
    required this.titleon,
    required this.icon1,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        titleon
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Text(
                  title!,
                  style: const TextStyle(
                    fontSize: AppFontSize.bodymedium,
                    fontWeight: AppFonts.regular,
                    color: AppColors.black,
                  ),
                ),
              )
            : const SizedBox.shrink(),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          controller: controller,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.done,
          cursorColor: AppColors.black,
          validator: validator,
          style: const TextStyle(
            color: AppColors.black,
            fontSize: AppFontSize.bodylarge,
          ),
          decoration: InputDecoration(
            constraints: const BoxConstraints(
              maxWidth: 347,
            ),
            filled: true,
            contentPadding: const EdgeInsets.symmetric(vertical: 20),
            fillColor: AppColors.lightgray,
            hoverColor: AppColors.lightgray,
            hintText: hinttext,
            prefixIcon: Image.asset(icon1),
            suffixIcon: Image.asset("icons/png/editicon.png"),
            hintStyle: const TextStyle(
              color: AppColors.warmgray,
              fontWeight: AppFonts.regular,
              fontSize: AppFontSize.bodymedium,
            ),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: AppColors.white, width: 1),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: AppColors.white, width: 1),
            ),
          ),
        ),
      ],
    );
  }
}

class PrintTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String hinttext;
  final String? title;
  final TextInputType? textinputtype;
  final bool titleon;
  final double width;
  final bool readonly;
  final bool isDollar;

  const PrintTextField({
    super.key,
    required this.controller,
    required this.validator,
    this.title,
    required this.hinttext,
    required this.titleon,
    required this.readonly, required this.isDollar, this.textinputtype, required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        titleon
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Text(
                  title!,
                  style: const TextStyle(
                    fontSize: AppFontSize.bodymedium,
                    fontWeight: AppFonts.regular,
                    color: AppColors.black,
                  ),
                ),
              )
            : const SizedBox.shrink(),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          controller: controller,
          keyboardType: textinputtype,
          textInputAction: TextInputAction.done,
          readOnly: readonly,
          cursorColor: AppColors.black,
          validator: validator,
          style: const TextStyle(
            color: AppColors.black,
            fontWeight: AppFonts.regular,
            fontSize: AppFontSize.bodylarge,
          ),
          decoration: InputDecoration(
            constraints: BoxConstraints(
              maxWidth: width,
            ),
            filled: true,
            contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            fillColor: AppColors.lightgray,
            hoverColor: AppColors.lightgray,
            hintText: hinttext,
            prefixIcon: isDollar ? Padding(
              padding: const EdgeInsets.only(left: 15, top: 15, bottom: 15), // Center-align the dollar sign vertically
              child: Text(
                "\$",
                style: TextStyle(
                  color: AppColors.black,
                  fontWeight: AppFonts.regular,
                  fontSize: AppFontSize.bodylarge,
                ),
              ),
            ) : null,
            hintStyle: const TextStyle(
              color: AppColors.warmgray,
              fontWeight: AppFonts.regular,
              fontSize: AppFontSize.bodymedium,
            ),

            border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: AppColors.white, width: 1),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: AppColors.white, width: 1),
            ),
          ),
        ),
      ],
    );
  }
}
