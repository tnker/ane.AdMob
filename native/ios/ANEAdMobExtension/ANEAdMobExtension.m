#include "FlashRuntimeExtensions.h"

#import "GADBannerView.h"

// -----------------------------------------------
//
// AdMob Methods
//
// -----------------------------------------------

FREObject admobInitialize(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[])
{
  NSLog(@"Entering fluctInitialize()");
  
  id delegate     = [[UIApplication sharedApplication] delegate];
  UIWindow* stage = [delegate window];
  
  GADBannerView* _banner = [[GADBannerView alloc] initWithFrame:
                            CGRectMake(0, 0, GAD_SIZE_320x50.width, GAD_SIZE_320x50.height)];
  _banner.adUnitID = @"adID";
  _banner.rootViewController = stage.rootViewController;
  
  [stage addSubview:_banner];
  [_banner loadRequest:[GADRequest request]];
  
  NSLog(@"Exiting fluctInitialize()");
  return NULL;
}

// -----------------------------------------------
//
// Library Methods
//
// -----------------------------------------------

// ContextInitializer
void ContextInitializer(void* extData, const uint8_t* ctxType, FREContext ctx, uint32_t* numFunctionsToTest, const FRENamedFunction** functionsToSet)
{
  NSLog(@"Entering ContextInitializer()");
  *numFunctionsToTest = 1;
  
  FRENamedFunction* func = (FRENamedFunction*) malloc(sizeof(FRENamedFunction) * 1);
  
  func[0].name          = (const uint8_t*)"admobInitialize";
  func[0].functionData  = NULL;
  func[0].function      = &admobInitialize;;
  
  *functionsToSet = func;
  NSLog(@"Exiting ContextInitializer()");
}
// ContextFinalizer
void ContextFinalizer(FREContext ctx)
{
  NSLog(@"Entering ContextFinalizer()");
  // Nothing to clean up.
  NSLog(@"Exiting ContextFinalizer()");
	return;
}

// ExtInitializer
void ExtInitializer(void** extDataToSet, FREContextInitializer* ctxInitializerToSet, FREContextFinalizer* ctxFinalizerToSet)
{
  NSLog(@"Entering ExtInitializer()");
  *extDataToSet         = NULL;
  *ctxInitializerToSet  = &ContextInitializer;
  *ctxFinalizerToSet    = &ContextFinalizer;
  NSLog(@"Exiting ExtInitializer()");
}
// ExtFinalizer
void ExtFinalizer(void* extData)
{
  NSLog(@"Entering ExtFinalizer()");
  // Nothing to clean up.
  NSLog(@"Exiting ExtFinalizer()");
  return;
}
