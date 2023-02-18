import 'package:flutter/material.dart';
import 'package:uteer/view/constant/ui_colors.dart';
import 'package:uteer/view/constant/ui_text_styles.dart';

class TextFormFieldWidget extends StatefulWidget {
  const TextFormFieldWidget({
    required this.textController,
    required this.hintLabel,
    super.key,
    required this.iconPassword,
    required this.isEnabled,
  });
  final TextEditingController textController;
  final String hintLabel;
  final bool isEnabled;
  final bool iconPassword;

  @override
  State<TextFormFieldWidget> createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
  bool isCheckPass = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: widget.isEnabled,
      controller: widget.textController,
      obscureText: widget.iconPassword ? isCheckPass : false,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(left: 21, top: 17, bottom: 17),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide(color: UIColors.background, width: 1.0),
          ),
          filled: true,
          hintStyle: UITextStyles.hint,
          suffixIcon: widget.iconPassword
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      isCheckPass = !isCheckPass;
                    });
                  },
                  icon: isCheckPass
                      ? Icon(
                          Icons.remove_red_eye_sharp,
                          size: 20,
                          color: UIColors.eye,
                        )
                      : Icon(
                          Icons.remove_red_eye_sharp,
                          size: 20,
                          color: UIColors.eye,
                        ))
              : null,
          hintText: widget.hintLabel,
          fillColor: widget.isEnabled ? UIColors.white : UIColors.border),
    );
  }
}
