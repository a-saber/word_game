import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:word_game/core/core_widget/toasts.dart';
import 'package:word_game/error_screen.dart';
import 'package:word_game/core/local/cache_helper_keys.dart';
import 'package:word_game/core/local/cashe_helper.dart';
import 'package:word_game/features/home/presentation/views/home_view.dart';

import 'core/manager/app_cubit.dart';
import 'firebase_options.dart';
late double height ;
late double width ;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await CacheHelper.init();
  await initCacheVariables();
  await MobileAds.instance.initialize().then((value) => ()
  {
    print("7777777777777777777777");
    print(value.adapterStatuses.toString());
    print(value.isBlank);
    print(value.toString());
  }).catchError((error){print("55555555555555");print(error.toString());});

  FirebaseFirestore.instance.collection('lock').doc("2KRCDILxAVrNj3WWQBgD").get().then((value)
  {
    print(value.data().toString());
    if (value.data()!["myLock"] == true)
    {
      runApp( MyApp(widget: HomeView(),));
    }
    else {
      runApp( MyApp(widget: ErrorScreen(),));

    }
  }).catchError((error)
  {
    runApp( MyApp(widget: ErrorScreen(),));
  });
  //runApp( MyApp(widget: ErrorScreen(),));

}

class MyApp extends StatelessWidget {
   MyApp({super.key, this.widget });
   Widget? widget;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return BlocProvider(
        create: (BuildContext context) => AppCubit(),
        child : GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              fontFamily: 'Normal'
          ),
          title: 'Word Game',
          //home: const QuestionView()
          home: widget
      )
    );
  }
}


Future initCacheVariables() async
{
  CacheHelperKeys.collectionIndex = await CacheHelper.getData(key: CacheHelperKeys.collectionIndexKey);
  CacheHelperKeys.questionIndex = await CacheHelper.getData(key: CacheHelperKeys.questionIndexKey);
  CacheHelperKeys.coinsNumber = await CacheHelper.getData(key: CacheHelperKeys.coinsKey);
  CacheHelperKeys.solvedNumber = await CacheHelper.getData(key: CacheHelperKeys.solvedKey);
  if ( CacheHelperKeys.collectionIndex == null)
  {
    await CacheHelper.saveData(key: CacheHelperKeys.collectionIndexKey, value: 0);
    CacheHelperKeys.collectionIndex = 0;
  }
  if ( CacheHelperKeys.questionIndex == null)
  {
    await CacheHelper.saveData(key: CacheHelperKeys.questionIndexKey, value: 0);
    CacheHelperKeys.questionIndex =0;
  }
  if ( CacheHelperKeys.coinsNumber == null)
  {
    await CacheHelper.saveData(key: CacheHelperKeys.coinsKey, value: 0);
    CacheHelperKeys.coinsNumber =0;
  }
  if ( CacheHelperKeys.solvedNumber == null)
  {
    await CacheHelper.saveData(key: CacheHelperKeys.solvedKey, value: 0);
    CacheHelperKeys.solvedNumber =0;
  }
  print('22222222222222222222222222');
  print(CacheHelperKeys.collectionIndex);
  print(CacheHelperKeys.questionIndex);
  print(CacheHelperKeys.coinsNumber);
  print(CacheHelperKeys.solvedNumber);


}