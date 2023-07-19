import 'package:flutter/material.dart';
import 'package:word_game/features/home/presentation/views/widgets/home_options.dart';
import 'package:word_game/features/home/presentation/views/widgets/logo_title.dart';
import 'package:word_game/features/home/presentation/views/widgets/sound_button.dart';

import '../../../../../core/resources_manager/delay_manager.dart';


class HomeViewBody extends StatefulWidget {
  const HomeViewBody({Key? key}) : super(key: key);

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;

  @override
  void initState() {

    super.initState();
    initAnimation();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height  = MediaQuery.of(context).size.height;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children:
      [
        const SoundButton(),
        const LogoTitle(),
        SizedBox(height:height*0.01,),
       Padding(
         padding: const EdgeInsets.only(top: 0.0),
         child: HomeOptions(slidingAnimation: slidingAnimation,),
       )
      ],
    );
  }

  void initAnimation()
  {
    animationController = AnimationController(
        vsync: this,
        duration: DelayManager.durationOptionsAppear
    );
    slidingAnimation = DelayManager.tweenOptionsAppearAnimation.animate(animationController);
    animationController.forward();
    slidingAnimation.addListener(()
    {
      setState(() {});
    });
  }
}
