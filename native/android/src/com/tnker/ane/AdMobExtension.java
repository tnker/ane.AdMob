package com.tnker.ane;

import android.util.Log;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREExtension;

public class AdMobExtension implements FREExtension
{
	@Override
	public FREContext createContext(String arg0)
	{
		Log.i("AdMobExtension", "createContext");
		
		FREContext context = new AdMobContext();
		return context;
	}
	@Override
	public void dispose()
	{
		Log.i("AdMobExtension", "dispose");
	}
	@Override
	public void initialize()
	{
		Log.i("AdMobExtension", "initialize");
	}
}
