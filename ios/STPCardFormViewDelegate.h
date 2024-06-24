//
//  STPCardFormViewDelegate.h
//  Pods
//
//  Created by Dariusz Ciesla on 24/06/2024.
//

#ifndef STPCardFormViewDelegate_h
#define STPCardFormViewDelegate_h

#ifdef RCT_NEW_ARCH_ENABLED
#import <React/RCTViewComponentView.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class STPCardFormView;

@protocol STPCardFormViewDelegate <NSObject>
- (void)cardFormView:(STPCardFormView *)form didChangeToStateComplete:(BOOL)complete;
@end

NS_ASSUME_NONNULL_END

#endif /* RCT_NEW_ARCH_ENABLED */



#endif /* STPCardFormViewDelegate_h */
