import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  RewardedAd? rewardedAd;
  bool isLoaded=false;
  @override
  void didChangeDependcies(){
    super.didChangeDependencies();
    RewardedAd.load(
        adUnitId:"ca-app-pub-3940256099942544/5224354917",
        request: AdRequest(),
        rewardedAdLoadCallback: RewardedAdLoadCallback(
            onAdLoaded: (ad){
              print("loaded");
              rewardedAd=ad;
              setState(() {
                isLoaded=true;
              });
            },
            onAdFailedToLoad: (error){
              print("failed");
            }
        ),
    );
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(onPressed: (){
          rewardedAd?.show(onUserEarnedReward: (ad,reward){

          }
          );
        },

            child: Text("watch")),
      ),
    );
  }
}
