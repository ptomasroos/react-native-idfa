package com.PTR.IDFA;

import android.content.Intent;

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
        try {
            AdvertisingIdClient.Info adInfo = AdvertisingIdClient.getAdvertisingIdInfo(this.getReactApplicationContext());
            String adId = adInfo != null ? adInfo.getId() : "";
            promise.resolve(adId);
        } catch (Exception e) {
            promise.reject(e);
        }
    }

    @ReactMethod
    public void openSettings() {
      Intent dialogIntent = new Intent(android.provider.Settings.ACTION_SETTINGS);
               dialogIntent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        getReactApplicationContext().startActivity(dialogIntent);
    }
}
