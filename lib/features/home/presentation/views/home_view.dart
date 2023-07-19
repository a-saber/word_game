import 'package:flutter/material.dart';
import 'package:word_game/features/home/presentation/views/widgets/home_view_body.dart';

import '../../../../core/resources_manager/colors_manager.dart';
import '../../../../main.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    height  = MediaQuery.of(context).size.height;
    width  = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor:ColorsManager.primaryColor ,
      body: const SafeArea(
          child:  HomeViewBody()
      ),
    );
  }
}
