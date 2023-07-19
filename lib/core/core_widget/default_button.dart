import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:word_game/core/core_widget/navigate.dart';
import 'package:word_game/core/local/cache_helper_keys.dart';

import '../manager/app_cubit.dart';
import '../resources_manager/colors_manager.dart';

class DefaultButton extends StatelessWidget {
  DefaultButton({
    this.groupIndex=0,
    this.isGroup = false,
    this.icon,
    required this.function,
    required this.text,
    this.width = 250.0,
    this.height = 60.0,
    this.radius = 0.0,
    this.paddingLeft = 15.0,
    this.paddingRight = 35.0,
    this.sizefont = 25.0,
    this.sizeIcon = 10.0,
    this.coloricon = ColorsManager.iconColor,
    this.colorbutton = ColorsManager.buttonColor,
    this.colortext = Colors.white,
    this.mainAxisAlignment = MainAxisAlignment.start,
  });

  int groupIndex;
  bool isGroup;
  IconData? icon;
  void Function()? function;
  final String text;
  double width;
  double height;
  double sizeIcon;
  double sizefont;
  Color colortext;

  Color coloricon;

  Color colorbutton;

  MainAxisAlignment mainAxisAlignment;
  double radius;
  double paddingLeft;
  double paddingRight;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              radius,
            ),
            border: Border.all(
              width: 3,
              color: Colors.white,
            ),
            color: isGroup?
            CacheHelperKeys.collectionIndex! >= groupIndex ?
                Colors.amber :
            ColorsManager.buttonColor:
            ColorsManager.buttonColor
            ,
            boxShadow: const
            [
              BoxShadow(
                color: Colors.black,
                offset: Offset(
                  5.0,
                  5.0,
                ), //Offset
                blurRadius: 10.0,
                spreadRadius: 2.0,
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: mainAxisAlignment,
            children: [
              isGroup  ?
              Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index)
                        {
                          if ( CacheHelperKeys.collectionIndex! == groupIndex &&
                              CacheHelperKeys.solvedNumber!  > index)
                          {
                            return const Icon(
                              Icons.star_rounded,

                              color: Colors.white,
                            );
                          }
                          if(CacheHelperKeys.collectionIndex! > groupIndex)
                          {
                            return Icon(
                              Icons.star_rounded  ,
                              color: CacheHelperKeys.collectionIndex! > groupIndex ?
                              Colors.white :
                              CacheHelperKeys.collectionIndex! == groupIndex ?
                              CacheHelperKeys.solvedNumber!  > index?
                              Colors.amber:
                              Colors.white
                                  :
                              Colors.transparent ,

                            );
                          }


                            return Icon(
                              Icons.star_border  ,
                              color: CacheHelperKeys.collectionIndex! > groupIndex ?
                              Colors.white :
                              CacheHelperKeys.collectionIndex! == groupIndex ?
                              ((CacheHelperKeys.solvedNumber! )/2).floor() > index?
                                  Colors.amber:
                                  Colors.white
                                  :
                              Colors.transparent ,

                            );

                        },
                        separatorBuilder: (context, index) => const SizedBox(width: 0.0,),
                        itemCount: 5
                    ),
                  )
              :
              Padding(
                padding: EdgeInsets.only(right: paddingRight, left: paddingLeft),
                child: Icon(
                  icon,
                  size: sizeIcon,
                  color: coloricon,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 70.0),
                  child: Center(
                    child: Text(
                      text,
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                        color: colortext,
                        fontSize: sizefont,
                        fontFamily: 'Title',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
