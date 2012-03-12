package com.tnker.ane
{
	import flash.external.ExtensionContext;

public class AdMob
{
	private const EXTENSION_ID:String = "com.tnker.ane.admob";
	private var context:ExtensionContext;
	
	public function AdMob()
	{
		context = ExtensionContext.createExtensionContext(EXTENSION_ID,null);
	}
	
	public function admobInitialize():void
	{
		context.call("admobInitialize");
	}
	
	public function dispose():void
	{
		return context.dispose();
	}
}
}