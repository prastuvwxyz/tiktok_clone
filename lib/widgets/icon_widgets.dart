import 'package:flutter/material.dart';
import 'package:tiktok_clone/theme/colors.dart';

Widget getAlbum(img) {
  return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(image: NetworkImage(img), fit: BoxFit.cover)));
}

Widget getIcons(icon, size, count) {
  return Column(
    children: [
      Icon(
        icon,
        color: white,
        size: size,
      ),
      SizedBox(
        height: 3,
      ),
      Text(
        count,
        style:
            TextStyle(color: white, fontSize: 10, fontWeight: FontWeight.w500),
      )
    ],
  );
}

Widget getProfile(img) {
  return Container(
    width: 35,
    height: 35,
    child: Stack(
      children: [
        Container(
          width: 35,
          height: 35,
          decoration: BoxDecoration(
              border: Border.all(color: white),
              shape: BoxShape.circle,
              image:
                  DecorationImage(image: NetworkImage(img), fit: BoxFit.cover)),
        ),
        Positioned(
            left: 12,
            bottom: -3,
            child: Container(
              width: 12,
              height: 12,
              decoration: BoxDecoration(shape: BoxShape.circle, color: primary),
              child: Center(
                child: Icon(
                  Icons.add,
                  color: white,
                  size: 10,
                ),
              ),
            ))
      ],
    ),
  );
}
