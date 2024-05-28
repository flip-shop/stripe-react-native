#import <Foundation/Foundation.h>
#import <React/RCTBridgeModule.h>
#import <React/RCTViewManager.h>

@interface RCT_EXTERN_MODULE(CardFormManager, RCTViewManager)
RCT_EXPORT_VIEW_PROPERTY(onFormComplete, RCTDirectEventBlock)
RCT_EXPORT_VIEW_PROPERTY(dangerouslyGetFullCardDetails, BOOL)
RCT_EXPORT_VIEW_PROPERTY(autofocus, BOOL)
RCT_EXPORT_VIEW_PROPERTY(cardStyle, NSDictionary)
RCT_EXPORT_VIEW_PROPERTY(disabled, BOOL)
RCT_EXPORT_VIEW_PROPERTY(preferredNetworks, NSArray)
RCT_EXTERN_METHOD(focus:(nonnull NSNumber*) reactTag)
RCT_EXTERN_METHOD(blur:(nonnull NSNumber*) reactTag)
@end


#ifdef RCT_NEW_ARCH_ENABLED
RCT_EXPORT_MODULE(RNVideoPlayer)
- (UIView *)view {
  return [[RNVideoPlayer alloc] init];
}
#else
// Non fabic implementation
RCT_EXPORT_MODULE(VideoPlayer)
- (UIView *)view {
  return [[VideoPlayer alloc] initWithNewArch: NO];
}
#endif