package com.tnker.ane.functions;

import android.app.Activity;
import android.util.Log;
import android.view.ViewGroup;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;
import com.adobe.fre.FREObject;
import com.google.ads.AdRequest;
import com.google.ads.AdSize;
import com.google.ads.AdView;
import com.tnker.ane.AdMobContext;

public class AdMobFunction implements FREFunction
{
	@Override
	public FREObject call(FREContext arg0, FREObject[] arg1)
	{
		Log.i("AdMobFunction", "call");
		
		AdMobContext _context = (AdMobContext) arg0;
		Activity _activity = _context.getActivity();
		ViewGroup root = (ViewGroup) _activity.getWindow().getDecorView();
		
		AdView adview = new AdView(_activity, AdSize.BANNER, "###ADMOB_ID###");
		root.addView(adview);
		
		adview.loadAd(new AdRequest());
		
		return null;
	}
}
