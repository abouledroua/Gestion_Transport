import 'package:flutter/material.dart';

import '../../core/constant/color.dart';

class LoadingBarWidget extends StatelessWidget {
  final String? title;
  const LoadingBarWidget({Key? key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
      height: 50,
      padding: const EdgeInsets.only(top: 6),
      child: Center(
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
            const CircularProgressIndicator(),
            const SizedBox(width: 25),
            Text((title != null) ? title! : 'Chargement en cours',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(color: green2))
          ])));
}
