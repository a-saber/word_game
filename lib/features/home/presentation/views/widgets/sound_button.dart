import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../../../../../core/resources_manager/colors_manager.dart';

class SoundButton extends StatelessWidget {
  const SoundButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Align(
        alignment: Alignment.topLeft,
        child: IconButton(
          onPressed:  (){},
          icon: const Icon(
            IconlyBroken.volumeUp,
            color: ColorsManager.iconColor,
            size: 30,
          ),
        ),
      ),
    );
  }
}
