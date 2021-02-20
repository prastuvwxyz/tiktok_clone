import 'package:flutter/material.dart';
import 'package:tiktok_clone/theme/colors.dart';

class UploadIcon extends StatelessWidget {
  const UploadIcon({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 30,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            child: Container(
              width: 30,
              height: 25,
              decoration: BoxDecoration(
                  color: secondary, borderRadius: BorderRadius.circular(8)),
            ),
          ),
          Positioned(
            right: 0,
            child: Container(
              width: 30,
              height: 25,
              decoration: BoxDecoration(
                  color: primary, borderRadius: BorderRadius.circular(8)),
            ),
          ),
          Positioned(
            right: 5,
            child: Container(
              width: 30,
              height: 25,
              decoration: BoxDecoration(
                  color: white, borderRadius: BorderRadius.circular(8)),
              child: Icon(Icons.add),
            ),
          )
        ],
      ),
    );
  }
}
