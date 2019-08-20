//
//  QRCodePicker.h
//  dashixiong
//
//  Created by developer@1ziton.com on 2019/5/22.
//  Copyright © 2019 Facebook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface QRCodePicker : NSObject

-(instancetype)initWithViewController:(UIViewController *)vc;
@property(nonatomic,strong)UIViewController *viewController;

- (void)selectQRCodeMethod;

@end

NS_ASSUME_NONNULL_END
