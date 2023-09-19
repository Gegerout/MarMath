// import 'package:flutter/material.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';
// import 'package:math_app/admob_service.dart';
//
// class AdsScreen extends StatefulWidget {
//   const AdsScreen({super.key});
//
//   @override
//   State<AdsScreen> createState() => _AdsScreenState();
// }
//
// class _AdsScreenState extends State<AdsScreen> {
//   BannerAd? banner;
//
//   @override
//   void initState() {
//     super.initState();
//     createBannerAd();
//   }
//
//   void createBannerAd() {
//     banner = BannerAd(
//         size: AdSize.fullBanner,
//         adUnitId: AdmobService.bannerAdUnitId,
//         listener: AdmobService.bannerListener,
//         request: const AdRequest())..load();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomNavigationBar: banner == null
//           ? Container()
//           : Container(
//               child: AdWidget(ad: banner!),
//             ),
//     );
//   }
// }
