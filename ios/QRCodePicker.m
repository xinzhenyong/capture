//
//  QRCodePicker.m
//  dashixiong
//
//  Created by developer@1ziton.com on 2019/5/22.
//  Copyright © 2019 Facebook. All rights reserved.
//

#import "QRCodePicker.h"
#import <AVFoundation/AVFoundation.h>
#import "WQCodeScanner.h"

@implementation QRCodePicker

-(instancetype)initWithViewController:(UIViewController *)vc{
  self=[super init];
  self.viewController=vc;
  return self;
}

- (void)selectQRCodeMethod{
  WQCodeScanner *scanner = [[WQCodeScanner alloc] init];
  [self.viewController presentViewController:scanner animated:YES completion:nil];
  scanner.resultBlock = ^(NSString *value) {
    //获取到条形码
    NSString *qrCodeValue =[NSString stringWithFormat:@"%@", value];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"sendCustomEventNotification" object:nil userInfo:@{@"qrCodeValue":qrCodeValue}];
    NSLog(@"所获取到扫描码为value为%@",value);
  };
}

@end

































//    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:value message:@"" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
//    [alertView show];


