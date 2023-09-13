import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdmobService {
  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-3991053540680389/1425646828';
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }

  static final BannerAdListener bannerListener = BannerAdListener(
    onAdLoaded: (ad) {
      debugPrint("Ad loaded");
    },
    onAdFailedToLoad: (ad, err) {
      debugPrint('Failed to load a banner ad: ${err.message}');
      ad.dispose();
    },
  );
}