import 'dart:ui';

import 'package:flutter/material.dart';

class CustomPlayButton extends StatelessWidget {
  const CustomPlayButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.bottomRight,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Container(
            width: 35,
            height: 35,
            color: Colors.transparent,
            child: Stack(
              children: [
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                  child: Container(),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      color: Colors.white.withOpacity(0.13),
                    ),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.white.withOpacity(0.15),
                        Colors.white.withOpacity(0.05)
                      ],
                    ),
                  ),
                ),
                const Center(
                  child: Icon(Icons.play_arrow),
                )
              ],
            ),
          ),
        ));
  }
}
