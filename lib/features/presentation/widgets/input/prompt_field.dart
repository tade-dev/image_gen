import 'dart:io';

import 'package:app/core/resources/colors_x.dart';
import 'package:app/core/resources/styles_x.dart';
import 'package:flutter/material.dart';


class PromptField extends StatelessWidget {
  const PromptField({
    super.key,
    this.controller,
    this.hintText,
    this.obscureText = false,
    this.label,
    this.inputType,
    this.enabled = true,
    this.expand = false,
    this.onTap,
    this.onSaved,
    this.textInputAction,
    this.onEditingComplete,
    required this.onChanged,
    this.onFieldSubmitted,
    this.prefixIcon,
    this.suffixIcon,
    this.maxLength,
    this.maxLines = 1,
    this.minLines,
    this.readOnly = false,
    this.autofocus = false,
    this.validator,
    this.onpressImage,
    this.selectedImages
  });

  final TextEditingController? controller;
  final String? hintText;
  final String? label;
  final TextInputType? inputType;
  final bool enabled;
  final Function()? onTap;
  final ValueChanged<String>? onFieldSubmitted;
  final bool expand;
  final bool obscureText;
  final Function(String?)? onSaved;
  final ValueChanged<String> onChanged;
  final TextInputAction? textInputAction;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final VoidCallback? onEditingComplete;
  final int? minLines;
  final int? maxLines;
  final int? maxLength;
  final bool readOnly;
  final bool autofocus;
  final FormFieldValidator<String>? validator;
  final List<File>? selectedImages;
  final Function()? onpressImage;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      padding: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: ColorManager.cardColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
            child: Row(
              children: List.generate(
                (selectedImages ?? []).length, 
                (index) => Stack(
                  children: [
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: FileImage(selectedImages![index]),
                          fit: BoxFit.cover
                        )
                      ),
                    ),
                    Positioned(
                      right: 0,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 5, top: 5),
                        child: GestureDetector(
                          onTap: onpressImage,
                          child: CircleAvatar(
                            radius: 10,
                            backgroundColor: ColorManager.cardColor.withOpacity(0.5),
                            child: const Icon(
                              Icons.close,
                              color: Colors.white,
                              size: 13,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ),
            ),
          ),
          TextFormField(
            enabled: enabled,
            obscureText: obscureText,
            onChanged: onChanged,
            onTap: onTap,
            minLines: minLines,
            maxLines: maxLines,
            maxLength: maxLength,
            controller: controller,
            onSaved: onSaved,
            readOnly: readOnly,
            validator: validator,
            autofocus: autofocus,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            onFieldSubmitted: onFieldSubmitted,
            onEditingComplete: onEditingComplete,
            textDirection: TextDirection.ltr,
            keyboardType: inputType,
            style: getRegularStyle(color: ColorManager.primaryTextColor, fontSize: 16),
            decoration: InputDecoration(
              hintText: hintText,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(20)
              ),
              fillColor: ColorManager.cardColor,
              filled: true,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(20)
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(20)
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              prefixIcon: prefixIcon,
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(20)
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(20)
              ),
              hintStyle: getMediumStyle(
                  color: ColorManager.secondaryTextColor, fontSize: 16),
            ),
          ),
          suffixIcon ??const SizedBox.shrink()
        ],
      ),
    );
  }
}
