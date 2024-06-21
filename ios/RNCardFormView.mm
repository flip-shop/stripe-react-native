// This guard prevent the code from being compiled in the old architecture
#ifdef RCT_NEW_ARCH_ENABLED
#import "RNCardFormView.h"

#import <react/renderer/components/RNCardFormViewSpec/ComponentDescriptors.h>
#import <react/renderer/components/RNCardFormViewSpec/EventEmitters.h>
#import <react/renderer/components/RNCardFormViewSpec/Props.h>
#import <react/renderer/components/RNCardFormViewSpec/RCTComponentViewHelpers.h>
#import <React/RCTConversions.h>

#import "RCTFabricComponentsPlugins.h"
#import "stripe_react_native-Swift.h"

using namespace facebook::react;

@interface RNCardFormView () <RNCardFormViewDirectEventDelegate, RCTRNCardFormViewViewProtocol>
@end

@implementation RNCardFormView {
   CardFormView *_view;
}

+ (ComponentDescriptorProvider)componentDescriptorProvider
{
   return concreteComponentDescriptorProvider<RNCardFormViewComponentDescriptor>();
}

- (instancetype)initWithFrame:(CGRect)frame
{
   self = [super initWithFrame:frame];
   if (self) {
       static const auto defaultProps = std::make_shared<const RNCardFormViewProps>();
       _props = defaultProps;
       _view = [[CardFormView alloc] init];
       _view.eventDelegate = self;
       self.contentView = _view;
   }

   return self;
}

# pragma mark - Life cycle

- (void)prepareForRecycle {
   [super prepareForRecycle];
   static const auto defaultProps = std::make_shared<const RNCardFormViewProps>();

   [self updateProps:defaultProps oldProps:_props];
   _props = defaultProps;
}

# pragma mark - updateProps

// why we need this func -> https://reactnative.dev/docs/next/the-new-architecture/pillars-fabric-components#write-the-native-ios-code
- (void)updateProps:(Props::Shared const &)props oldProps:(Props::Shared const &)oldProps
{
   const auto &oldViewProps = *std::static_pointer_cast<RNCardFormViewProps const>(_props);
   const auto &newViewProps = *std::static_pointer_cast<RNCardFormViewProps const>(props);

   if (_view.autofocus != newViewProps.autofocus) {
       _view.autofocus = newViewProps.autofocus;
   }

    if (_view.disabled != newViewProps.disabled) {
        _view.disabled = newViewProps.disabled;
    }
   
//    if (_view.cardStyle != newViewProps.cardStyle) { // easy way to compare?
    RNCardFormViewCardStyleStruct cardStyle = newViewProps.cardStyle;
    _view.cardStyle = @{
        @"backgroundColor": RCTNSStringFromString(cardStyle.backgroundColor),
        @"borderWidth": @(cardStyle.borderWidth),
        @"borderColor": RCTNSStringFromString(cardStyle.borderColor),
        @"borderRadius": @(cardStyle.borderRadius),
        @"textColor": RCTNSStringFromString(cardStyle.textColor),
        @"fontSize": @(cardStyle.fontSize),
        @"placeholderColor": RCTNSStringFromString(cardStyle.placeholderColor),
        @"cursorColor": RCTNSStringFromString(cardStyle.cursorColor),
        @"textErrorColor": RCTNSStringFromString(cardStyle.textErrorColor),
        @"fontFamily": RCTNSStringFromString(cardStyle.fontFamily)
    };
//    }

//    if (_view.preferredNetworks != newViewPr ops.preferredNetworks) { // easy way to compare without iterating?
        NSMutableArray<NSNumber *> *array = [NSMutableArray arrayWithCapacity:newViewProps.preferredNetworks.size()];
        for (int value : newViewProps.preferredNetworks) {
            [array addObject:@(value)];
        }
        _view.preferredNetworks = array;
//    }
    
    if (_view.dangerouslyGetFullCardDetails != newViewProps.dangerouslyGetFullCardDetails) {
        _view.dangerouslyGetFullCardDetails = newViewProps.dangerouslyGetFullCardDetails;
    }
   
   [super updateProps:props oldProps:oldProps];
}

- (void)updateEventEmitter:(const facebook::react::EventEmitter::Shared &)eventEmitter{
   [super updateEventEmitter: eventEmitter];

}

Class<RCTComponentViewProtocol> RNCardFormViewCls(void)
{
   return RNCardFormView.class;
}

//MARK: RNCardFormViewDirectEventDelegate
- (void)onFormCompleteEventWithExpiryMonth:(NSNumber *)expiryMonth 
                                expiryYear:(NSNumber *)expiryYear
                                  complete:(BOOL)complete
                                     brand:(NSString *)brand
                                     last4:(NSString *)last4
                                postalCode:(NSString *)postalCode
                                   country:(NSString *)country
                                    number:(NSString *)number
                                       cvc:(NSString *)cvc {


    if(_eventEmitter) {
        std::dynamic_pointer_cast<const RNCardFormViewEventEmitter>(_eventEmitter)
        ->onFormComplete(RNCardFormViewEventEmitter::OnFormComplete{
            .expiryMonth = static_cast<int>(expiryMonth.intValue),
            .expiryYear = static_cast<int>(expiryYear.intValue),
            .complete = static_cast<bool>(complete),
            .brand = std::string(brand.UTF8String),
            .last4 = std::string(last4.UTF8String),
            .postalCode = std::string(postalCode.UTF8String),
            .country = std::string(country.UTF8String),
            .number = std::string(number.UTF8String),
            .cvc = std::string(cvc.UTF8String)
        });
    }
}
@end
#endif
