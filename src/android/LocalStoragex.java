package com.example.localstoragex;

import android.content.SharedPreferences;
import android.preference.PreferenceManager;
import org.apache.cordova.*;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class LocalStoragex extends CordovaPlugin {

    @Override
    public boolean execute(String action, JSONArray args, CallbackContext callbackContext) throws JSONException {
        SharedPreferences prefs = PreferenceManager.getDefaultSharedPreferences(this.cordova.getActivity());
        SharedPreferences.Editor editor = prefs.edit();

        switch (action) {
            case "setItem":
                String key = args.getString(0);
                String value = args.getString(1);
                editor.putString(key, value);
                editor.apply();
                callbackContext.success("Item stored");
                return true;

            case "getItem":
                key = args.getString(0);
                value = prefs.getString(key, null);
                if (value != null) {
                    callbackContext.success(value);
                } else {
                    callbackContext.error("Item not found");
                }
                return true;

            case "removeItem":
                key = args.getString(0);
                editor.remove(key);
                editor.apply();
                callbackContext.success("Item removed");
                return true;

            case "clear":
                editor.clear();
                editor.apply();
                callbackContext.success("All items cleared");
                return true;

            case "getAll":
                JSONObject allItems = new JSONObject();
                for (String prefKey : prefs.getAll().keySet()) {
                    allItems.put(prefKey, prefs.getString(prefKey, null));
                }
                callbackContext.success(allItems);
                return true;

            default:
                return false;
        }
    }
}