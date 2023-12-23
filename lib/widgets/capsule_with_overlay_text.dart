import 'package:flutter/material.dart';

import '../configs/configs.dart';

class CapsuleWithOverlayText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150, // Adjust the width as needed
      height: 50, // Adjust the height as needed
      decoration: BoxDecoration(
        borderRadius:
            BorderRadius.circular(50), // Half of the height for a capsule shape
        color: Colors.white.withOpacity(0.2),
        // Background color of the capsule
      ),
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Text(
            'See Details →',
            style: TextStyle(
              color: Colors.black,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
