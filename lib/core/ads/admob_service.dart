import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdMobService
{
  static String? get bannerAdUnitId
  {
    if(Platform.isAndroid){
      return 'ca-app-pub-3940256099942544/6300978111';
    }
    else if (Platform.isIOS){
      return 'ca-app-pub-9027973219088949/5333531850';
    }
    return null;
  }
  static String? get interstitialAdUnitId
  {
    if(Platform.isAndroid){
      return 'ca-app-pub-3940256099942544/1033173712';
    }
    else if (Platform.isIOS){
      return 'ca-app-pub-9027973219088949/2132653443';
    }
    return null;
  }
  static String? get rewardedAdUnitId
  {
    if(Platform.isAndroid){
      return 'ca-app-pub-3940256099942544/5224354917';
    }
    else if (Platform.isIOS){
      return 'ca-app-pub-9027973219088949/2028711661';
    }
    return null;
  }
  static final BannerAdListener bannerAdListener = BannerAdListener(
    onAdLoaded: (ad) => debugPrint('Ad loaded.'),
    onAdFailedToLoad: (ad, error){
      ad.dispose();
      debugPrint('Ad Failed to load: $error');
    },
    onAdOpened: (ad)=>debugPrint('Ad opened'),
    onAdClosed:  (ad)=>debugPrint('Ad opened'),
  );
}