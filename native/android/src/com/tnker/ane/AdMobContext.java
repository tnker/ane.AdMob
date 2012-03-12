package com.tnker.ane;

import java.util.HashMap;
import java.util.Map;

import android.util.Log;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;
import com.tnker.ane.functions.AdMobFunction;

public class AdMobContext extends FREContext
{

	@Override
	public void dispose()
	{
		Log.i("AdMobContext","dispose");
	}

	@Override
	public Map<String, FREFunction> getFunctions()
	{
		Log.i("AdMobContext","getFunction");
		
		HashMap<String, FREFunction> functionMap = new HashMap<String, FREFunction>();
		
		functionMap.put("admobInitialize", new AdMobFunction());
		
		return functionMap;
	}

}
