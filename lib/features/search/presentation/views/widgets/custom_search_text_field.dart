import 'package:flutter/material.dart';

class CustomSearchField extends StatelessWidget {
  const CustomSearchField({
    super.key,
    required this.textEditingController,
    required this.onPressed,
  });

  final void Function()? onPressed;
  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      decoration: InputDecoration(
        border: customOutlinedInputBorder(),
        enabledBorder: customOutlinedInputBorder(),
        focusedBorder: customOutlinedInputBorder(),
        hintText: 'Search',
        suffixIcon: IconButton(
          onPressed: onPressed,
          icon: const Opacity(
            opacity: .8,
            child: Icon(Icons.search_rounded),
          ),
        ),
      ),
    );
  }
}

InputBorder customOutlinedInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    borderSide: BorderSide(
      color: Colors.white.withOpacity(0.5),
    ),
  );
}
