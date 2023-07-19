import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:word_game/core/local/cache_helper_keys.dart';
import 'package:word_game/core/manager/app_cubit.dart';
import 'package:word_game/core/manager/app_states.dart';

import '../resources_manager/colors_manager.dart';
import '../resources_manager/style_manager.dart';

class DefaultAppBar extends StatelessWidget {
  DefaultAppBar({super.key,
      required this.text,
     this.sizeIcon=30.0,
     this.coloricon=ColorsManager.iconColor,
     this.colortext= Colors.white,
    this.icon,
    this.fontSize=16.0,
    this.paddingLeft=8.0,
    this.paddingRight=8.0,


  });
    final String text;
    double sizeIcon;
   Color colortext ;
  Color coloricon ;
  IconData? icon;
  double fontSize ;
  double paddingLeft;
  double paddingRight;




  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
        builder: (context,state){return AppBar(
      backgroundColor: ColorsManager.primaryColor,
      elevation: 0.0,
      leading: Padding(
        padding: const EdgeInsets.all( 5.0),
        child: InkWell(
          onTap: ()
          {
            Navigator.pop(context);
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              Icon(
                IconlyBroken.arrowLeftCircle,
                color: coloricon,
                size: sizeIcon,
              ),
              const SizedBox(width: 5,),

              Align(
                alignment: Alignment.topCenter,
                child: Text(
                  'رجوع',
                  style: TextStyle(
                      fontSize: fontSize,
                      color: Colors.white,
                      fontFamily: 'Title',
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      leadingWidth: 100.0,
      title:Text(
        text,
        style: StyleManager.normal.copyWith(fontSize: 24),
      ),
      centerTitle: true,
      actions: [
        Row(
          children:  [
            Text(
              "${CacheHelperKeys.solvedNumber! + (CacheHelperKeys.collectionIndex!*10) }",
              style: StyleManager.normal,
            ),
          ],
        ),
        Padding(
          padding:  EdgeInsets.only(left: paddingLeft,right: paddingRight),
          child: Icon(
            icon,
            color: Colors.amber,
          ),
        )
      ],
    );},
        listener: (context,state){}
    );
  }
}
