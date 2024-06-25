#import <Foundation/Foundation.h>
#import <React/RCTBridgeModule.h>
#import <React/RCTViewManager.h>
#import "STPCardFormViewDelegate.h"
#import "stripe_react_native-Swift.h"


#ifdef RCT_NEW_ARCH_ENABLED

#import "RNCardFormView.h"
@interface CardFormManagerNewArch : RCTViewManager

@end
@implementation CardFormManagerNewArch
RCT_EXPORT_MODULE(CardForm)
- (UIView *)view {
  return [[RNCardFormView alloc] init];
}

#else
@interface RCT_EXTERN_MODULE(CardFormManager, RCTViewManager)
#endif

RCT_EXPORT_VIEW_PROPERTY(onFormComplete, RCTDirectEventBlock)
RCT_EXPORT_VIEW_PROPERTY(dangerouslyGetFullCardDetails, BOOL)
RCT_EXPORT_VIEW_PROPERTY(autofocus, BOOL)
RCT_EXPORT_VIEW_PROPERTY(cardStyle, NSDictionary)
RCT_EXPORT_VIEW_PROPERTY(disabled, BOOL)
RCT_EXPORT_VIEW_PROPERTY(preferredNetworks, NSArray)
RCT_EXTERN_METHOD(focus:(nonnull NSNumber*) reactTag)
RCT_EXTERN_METHOD(blur:(nonnull NSNumber*) reactTag)
@end


