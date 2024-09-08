import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';
import '../../../core/constant/image_asset.dart';
import '../../../core/constant/sizes.dart';

class ImageHeaderLogin extends StatelessWidget {
  const ImageHeaderLogin({
    super.key,
  });

  @override
  Widget build(BuildContext context) => SizedBox(
      width: widthScreen / 2,
      height: heightScreen / 4,
      child: ClipOval(
          child: Container(
              decoration:
                  const BoxDecoration(shape: BoxShape.circle, boxShadow: [
                BoxShadow(color: grey, blurRadius: 28),
                BoxShadow(color: greyFonce, blurRadius: 18),
                BoxShadow(color: white, blurRadius: 28)
              ]),
              child: Image.asset(AppImageAsset.login))));
}
