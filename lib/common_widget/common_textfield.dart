import 'package:flutter/material.dart';

class CommonTextField extends StatelessWidget {
  final TextEditingController? textEditingController;
  final InputDecoration? decoration;
  final int? minLines;
  final int? maxLines;
  final String? hintText;
  final bool? enabled;
  final OutlineInputBorder? border;
  final OutlineInputBorder? disabledBorder;
  final TextStyle? hintStyle;
  final bool? filled;
  final Color? fillColor;
  const CommonTextField({
    Key? key,
    required this.textEditingController,
    this.minLines,
    this.maxLines,
    this.hintText,
    this.enabled,
    this.border,
    this.disabledBorder,
    this.hintStyle,
    this.filled,
    this.fillColor,
    this.decoration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      minLines: minLines,
      maxLines: minLines,
      enabled: enabled ?? true,
      decoration: decoration ??
          InputDecoration(
            hintText: hintText ?? " ",
            border: border ??
                OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
            disabledBorder: disabledBorder ??
                OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(color: Colors.black87),
                ),
            filled: filled ?? true,
            fillColor: fillColor ?? Colors.grey.shade300,
          ),
    );
  }
}
