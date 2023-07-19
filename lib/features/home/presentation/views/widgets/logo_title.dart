import 'package:flutter/material.dart';

import '../../../../../core/resources_manager/assets_manager.dart';
import '../../../../../core/resources_manager/style_manager.dart';

class LogoTitle extends StatelessWidget {
  const LogoTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Column(
      children:
      [
         Text('ألغازي',
          style: StyleManager.title.copyWith(
            fontSize: height*0.1
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:
           [
           Image(
             image: const AssetImage( AssetsManager.brain ),
              height: height * 0.2,
              width: width*0.2,
            ),
            SizedBox(width: width*0.05,),
            Text('فكــــر',
              style:StyleManager.subtitle.copyWith(
                fontSize: height*0.08
              ),
            ),
          ],
        ),
      ],
    );
  }
}
