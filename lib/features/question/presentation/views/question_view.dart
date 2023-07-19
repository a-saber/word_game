import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:word_game/core/manager/app_cubit.dart';
 import 'package:word_game/features/question/presentation/views/widgets/appbar_action.dart';
import 'package:word_game/features/question/presentation/views/widgets/appbar_leading.dart';
import 'package:word_game/features/question/presentation/views/widgets/appbar_title.dart';
import 'package:word_game/features/question/presentation/views/widgets/question_view_body.dart';

import '../../../../core/ads/admob_service.dart';

class QuestionView extends StatefulWidget {
  const QuestionView({Key? key}) : super(key: key);

  @override
  State<QuestionView> createState() => _QuestionViewState();
}

class _QuestionViewState extends State<QuestionView> {
  BannerAd? bannerAd;
  @override
  void initState() {
    createBannerAdd();
    super.initState();
  }


  void createBannerAdd(){
    bannerAd = BannerAd(
      size: AdSize.fullBanner,
      adUnitId: AdMobService.bannerAdUnitId!,
      listener: AdMobService.bannerAdListener,
      request: const AdRequest() ,
    )..load();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 250, 208, 233),
      appBar: AppBar(
        leadingWidth: 110,
        leading: const AppbarLeading(),
        centerTitle: true,
        title: const AppbarTitle(),
        actions: const
        [
          AppbarAction(),
        ],
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: const SafeArea(child: QuestionViewBody()),
      bottomNavigationBar: bannerAd == null ?
      Container():
      SizedBox(
        height: 52.0,
        child: AdWidget(ad: bannerAd!,),
      ),
    );
  }
}
