package com.PTR.IDFA;

import android.content.ContentResolver;
import android.provider.Settings;

import com.facebook.react.bridge.Promise;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.google.android.gms.ads.identifier.AdvertisingIdClient;

public class IDFA extends ReactContextBaseJavaModule {

    public IDFA(ReactApplicationContext reactContext) {
        super(reactContext);
    }

    @Override
    public String getName() {
        return "PTRIDFA";
    }

    @ReactMethod
    public void getIDFA(Promise promise) {
        String advertisingID = "";
        boolean limitAdTracking = false;
//        try {
//            AdvertisingIdClient.Info adInfo = AdvertisingIdClient.getAdvertisingIdInfo(this.getReactApplicationContext());
//
//            String adId = null;
//            if (adInfo.isLimitAdTrackingEnabled()) {
//                adId = "";
//            } else {
//                adId = adInfo != null ? adInfo.getId() : "";
//            }
//
//            promise.resolve(adId);
//        } catch (Exception e) {
//            promise.reject(e);
//        }

        try {
            ContentResolver cr = getReactApplicationContext().getContentResolver();

            // get user's tracking preference
            limitAdTracking = (Settings.Secure.getInt(cr, "limit_ad_tracking") != 0);

            // get advertising
            advertisingID = Settings.Secure.getString(cr, "advertising_id");

            // Send promise back
            promise.resolve(!limitAdTracking ? advertisingID : "");

        } catch (Settings.SettingNotFoundException ex) {
            promise.reject(ex);
        }
    }
}
