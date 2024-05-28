// This guard prevent the code from being compiled in the old architecture
#ifdef RCT_NEW_ARCH_ENABLED
#import "RNCardFormView.h"

#import <react/renderer/components/RNCardFormViewSpec/ComponentDescriptors.h>
#import <react/renderer/components/RNCardFormViewSpec/EventEmitters.h>
#import <react/renderer/components/RNCardFormViewSpec/Props.h>
#import <react/renderer/components/RNCardFormViewSpec/RCTComponentViewHelpers.h>

#import "RCTFabricComponentsPlugins.h"
//#import "VideoPlayer-Swift.h"

using namespace facebook::react;

@interface RNCardFormView () <RCTRNCardFormViewViewProtocol>
// @interface RNCardFormView () <RNCardFormViewDirectEventDelegate, RCTRNCardFormViewViewProtocol>
@end

@implementation RNCardFormView {
//    VideoPlayer * _swiftPlayer;
UIView *_view;
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
        _view = [[UIView alloc] init];
        self.contentView = _view;
        //The remaining part of the initializer is standard Objective-C code to create views and layout them with AutoLayout. Here we can change whatever we want to.
//        _swiftPlayer = [[VideoPlayer alloc] init];
//        _swiftPlayer.delegate = self;
//
//
//        self.contentView = _swiftPlayer;
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


    //Check every prop and update it if needed
    // if (oldViewProps.src != newViewProps.src) {
    //     NSString * srcToConvert = [[NSString alloc] initWithUTF8String: newViewProps.src.c_str()];
    //     _swiftPlayer.src = srcToConvert;
    // }

    // if (oldViewProps.reachabilityNetworkTestingURL != newViewProps.reachabilityNetworkTestingURL) {
    //     NSString * reachabilityNetworkTestingURLToConvert = [[NSString alloc] initWithUTF8String: newViewProps.reachabilityNetworkTestingURL.c_str()];
    //     _swiftPlayer.reachabilityNetworkTestingURL = reachabilityNetworkTestingURLToConvert;
    // }

    // if (_swiftPlayer.looped != newViewProps.looped) {
    //     _swiftPlayer.looped = newViewProps.looped;
    // }

    // if (_swiftPlayer.muted != newViewProps.muted) {
    //     _swiftPlayer.muted = newViewProps.muted;
    // }

    // if (_swiftPlayer.paused != newViewProps.paused) {
    //     _swiftPlayer.paused = newViewProps.paused;
    // }

    // if (_swiftPlayer.suspended != newViewProps.suspended) {
    //     _swiftPlayer.suspended = newViewProps.suspended;
    // }

    // if (_swiftPlayer.autoRecoveryEnabled != newViewProps.autoRecoveryEnabled) {
    //     _swiftPlayer.autoRecoveryEnabled = newViewProps.autoRecoveryEnabled;
    // }

    // if (_swiftPlayer.reverseProxyEnabled != newViewProps.reverseProxyEnabled) {
    //     _swiftPlayer.reverseProxyEnabled = newViewProps.reverseProxyEnabled;
    // }

    // if (_swiftPlayer.isLive != newViewProps.isLive) {
    //     _swiftPlayer.isLive = newViewProps.isLive;
    // }

    // if (_swiftPlayer.shouldPlayFromLastPlayback != newViewProps.shouldPlayFromLastPlayback) {
    //     _swiftPlayer.shouldPlayFromLastPlayback = newViewProps.shouldPlayFromLastPlayback;
    // }

    // if (_swiftPlayer.waitToMinimizeStalling != newViewProps.waitToMinimizeStalling) {
    //     _swiftPlayer.waitToMinimizeStalling = newViewProps.waitToMinimizeStalling;
    // }

    // if (_swiftPlayer.itemCurrentTime != newViewProps.itemCurrentTime) {
    //     _swiftPlayer.itemCurrentTime = newViewProps.itemCurrentTime;

    // }

    // if (_swiftPlayer.preferredForwardBufferDuration != newViewProps.preferredForwardBufferDuration) {
    //     _swiftPlayer.preferredForwardBufferDuration = newViewProps.preferredForwardBufferDuration;
    // }

    // if (_swiftPlayer.rate != newViewProps.rate) {
    //     _swiftPlayer.rate = newViewProps.rate;
    // }

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

// - (void)onEndEvent {
//     if(_eventEmitter){
//         std::dynamic_pointer_cast<const RNCardFormViewEventEmitter>(_eventEmitter)
//         ->onEnd( RNCardFormViewEventEmitter::OnEnd{});
//     }

// }


// - (void)onErrorEventWithErrorMessage:(NSString * _Nonnull)errorMessage errorLog:(NSString * _Nonnull)errorLog errorCode:(NSString * _Nonnull)errorCode lastState:(NSString * _Nonnull)lastState hlsError:(NSString * _Nonnull)hlsError url:(NSString * _Nonnull)url rx:(float)rx ry:(float)ry currentTime:(double)currentTime {
//     if(_eventEmitter){
//         std::dynamic_pointer_cast<const RNCardFormViewEventEmitter>(_eventEmitter)
//         ->onError(RNCardFormViewEventEmitter::OnError{
//             .errorMessage = std::string([errorMessage UTF8String]),
//             .errorLog = std::string([errorLog UTF8String]),
//             .errorCode = std::string([errorCode UTF8String]),
//             .lastState = std::string([lastState UTF8String]),
//             .hlsError = std::string([hlsError UTF8String]),
//             .url = std::string([url UTF8String]),
//             .rx = static_cast<Float>(rx),
//             .ry = static_cast<Float>(ry),
//             .currentTime = static_cast<double>(currentTime),
//         });
//     }
// }


// - (void)onHeadphonesDisconnectedEvent {
//     if(_eventEmitter){
//         std::dynamic_pointer_cast<const RNCardFormViewEventEmitter>(_eventEmitter)
//         ->onHeadphonesDisconnected( RNCardFormViewEventEmitter::OnHeadphonesDisconnected{});
//     }
// }


// - (void)onLoadEventWithSeekableDuration:(double)seekableDuration currentPosition:(double)currentPosition rx:(float)rx ry:(float)ry {
//     if(_eventEmitter){
//         std::dynamic_pointer_cast<const RNCardFormViewEventEmitter>(_eventEmitter)
//         ->onLoad(RNCardFormViewEventEmitter::OnLoad{
//             .seekableDuration = static_cast<double>(seekableDuration),
//             .currentPosition = static_cast<double>(currentPosition),
//             .rx = static_cast<Float>(rx),
//             .ry = static_cast<Float>(ry)
//         });
//     }
// }


// - (void)onPlaybackChangedEventWithCurrentTime:(double)currentTime playing:(BOOL)playing rx:(float)rx ry:(float)ry {
//     if (_eventEmitter) {
//         std::dynamic_pointer_cast<const RNCardFormViewEventEmitter>(_eventEmitter)
//         ->onPlaybackChanged(RNCardFormViewEventEmitter::OnPlaybackChanged{
//             .currentTime = static_cast<double>(currentTime),
//             .playing = static_cast<bool>(playing),
//             .rx = static_cast<Float>(rx),
//             .ry = static_cast<Float>(ry),
//         });
//     }
// }

// - (void)onLoadStartEvent {
//     if (_eventEmitter) {
//         std::dynamic_pointer_cast<const RNCardFormViewEventEmitter>(_eventEmitter)
//         ->onLoadStart( RNCardFormViewEventEmitter::OnLoadStart{});
//     }
// }

// - (void)onBufferEventWithIsBuffering:(BOOL)isBuffering currentTime:(double)currentTime rx:(float)rx ry:(float)ry {
//     if(_eventEmitter){
//         std::dynamic_pointer_cast<const RNCardFormViewEventEmitter>(_eventEmitter)
//         ->onBuffer( RNCardFormViewEventEmitter::OnBuffer{
//             .currentTime = static_cast<double>(currentTime),
//             .isBuffering = static_cast<bool>(isBuffering),
//             .rx = static_cast<Float>(rx),
//             .ry = static_cast<Float>(ry)
//         });
//     }
// }


// - (void)onProgressEventWithCurrentTime:(double)currentTime seekableDuration:(double)seekableDuration {
//     if(_eventEmitter){
//         std::dynamic_pointer_cast<const RNCardFormViewEventEmitter>(self->_eventEmitter)
//         ->onProgress(RNCardFormViewEventEmitter::OnProgress{
//             .currentTime = static_cast<double>(currentTime),
//             .seekableDuration = static_cast<double>(seekableDuration)
//         });
//     }
// }


// - (void)onSeekEventWithCurrentTime:(double)currentTime time:(double)time {
//     if(_eventEmitter){
//         std::dynamic_pointer_cast<const RNCardFormViewEventEmitter>(_eventEmitter)
//         ->onSeek(RNCardFormViewEventEmitter::OnSeek{
//             .currentTime = static_cast<double>(currentTime),
//             .time = static_cast<double>(time)
//         });
//     }
// }

// - (void)handleCommand:(const NSString *)commandName args:(const NSArray *)args {
//     RCTRNCardFormViewHandleCommand(self, commandName, args);
// }

// - (void)goLive {
//     [_swiftPlayer goLive];
// }

// - (void)seek:(double)time {
//     [_swiftPlayer seek:time];
// }

// - (void)seekWithTolerance:(double)time toleranceBefore:(double)toleranceBefore toleranceAfter:(double)toleranceAfter {
//     [_swiftPlayer seek:time toleranceBefore:toleranceBefore toleranceAfter:toleranceAfter];
// }

// - (void)seekBy:(double)time {
//     [_swiftPlayer seekBy:time];
// }

@end
#endif
